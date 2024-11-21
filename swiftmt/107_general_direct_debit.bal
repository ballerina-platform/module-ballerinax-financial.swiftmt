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

# Defines the elements of the MT107 message block 4.
#
# + MT19 - Sum of Amounts
# + MT20 - Sender's Reference
# + MT21E - Instruction Code (Option E)
# + MT23E - Instruction Code (Array)
# + MT26T - Transaction Type Code
# + MT30 - Execution Date
# + MT32B - Currency/Transaction Amount
# + MT50A - Creditor (Option A)
# + MT50C - Instructing Party (Option C)
# + MT50L - Instructing Party (Option L)
# + MT50K - Creditor (Option K)
# + MT51A - Sending Institution
# + MT52A - Creditor's Bank (Option A)
# + MT52C - Creditor's Bank (Option C)
# + MT52D - Creditor's Bank (Option D)
# + MT53A - Sender's Correspondant (Option A)
# + MT53B - Sender's Correspondant (Option B)
# + MT71A - Details of Charges
# + MT71F - Sender's Charges Information (Option F)
# + MT71G - Receiver's Charges Information (Option G)
# + MT72 - Sender to Receiver Information
# + MT77B - Regulatory Reporting
# + Transaction - An array of transactions containing the detailed payment instructions
public type MT107Block4 record {|
    MT20 MT20;
    MT23E MT23E?;
    MT21E MT21E?;
    MT30 MT30;
    MT51A MT51A?;
    MT50C MT50C?;
    MT50L MT50L?;
    MT50A MT50A?;
    MT50K MT50K?;
    MT52A MT52A?;
    MT52C MT52C?;
    MT52D MT52D?;
    MT26T MT26T?;
    MT77B MT77B?;
    MT71A MT71A?;
    MT72 MT72?;
    MT107Transaction[] Transaction;
    MT32B MT32B;
    MT19 MT19?;
    MT71F MT71F?;
    MT71G MT71G?;
    MT53A MT53A?;
    MT53B MT53B?;
|};

# Defines the transaction-related elements of an MT104 message.
#
# + MT21 - Transaction Reference
# + MT21C - Cash Settlements
# + MT21D - Regulatory Information
# + MT21E - Instruction Code
# + MT23E - Instruction Code (Array)
# + MT26T - Transaction Type Code
# + MT32B - Currency/Transaction Amount
# + MT33B - Currency/Instructed Amount
# + MT36 - Exchange Rate
# + MT50A - Creditor (Option A)
# + MT50C - Instructing Party (Option C)
# + MT50L - Instructing Party (Option L)
# + MT50K - Creditor (Option K)
# + MT52A - Creditor's Bank (Option A)
# + MT52C - Creditor's Bank (Option C)
# + MT52D - Creditor's Bank (Option D)
# + MT57A - Debtor's Bank (Option A)
# + MT57C - Debtor's Bank (Option C)
# + MT57D - Debtor's Bank (Option D)
# + MT59 - Debtor
# + MT59A - Debtor (Option A)
# + MT70 - Remittance Information
# + MT71A - Details of Charges
# + MT71F - Sender's Charges Information (Option F)
# + MT71G - Receiver's Charges Information (Option G)
# + MT77B - Regulatory Reporting
public type MT107Transaction record {|
    MT21 MT21;
    MT23E MT23E?;
    MT21C MT21C?;
    MT21D MT21D?;
    MT21E MT21E?;
    MT32B MT32B;
    MT50C MT50C?;
    MT50L MT50L?;
    MT50A MT50A?;
    MT50K MT50K?;
    MT52A MT52A?;
    MT52C MT52C?;
    MT52D MT52D?;
    MT57A MT57A?;
    MT57C MT57C?;
    MT57D MT57D?;
    MT59 MT59?;
    MT59A MT59A?;
    MT70 MT70?;
    MT26T MT26T?;
    MT77B MT77B?;
    MT33B MT33B?;
    MT71A MT71A?;
    MT71F MT71F?;
    MT71G MT71G?;
    MT36 MT36?;
|};

# Defines the structure of an MT107 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing transaction details 
# + block5 - Trailer Block 
# + unparsedTexts - Any additional unparsed texts
public type MT107Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT107Block4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};
