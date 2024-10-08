// Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

import swiftmt.com.prowidesoftware.swift.io as prowide;

import ballerina/data.xmldata;

# Converts a SWIFT FIN message to the corresponding SWIFT MT message type or throws an error if the type is invalid.
#
# + finMessage - The input SWIFT FIN message string to be parsed and converted into a SWIFT MT message type.
# + return - On success, returns one of the SWIFT MT message types (MT1XX, MT2XX, MT9XX, MTnXX).
# In case of an error or unsupported message type, returns an error indicating the issue.
public isolated function swiftMtParser(string finMessage) returns record {|anydata...;|}|error {
    map<typedesc<record {}>> messageMapper = {"101": MT101Message, "102": MT102Message, "102STP": MT102STPMessage, "103": MT103Message, "103STP": MT103STPMessage, "103REMIT": MT103REMITMessage, "104": MT104Message, "107": MT107Message, "200": MT200Message, "201": MT201Message, "202": MT202Message, "202COV": MT202COVMessage, "203": MT203Message, "204": MT204Message, "205": MT205Message, "205COV": MT205COVMessage, "210": MT210Message, "900": MT900Message, "910": MT910Message, "920": MT920Message, "940": MT940Message, "941": MT941Message, "942": MT942Message, "950": MT950Message, "970": MT970Message, "971": MT971Message, "972": MT972Message, "973": MT973Message, "92": MTn92Message, "95": MTn95Message, "96": MTn96Message};
    prowide:ConversionService srv = prowide:newConversionService1();
    string generatedString = srv.getXml2(finMessage, true);
    xml generatedXml = check xml:fromString(generatedString);
    xml customizedXml = check customizeGeneratedXml(generatedXml);
    string messageType = (customizedXml/**/<messageType>).data();
    string validationFlag = (customizedXml/**/<ValidationFlag>/<value>).data();
    typedesc<record {}>? messageRecord;

    if validationFlag.equalsIgnoreCaseAscii("STP") || validationFlag.equalsIgnoreCaseAscii("REMIT") || validationFlag.equalsIgnoreCaseAscii("COV") {
        messageRecord = messageMapper[messageType + validationFlag];
        if messageRecord is null {
            return error("SWIFT message type is invalid or not supported.");
        }
        return xmldata:parseAsType(customizedXml, t = messageRecord);
    }
    if check int:fromString(messageType.substring(1, 3)) >= 90 {
        messageRecord = messageMapper[messageType.substring(1, 3)];
        if messageRecord is null {
            return error("SWIFT message type is invalid or not supported.");
        }
        return xmldata:parseAsType(customizedXml, t = messageRecord);
    }
    messageRecord = messageMapper[messageType];
    if messageRecord is null {
        return error("SWIFT message type is invalid or not supported.");
    }
    return xmldata:parseAsType(customizedXml, t = messageRecord);
}

