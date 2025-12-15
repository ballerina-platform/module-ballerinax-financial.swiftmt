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

import financial.swift.mt.com.prowidesoftware.swift.io as prowide;

import ballerina/data.xmldata;

# Converts a SWIFT FIN message to the corresponding SWIFT MT message type or throws an error if the type is invalid.
#
# + finMessage - The input SWIFT FIN message string to be parsed and converted into a SWIFT MT message type.
# + return - On success, returns one of the SWIFT MT message types (MT1XX, MT2XX, MT9XX, MTnXX).
# In case of an error or unsupported message type, returns an error indicating the issue.
public isolated function parse(string finMessage) returns record {}|error {
    prowide:ConversionService srv = prowide:newConversionService1();
    string generatedString = srv.getXml2(finMessage, true);
    xml generatedXml = check xml:fromString(generatedString);
    xml customizedXml = check customizeGeneratedXml(generatedXml);
    string messageType = (customizedXml/**/<messageType>).data();
    string validationFlag = (customizedXml/**/<ValidationFlag>/<value>).data();
    typedesc<record {}>? messageRecord;

    if validationFlag.equalsIgnoreCaseAscii("STP") || validationFlag.equalsIgnoreCaseAscii("REMIT") 
        || validationFlag.equalsIgnoreCaseAscii("COV") {
        messageRecord = messageMapper[messageType + validationFlag];
        if messageRecord is () {
            return error("SWIFT message type is invalid or not supported.");
        }
        return xmldata:parseAsType(customizedXml, {textFieldName: "content"}, t = messageRecord);
    }
    if messageType.length() == 3 && check int:fromString(messageType.substring(1, 3)) >= 90 {
        messageRecord = messageMapper[messageType.substring(1, 3)];
        if messageRecord is () {
            return error("SWIFT message type is invalid or not supported.");
        }
        return xmldata:parseAsType(customizedXml, {textFieldName: "content"}, t = messageRecord);
    }
    messageRecord = messageMapper[messageType];
    if messageRecord is () {
        return error("SWIFT message type is invalid or not supported.");
    }
    return xmldata:parseAsType(customizedXml, {textFieldName: "content"}, t = messageRecord);
}

# Converts a SWIFT message record into a FIN message string.
#
# This function processes a SWIFT message record and maps it to the appropriate SWIFT FIN message type based on
# the message type and validation flag. It converts the record into a FIN message using the Prowide Conversion Service.
# The function supports multiple validation flags such as `STP`, `REMIT`, and `COV`, and also handles messages with 
# a type greater than or equal to 90.
#
# + message - The SWIFT message record to be converted.
# + return - Returns the converted FIN message as a `string`, or an error if the message type is invalid or unsupported.
public isolated function toFinMessage(record {} message) returns string|error {
    xml swiftMessageXml = check xmldata:toXml(message, options = {textFieldName: "content"});
    string messageType = (swiftMessageXml/**/<messageType>).data();
    string validationFlag = (swiftMessageXml/**/<ValidationFlag>/<value>).data();
    prowide:ConversionService srv = prowide:newConversionService1();
    typedesc<record {}>? messageRecord;
    if validationFlag.equalsIgnoreCaseAscii("REMIT") || validationFlag.equalsIgnoreCaseAscii("COV") {
        messageRecord = messageMapper[messageType + validationFlag];
        if messageRecord is () {
            return error("SWIFT message type is invalid or not supported.");
        }
        return srv.getFIN(convertToProprietaryXml(swiftMessageXml).toString());
    }
    if check int:fromString(messageType.substring(1, 3)) >= 90 {
        messageRecord = messageMapper[messageType.substring(1, 3)];
        if messageRecord is () {
            return error("SWIFT message type is invalid or not supported.");
        }
        return srv.getFIN(convertToProprietaryXml(swiftMessageXml).toString());
    }
    messageRecord = messageMapper[messageType];
    if messageRecord is () {
        return error("SWIFT message type is invalid or not supported.");
    }
    return srv.getFIN(convertToProprietaryXml(swiftMessageXml).toString());
}

