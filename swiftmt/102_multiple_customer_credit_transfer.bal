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

# Defines the elements of the MT102 message block 4.
#
# + MT19 - Sum of Amounts
# + MT20 - Sender's Reference
# + MT13C - Date/Time Indication
# + MT23 - Instruction Code
# + MT26T - Transaction Type Code
# + MT32A - Value Date, Currency Code, and Amount
# + MT36 - Exchange Rate
# + MT50A - Ordering Customer (Option A)
# + MT50F - Ordering Customer (Option F)
# + MT50K - Ordering Customer (Option K)
# + MT51A - Sending Institution
# + MT52A - Ordering Institution (Option A)
# + MT52C - Ordering Institution (Option C)
# + MT53A - Sender’s Correspondent (Option A)
# + MT53C - Sender’s Correspondent (Option C)
# + MT54A - Receiver’s Correspondent (Option A)
# + MT52B - Ordering Institution (Option B)
# + MT71A - Details of Charges
# + MT71G - Reciever's Charges
# + MT72 - Sender to Receiver Information
# + MT77B - Regulatory Reporting
# + Transaction - An array of transactions containing the detailed payment instructions
public type MT102Block4 record {|
    MT20 MT20;
    MT23 MT23;
    MT51A MT51A?;
    MT50A MT50A?;
    MT50F MT50F?;
    MT50K MT50K?;
    MT52A MT52A?;
    MT52C MT52C?;
    MT26T MT26T?;
    MT77B MT77B?;
    MT71A MT71A?;
    MT36 MT36?;
    MT102Transaction[] Transaction;
    MT32A MT32A;
    MT19 MT19?;
    MT71G MT71G?;
    MT13C MT13C?;
    MT53A MT53A?;
    MT53C MT53C?;
    MT54A MT54A?;
    MT52B MT52B?;
    MT72 MT72?;
|};

# Defines the transaction-related elements of an MT102 transaction.
#
# + MT21 - Transaction Reference
# + MT26T - Transaction Type Code
# + MT33B - Currency/Instructed Amount
# + MT32B - Currency/Transaction Amount (Alternative)
# + MT36 - Exchange Rate
# + MT50A - Ordering Customer (Option A)
# + MT50F - Ordering Customer (Option F)
# + MT50K - Ordering Customer (Option K)
# + MT52A - Ordering Institution (Option A)
# + MT52C - Ordering Institution (Option C)
# + MT52B - Ordering Institution (Option B)
# + MT57A - Account with Institution (Option A)
# + MT57C - Account with Institution (Option C)
# + MT59 - Beneficiary Customer
# + MT59A - Beneficiary Customer (Option A)
# + MT59F - Beneficiary Customer (Option F)
# + MT70 - Remmitance Information
# + MT71A - Details of Charges (Option A)
# + MT71F - Sender's Charges Information (Option F)
# + MT71G - Receiver's Charges Information (Option G)
# + MT77B - Regulatory Reporting
public type MT102Transaction record {|
    MT21 MT21;
    MT32B MT32B;
    MT50A MT50A?;
    MT50F MT50F?;
    MT50K MT50K?;
    MT52A MT52A?;
    MT52C MT52C?;
    MT52B MT52B?;
    MT57A MT57A?;
    MT57C MT57C?;
    MT59 MT59?;
    MT59A MT59A?;
    MT59F MT59F?;
    MT70 MT70?;
    MT26T MT26T?;
    MT77B MT77B?;
    MT33B MT33B?;
    MT71A MT71A?;
    MT71F MT71F?;
    MT71G MT71G?;
    MT36 MT36?;
|};

# Defines the structure of an MT102 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing transaction details 
# + block5 - Trailer Block 
# + unparsedTexts - Any additional unparsed texts 
public type MT102Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT102Block4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};