# Customizes a generated XML by renaming specific tags and components.
#
# + customXml - The input XML object that represents the SWIFT message. This XML is generated from the original SWIFT message.
# + return - Returns the customized XML with renamed tags and components. If a transaction sequence is required, it is added to the message. In case of an error, returns an error indicating the issue.
isolated function customizeGeneratedXml(xml customXml) returns xml|error {
    boolean isTransactionSequencerequired = false;
    string messageType = (customXml/**/<messageType>).data();
    boolean isNotCommonMessageType = check int:fromString(messageType.substring(1, 3)) < 90;

    foreach xml tagElement in (customXml/**/<block3>).elementChildren() {
        if (tagElement/<name>).data().equalsIgnoreCaseAscii("121") {
            tagElement.setName("NdToNdTxRef");
        } else if (tagElement/<name>).data().equalsIgnoreCaseAscii("119") {
            tagElement.setName("ValidationFlag");
        }
    }

    string[][]? csvContent1 = FIELDNAMESPEC[messageType.substring(0, 1)];
    if csvContent1 is null {
        return error("SWIFT message type is invalid or not supported.");
    }
    foreach xml tagElement in (customXml/**/<block4>).elementChildren() {
        string name = (tagElement/<name>).data();
        if name.equalsIgnoreCaseAscii("21") {
            isTransactionSequencerequired = true;
        }
        tagElement.setName("MT".concat(name));
        string componentName = "";
        foreach xml component in tagElement.elementChildren() {
            if component.getName().equalsIgnoreCaseAscii("component") {
                foreach string[] line in csvContent1 {
                    if name.equalsIgnoreCaseAscii(line[0]) {
                        foreach int index in 1 ... line.length() - 1 {
                            if index.toString() != component.getAttributes()["number"] {
                                continue;
                            }
                            if name.equalsIgnoreCaseAscii("50F") || name.equalsIgnoreCaseAscii("59F") {
                                if index > 1 {
                                    if line[index].equalsIgnoreCaseAscii("CdTyp") {
                                        foreach string[] line2 in IDENTIFYTAG {
                                            if component.data().equalsIgnoreCaseAscii(line2[0]) {
                                                componentName = line2[1];
                                                component.setName("CdTyp");
                                            }
                                        }
                                    } else {
                                        component.setName(componentName);
                                    }
                                } else {
                                    component.setName(line[index]);
                                }
                            } else {
                                component.setName(line[index]);
                            }
                        }
                    }
                }
            }
        }
    }

    if isTransactionSequencerequired && messageType.startsWith("1") && isNotCommonMessageType {
        return addTransactionSequenceForMT1XX(customXml);
    }
    if messageType.startsWith("2") && isNotCommonMessageType {
        return addTransactionSequenceForMT2XX(customXml);
    }
    if messageType.endsWith("92") || messageType.endsWith("95") || messageType.endsWith("96") {
        return addCopyOfOriginalMessage(customXml);
    }
    return customXml;
}

# Adds a transaction sequence for MT1XX message types by identifying specific tags like "21", "32A", and "59", 
# and grouping the message content accordingly into XML transactions.
#
# + customXml - The input XML that contains the SWIFT message data.
# + return - Returns the modified XML with the added transaction sequences.
isolated function addTransactionSequenceForMT1XX(xml customXml) returns xml {
    xml[] xmlArray = [];
    xml transactionXml = xml ``;
    boolean isTransactionDone = false;
    boolean isSequenceCPresent = false;

    foreach xml tagElement in (customXml/**/<block4>).elementChildren() {
        string name = tagElement.elementChildren("name").data();
        if name.equalsIgnoreCaseAscii("21") {
            xmlArray.push(transactionXml);
            transactionXml = xml ``;
            transactionXml += tagElement;
            isTransactionDone = false;
        } else if name.equalsIgnoreCaseAscii("32A") {
            xmlArray.push(transactionXml);
            transactionXml = xml ``;
            transactionXml += tagElement;
            isSequenceCPresent = true;
        } else if (name.equalsIgnoreCaseAscii("32B") && isTransactionDone) {
            xmlArray.push(transactionXml);
            transactionXml = xml ``;
            transactionXml += tagElement;
            isSequenceCPresent = true;
        } else if name.equalsIgnoreCaseAscii("59") || name.equalsIgnoreCaseAscii("59A") || name.equalsIgnoreCaseAscii("59F") {
            transactionXml += tagElement;
            isTransactionDone = true;
        } else {
            transactionXml += tagElement;
        }
    }
    xmlArray.push(transactionXml);
    xml newBlock4Xml = xmlArray[0];

    foreach int index in 1 ... xmlArray.length() - 1 {
        if isSequenceCPresent && index == xmlArray.length() - 1 {
            newBlock4Xml += xmlArray[xmlArray.length() - 1];
            break;
        }
        xml:Element rootXml = xml `<Transaction/>`;
        rootXml.setChildren(xmlArray[index]);
        newBlock4Xml += rootXml;
    }

    foreach xml block in customXml.elementChildren() {
        if block.getName().equalsIgnoreCaseAscii("block4") {
            block.setChildren(newBlock4Xml);
        }
    }
    return customXml;
}