# Converts a SWIFT message XML into a proprietary XML format for FIN message generation.
#
# This function takes a SWIFT message in XML format and transforms it into a proprietary format required
# for generating FIN messages. 
#
# + swiftMessageXml - The SWIFT message XML to be converted.
# + return - Returns the transformed proprietary XML.
isolated function convertToProprietaryXml(xml swiftMessageXml) returns xml{
    xml block4Xml = xml ``;
    xml finalBlockXml = xml ``;
    xml:Element finalSwiftXml = xml `<message/>`;
    foreach xml:Element tagElement in (swiftMessageXml/**/<block4>).elementChildren() {
        // The fields "Transaction", "UndrlygCstmrCdtTrf" and "MessageCopy"in block4 are used to separate transaction, underlying 
        // customer credit transfer details and copy of original message in the SWIFT message during data mapping. To replicate the original SWIFT 
        // message format, these fields are now being removed.
        if tagElement.getName().equalsIgnoreCaseAscii("Transaction")  || 
           tagElement.getName().equalsIgnoreCaseAscii("Cheques")  || 
           tagElement.getName().equalsIgnoreCaseAscii("UndrlygCstmrCdtTrf") || 
           tagElement.getName().equalsIgnoreCaseAscii("MessageCopy") {
            block4Xml += tagElement.elementChildren();
            continue;
        }
        block4Xml += tagElement;
    }
    foreach xml:Element block in swiftMessageXml.elementChildren() {
        if block.getName().equalsIgnoreCaseAscii("block4") {
            block.setChildren(block4Xml);
        }
        finalBlockXml += block;
    }
    finalSwiftXml.setChildren(finalBlockXml);
    foreach xml:Element tagElement in (finalSwiftXml/**/<block3>).elementChildren() {
        tagElement.setName("tag");
    }
    foreach xml:Element tagElement in (finalSwiftXml/**/<block4>).elementChildren() {
        tagElement.setName("field");
        int count = 1;
        foreach xml:Element component in tagElement.elementChildren() {
            if count == 1 {
                component.setName("name");
                count += 1;
                continue;
            }
            component.setName("component");
        }
    }
    return finalSwiftXml;
}

