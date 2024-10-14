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

import ballerina/data.xmldata;

# Defines the elements of the MT103REMIT message block 4.
#
# + MT20 - Sender's Reference
# + MT13C - Time Indication
# + MT23B - Bank Operation Code
# + MT23E - Instruction Code (Array)
# + MT26T - Transaction Type Code
# + MT32A - Value Date, Currency Code, and Amount
# + MT33B - Currency/Instructed Amount
# + MT36 - Exchange Rate
# + MT50A - Ordering Customer (Option A)
# + MT50F - Ordering Customer (Option F)
# + MT50K - Ordering Customer (Option K)
# + MT51A - Sending Institution
# + MT52A - Ordering Institution (Option A)
# + MT52D - Ordering Institution (Option D)
# + MT53A - Sender’s Correspondent (Option A)
# + MT53B - Sender’s Correspondent (Option B)
# + MT53D - Sender’s Correspondent (Option D)
# + MT54A - Receiver's Correspondent (Option A)
# + MT54B - Receiver's Correspondent (Option B)
# + MT54D - Receiver's Correspondent (Option D)
# + MT55A - Third Reimbursement Institution (Option A)
# + MT55B - Third Reimbursement Institution (Option B)
# + MT55D - Third Reimbursement Institution (Option D)
# + MT56A - Intermediary (Option A)
# + MT56C - Intermediary (Option C)
# + MT56D - Intermediary (Option D)
# + MT57A - Account With Institution (Option A)
# + MT57B - Account With Institution (Option B)
# + MT57C - Account With Institution (Option C)
# + MT57D - Account With Institution (Option D)
# + MT59 - Beneficiary Customer
# + MT59A - Beneficiary Customer (Option A)
# + MT59F - Beneficiary Customer (Option F)
# + MT70 - Remittance Information
# + MT71A - Details of Charges
# + MT71F - Sender's Charges Information (Option F)
# + MT71G - Receiver's Charges Information (Option G)
# + MT72 - Sender to Receiver Information
# + MT77B - Regulatory Reporting
# + MT77T - Envelope Contents
public type MT103REMITBlock4 record {|
    MT20 MT20;
    MT13C MT13C?;
    MT23B MT23B;
    MT23E[] MT23E?;
    MT26T MT26T?;
    MT32A MT32A;
    MT33B MT33B?;
    MT36 MT36?;
    MT50A MT50A?;
    MT50F MT50F?;
    MT50K MT50K?;
    MT51A MT51A?;
    MT52A MT52A?;
    MT52D MT52D?;
    MT53A MT53A?;
    MT53B MT53B?;
    MT53D MT53D?;
    MT54A MT54A?;
    MT54B MT54B?;
    MT54D MT54D?;
    MT55A MT55A?;
    MT55B MT55B?;
    MT55D MT55D?;
    MT56A MT56A?;
    MT56C MT56C?;
    MT56D MT56D?;
    MT57A MT57A?;
    MT57B MT57B?;
    MT57C MT57C?;
    MT57D MT57D?;
    MT59 MT59?;
    MT59A MT59A?;
    MT59F MT59F?;
    MT70 MT70?;
    MT71A MT71A;
    MT71F MT71F?;
    MT71G MT71G?;
    MT72 MT72?;
    MT77B MT77B?;
    MT77T MT77T;
|};

# Defines the structure of an MT103REMIT message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing transaction details 
# + block5 - Trailer Block 
# + unparsedTexts - Any additional unparsed texts
public type MT103REMITMessage record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT103REMITBlock4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};

# Defines the MT77T field.
#
# + name - name of the block4 field  
# + EnvCntnt - content in the block4 field
public type MT77T record {|
    string name;
    EnvCntnt EnvCntnt;
|};

# Defines the content of the envelope content.
#
# + content - content of the envelope content  
# + number - attribute number of the field
public type EnvCntnt record {|
    string content;
    @xmldata:Attribute
    string number;
|};