# Adds a transaction sequence for MT2XX message types by identifying specific tags like "20","50A","50F","50K", 
# and grouping the message content accordingly into XML transactions.
#
# + customXml - The input XML that contains the SWIFT message data.
# + return - Returns the modified XML with the added transaction sequences.
isolated function addTransactionSequenceForMT2XX(xml customXml) returns xml {
    xml[] xmlArray = [];
    xml transactionXml = xml ``;
    string messageType = (customXml/**/<messageType>).data();
    string validationFlag = (customXml/**/<ValidationFlag>/<value>).data();

    foreach xml tagElement in (customXml/**/<block4>).elementChildren() {
        string name = tagElement.elementChildren("name").data();
        if name.equalsIgnoreCaseAscii("20") {
            xmlArray.push(transactionXml);
            transactionXml = xml ``;
            transactionXml += tagElement;
        } else if name.equalsIgnoreCaseAscii("50A") || (name.equalsIgnoreCaseAscii("50F") && !(messageType.equalsIgnoreCaseAscii("210"))) || name.equalsIgnoreCaseAscii("50K") {
            xmlArray.push(transactionXml);
            transactionXml = xml ``;
            transactionXml += tagElement;
        } else {
            transactionXml += tagElement;
        }
    }
    xmlArray.push(transactionXml);
    xml newBlock4Xml = xml ``;

    if messageType.equalsIgnoreCaseAscii("201") || messageType.equalsIgnoreCaseAscii("203") {
        newBlock4Xml = xmlArray[0];
    } else {
        newBlock4Xml = xmlArray[1];
    }

    if (messageType + validationFlag).equalsIgnoreCaseAscii("202COV") || (messageType + validationFlag).equalsIgnoreCaseAscii("205COV") {
        xml:Element rootXml = xml `<UndrlygCstmrCdtTrf/>`;
        rootXml.setChildren(xmlArray[2]);
        newBlock4Xml += rootXml;
    }

    foreach int index in 1 ... xmlArray.length() - 1 {
        if messageType.equalsIgnoreCaseAscii("201") || messageType.equalsIgnoreCaseAscii("203") || (messageType.equalsIgnoreCaseAscii("204") && index > 1) {
            xml:Element rootXml = xml `<Transaction/>`;
            rootXml.setChildren(xmlArray[index]);
            newBlock4Xml += rootXml;
        }
    }

    foreach xml block in customXml.elementChildren() {
        if block.getName().equalsIgnoreCaseAscii("block4") {
            block.setChildren(newBlock4Xml);
        }
    }
    return customXml;
}

# This function adds a copy of the original message content into the block 4 of a SWIFT message.
# The original message is identified after encountering the "21" tag, and certain tags (e.g., "11S", "11R", "75", "76", "77A", "79") are excluded from the copy.
# The copied original message is then encapsulated in a new XML tag `<MessageCopy>` and appended to block 4.
#
# + customXml - The input XML representing the SWIFT message with multiple tags.
# + return - Returns the modified XML with the added `<MessageCopy>` tag, which contains a copy of the original message content.
isolated function addCopyOfOriginalMessage(xml customXml) returns xml {
    xml newBlock4Xml = xml ``;
    xml originalMessageXml = xml ``;
    boolean isOriginalMessage = false;

    foreach xml tagElement in (customXml/**/<block4>).elementChildren() {
        string name = tagElement.elementChildren("name").data();
        if name.equalsIgnoreCaseAscii("21") && !isOriginalMessage {
            newBlock4Xml += tagElement;
            isOriginalMessage = true;
        } else if (!(name.equalsIgnoreCaseAscii("11S")) || !(name.equalsIgnoreCaseAscii("11R")) || !(name.equalsIgnoreCaseAscii("75")) || !(name.equalsIgnoreCaseAscii("76")) || !(name.equalsIgnoreCaseAscii("77A")) || !(name.equalsIgnoreCaseAscii("79"))) && isOriginalMessage {
            originalMessageXml += tagElement;
        } else {
            newBlock4Xml += tagElement;
        }
    }
    newBlock4Xml += xml `<MessageCopy>${originalMessageXml}</MessageCopy>`;

    foreach xml block in customXml.elementChildren() {
        if block.getName().equalsIgnoreCaseAscii("block4") {
            block.setChildren(newBlock4Xml);
        }
    }
    return customXml;
}