# Customizes a generated XML by renaming specific tags and components.
#
# + customXml - The input XML object that represents the SWIFT message. This XML is generated from the original 
# SWIFT message.
# + return - Returns the customized XML with renamed tags and components. If a transaction sequence is required, 
# it is added to the message. In case of an error, returns an error indicating the issue.
isolated function customizeGeneratedXml(xml customXml) returns xml|error {
    boolean isTransactionSequencerequired = false;
    string messageType = (customXml/**/<messageType>).data();
    boolean isNotCommonMessageType = check int:fromString(messageType.substring(1, 3)) < 90;

    foreach xml tagElement in (customXml/**/<block3>).elementChildren() {
        if (tagElement/<name>).data().equalsIgnoreCaseAscii("121") {
            tagElement.setName("NdToNdTxRef");
        } else if (tagElement/<name>).data().equalsIgnoreCaseAscii("119") {
            tagElement.setName("ValidationFlag");
        } else if (tagElement/<name>).data().equalsIgnoreCaseAscii("111") {
            tagElement.setName("ServiceTypeIdentifier");
        }
    }

    string[][]? fieldNames = FIELD_NAME_SPEC[messageType.substring(0, 1)];

    if messageType.equalsIgnoreCaseAscii("190") {
        fieldNames = SWIFTMT_2XX_FIELD_NAME;
    }
    if fieldNames is () {
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
                foreach string[] line in fieldNames {
                    if name.equalsIgnoreCaseAscii(line[0]) {
                        foreach int index in 1 ... line.length() - 1 {
                            if index.toString() != component.getAttributes()["number"] {
                                continue;
                            }
                            if name.equalsIgnoreCaseAscii("50F") || name.equalsIgnoreCaseAscii("59F") {
                                if index > 1 {
                                    if line[index].equalsIgnoreCaseAscii("CdTyp") {
                                        foreach string[] line2 in IDENTIFY_TAG {
                                            if component.data().equalsIgnoreCaseAscii(line2[0]) {
                                                componentName = line2[1];
                                                component.setName("CdTyp");
                                                continue;
                                            }
                                        }
                                        continue;
                                    } 
                                    component.setName(componentName);
                                    continue;
                                }
                                component.setName(line[index]);
                                continue;
                            } 
                            component.setName(line[index]);
                        }
                    }
                }
            }
        }
    }

    if messageType.equalsIgnoreCaseAscii("110") {
        return addChequeSequenceForMT110(customXml);
    }
    if isTransactionSequencerequired && messageType.startsWith("10") && isNotCommonMessageType {
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
isolated function addTransactionSequenceForMT1XX(xml customXml) returns xml|error {
    xml[] xmlArray = check separateTransactionSequenceForMT1XX(customXml)[0].ensureType();
    boolean isSequenceCPresent = check separateTransactionSequenceForMT1XX(customXml)[1].ensureType();
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

# This function separates transaction sequences in an MT1XX custom XML message by analyzing specific tag elements.
# The function looks for elements like "21", "32A", "32B", "59", "59A", and "59F" to determine transaction boundaries 
# and creates separate XML sequences based on these tags.
#
# + customXml - The custom XML block containing MT1XX message data.
# + return - Returns an array containing separated transaction sequences in XML format and a boolean flag indicating 
# if Sequence C is present.
isolated function separateTransactionSequenceForMT1XX(xml customXml) returns (xml[]|boolean)[] {
    xml[] xmlArray = [];
    xml transactionXml = xml ``;
    boolean isTransactionDone = false;
    boolean isSequenceCPresent = false;

    foreach xml tagElement in customXml/**/<block4>/* {
        string name = tagElement.elementChildren("name").data();
        if name.equalsIgnoreCaseAscii("21") {
            xmlArray.push(transactionXml);
            transactionXml = xml ``;
            transactionXml += tagElement;
            isTransactionDone = false;
        } else if name.equalsIgnoreCaseAscii("32A") || (name.equalsIgnoreCaseAscii("32B") && isTransactionDone) {
            xmlArray.push(transactionXml);
            transactionXml = xml ``;
            transactionXml += tagElement;
            isSequenceCPresent = true;
        } else if name.equalsIgnoreCaseAscii("59") || name.equalsIgnoreCaseAscii("59A") 
            || name.equalsIgnoreCaseAscii("59F") {
            transactionXml += tagElement;
            isTransactionDone = true;
        } else {
            transactionXml += tagElement;
        }
    }
    xmlArray.push(transactionXml);
    return [xmlArray,isSequenceCPresent];
}

isolated function addChequeSequenceForMT110(xml customXml) returns xml {
    xml[] xmlArray = [];
    xml chequeXml = xml ``;

    foreach xml tagElement in customXml/**/<block4>/* {
        string name = tagElement.elementChildren("name").data();
        if name.equalsIgnoreCaseAscii("21") {
            xmlArray.push(chequeXml);
            chequeXml = xml ``;
        }
        chequeXml += tagElement;
    }
    xmlArray.push(chequeXml);
    xml newBlock4Xml = xmlArray[0];

    foreach int index in 1 ... xmlArray.length() - 1 {
        xml:Element rootXml = xml `<Cheques/>`;
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
    xml[] xmlArray = separateTransactionSequenceForMT2XX(customXml);
    string messageType = (customXml/**/<messageType>).data();
    string validationFlag = (customXml/**/<ValidationFlag>/<value>).data();
    xml newBlock4Xml = xml ``;

    if messageType.equalsIgnoreCaseAscii("201") || messageType.equalsIgnoreCaseAscii("203") {
        newBlock4Xml = xmlArray[0];
    } else {
        newBlock4Xml = xmlArray[1];
    }

    if (messageType + validationFlag).equalsIgnoreCaseAscii("202COV") 
        || (messageType + validationFlag).equalsIgnoreCaseAscii("205COV") {
        xml:Element rootXml = xml `<UndrlygCstmrCdtTrf/>`;
        rootXml.setChildren(xmlArray[2]);
        newBlock4Xml += rootXml;
    }

    foreach int index in 1 ... xmlArray.length() - 1 {
        if messageType.equalsIgnoreCaseAscii("201") || messageType.equalsIgnoreCaseAscii("203") 
            || (messageType.equalsIgnoreCaseAscii("204") && index > 1) {
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

# This function separates transaction sequences in an MT2XX custom XML message by identifying specific tag elements.
# It checks for tags like "20", "50A", "50F", and "50K" to determine transaction boundaries and separates the message 
# into XML fragments.
# Special handling is added for message type "210", where the "50F" tag is treated differently.
#
# + customXml - The custom XML block containing MT2XX message data.
# + return - Returns an array of separated XML transaction sequences.
isolated function separateTransactionSequenceForMT2XX(xml customXml) returns xml[] {
    xml[] xmlArray = [];
    xml transactionXml = xml ``;
    string messageType = (customXml/**/<messageType>).data();

    foreach xml tagElement in customXml/**/<block4>/* {
        string name = tagElement.elementChildren("name").data();
        if name.equalsIgnoreCaseAscii("20") {
            xmlArray.push(transactionXml);
            transactionXml = xml ``;
            transactionXml += tagElement;
        } else if name.equalsIgnoreCaseAscii("50A") || (name.equalsIgnoreCaseAscii("50F") 
            && !(messageType.equalsIgnoreCaseAscii("210"))) || name.equalsIgnoreCaseAscii("50K") {
            xmlArray.push(transactionXml);
            transactionXml = xml ``;
            transactionXml += tagElement;
        } else {
            transactionXml += tagElement;
        }
    }
    xmlArray.push(transactionXml);
    return xmlArray;
}

# This function adds a copy of the original message content into the block 4 of a SWIFT message.
# The original message is identified after encountering the "21" tag, and certain tags 
# (e.g., "11S", "11R", "75", "76", "77A", "79") are excluded from the copy.
# The copied original message is then encapsulated in a new XML tag `<MessageCopy>` and appended to block 4.
#
# + customXml - The input XML representing the SWIFT message with multiple tags.
# + return - Returns the modified XML with the added `<MessageCopy>` tag, which contains a copy of the original 
# message content.
isolated function addCopyOfOriginalMessage(xml customXml) returns xml {
    foreach xml block in customXml.elementChildren() {
        if block.getName().equalsIgnoreCaseAscii("block4") {
            block.setChildren(separateCopyOfOriginalMessage(customXml));
        }
    }
    return customXml;
}

# This function separates and identifies the original copy of an MT message from the XML data in `block4`.
# 
# It iterates through each element in the block, and once it encounters the tag "21" (which typically represents the 
# message reference),
# it starts treating the following elements as part of the original message.
# Certain tags like "11S", "11R", "75", "76", "77A", and "79" are excluded from the original message, 
# and these tags are retained in the `newBlock4Xml` section.
# The original message elements are wrapped in a new `<MessageCopy>` XML tag and appended to `newBlock4Xml`.
#
# + customXml - The input custom XML containing `block4` of an MT message.
# + return - Returns the modified XML containing both the updated `block4` and a copy of the original message wrapped 
# in `<MessageCopy>`.
isolated function separateCopyOfOriginalMessage(xml customXml) returns xml {
    xml newBlock4Xml = xml ``;
    xml originalMessageXml = xml ``;
    boolean isNotOriginalMessage = true;

    foreach xml tagElement in customXml/**/<block4>/* {
        string name = tagElement.elementChildren("name").data();
        if name.equalsIgnoreCaseAscii("20") && isNotOriginalMessage {
            newBlock4Xml += tagElement;
        } else if name.equalsIgnoreCaseAscii("21") && isNotOriginalMessage {
            newBlock4Xml += tagElement;
            isNotOriginalMessage = false;
        } else if (name.equalsIgnoreCaseAscii("11S") || name.equalsIgnoreCaseAscii("11R") 
            || name.equalsIgnoreCaseAscii("75") || name.equalsIgnoreCaseAscii("76") || name.equalsIgnoreCaseAscii("77A") 
            || name.equalsIgnoreCaseAscii("79")) {
            newBlock4Xml += tagElement;
        } else {
            originalMessageXml += tagElement;
        }
    }
    
    newBlock4Xml += xml `<MessageCopy>${originalMessageXml}</MessageCopy>`;
    return newBlock4Xml;
}
