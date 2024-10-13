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

# Defines the structure of an MT101 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing transaction details 
# + block5 - Trailer Block 
# + UnparsedTexts - Any additional unparsed texts
public type MT101Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT101Block4 block4;
    Block5 block5?;
    UnparsedTexts UnparsedTexts?;
|};

# Define the transacions in the MT101 message.
#
# + MT50C - Instructing Party (Option C) 
# + MT50L - Instructing Party (Option L) 
# + MT21 - Transaction Reference  
# + MT21F - F/X Deal Reference  
# + MT32B - Currency/Transaction Amount  
# + MT50F - Ordering Customer (Option F) 
# + MT50G - Ordering Customer (Option G)
# + MT50H - Ordering Customer (Option H)  
# + MT57C - Account with Institution (Option C)  
# + MT59F - Beneficiary Customer (Option F)  
# + MT70 - Remmitance Information  
# + MT77B - Regulatory Reporting  
# + MT33B - Currency/Instructed Amount  
# + MT71A - Detail's of Charges  
# + MT25A - Charges Account (Option A) 
# + MT36 -  Exchange Rate
# + MT23E - Instruction Code (Option E)  
# + MT52A - Account Servicing Institution (Option A)  
# + MT56A - Intermediary (Option A)  
# + MT56C - Intermediary (Option C)  
# + MT56D - Intermediary (Option D)  
# + MT57A - Account with Institution (Option A)  
# + MT57D - Account with Institution (Option D)  
# + MT52C - Account Servicing Institution (Option C)  
# + MT59 -  Beneficiary Customer 
# + MT59A - Beneficiary Customer (Option A)
public type MT101Transaction record {|
    MT50C MT50C?;
    MT50L MT50L?;
    MT21 MT21;
    MT21F MT21F?;
    MT32B MT32B;
    MT50F MT50F?;
    MT50G MT50G?;
    MT50H MT50H?;
    MT57C MT57C?;
    MT59F MT59F?;
    MT70 MT70?;
    MT77B MT77B?;
    MT33B MT33B?;
    MT71A MT71A;
    MT25A MT25A?;
    MT36 MT36?;
    MT23E[] MT23E?;
    MT52A MT52A?;
    MT56A MT56A?;
    MT56C MT56C?;
    MT56D MT56D?;
    MT57A MT57A?;
    MT57D MT57D?;
    MT52C MT52C?;
    MT59 MT59?;
    MT59A MT59A?;
|};

# Defines the elements of the MT101 message block 4.
#
# + MT20 - Sender's Reference
# + MT21R - Customer Specified Reference
# + MT28D - Message Index, indicating the sequence of the message
# + MT30 - Requested Execution Date for the payment
# + MT25 - Authorization
# + MT50C - Instructing Party (Option C)
# + MT50L - Instructing Party (Option L)
# + MT50F - Ordering Customer (Option F)
# + MT50G - Ordering Customer (Option G)
# + MT50H - Ordering Customer (Option H)
# + MT51A - Sending Institution
# + MT52A - Account Servicing Institution (Option A)
# + MT52C - Account Servicing Institution (Option C)
# + Transaction - An array of transactions containing the detailed payment instructions
public type MT101Block4 record {|
    MT20 MT20;
    MT21R MT21R?;
    MT28D MT28D;
    MT30 MT30;
    MT25 MT25?;
    MT50C MT50C?;
    MT50L MT50L?;
    MT50F MT50F?;
    MT50G MT50G?;
    MT50H MT50H?;
    MT51A MT51A?;
    MT52A MT52A?;
    MT52C MT52C?;
    MT101Transaction[] Transaction;
|};
