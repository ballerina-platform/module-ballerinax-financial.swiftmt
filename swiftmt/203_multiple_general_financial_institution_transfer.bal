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

# Defines the elements of the MT203 message block 4.
#
# + MT19 - Sum of Amounts
# + MT30 - Value Date
# + MT52A - Ordering Institution (Option A)
# + MT52D - Ordering Institution (Option D)
# + MT53A - Sender’s Correspondent (Option A)
# + MT53B - Sender’s Correspondent (Option B)
# + MT53D - Sender’s Correspondent (Option D)
# + MT54A - Receiver’s Correspondent (Option A)
# + MT54B - Receiver’s Correspondent (Option B)
# + MT54D - Receiver’s Correspondent (Option D)
# + MT72 - Sender to Receiver Information
# + Transaction - An array of transactions containing the detailed payment instructions
public type MT203Block4 record {|
    MT19 MT19;
    MT30 MT30;
    MT52A MT52A?;
    MT52D MT52D?;
    MT53A MT53A?;
    MT53B MT53B?;
    MT53D MT53D?;
    MT54A MT54A?;
    MT54B MT54B?;
    MT54D MT54D?;
    MT72 MT72?;
    MT203Transaction[] Transaction;
|};

# Defines the transaction-related elements of an MT203 message.
#
# + MT20 - Transaction Reference
# + MT21 - Related Reference
# + MT32B - Currency Code, and Amount
# + MT56A - Intermediary (Option A)
# + MT56D - Intermediary (Option D)
# + MT57A - Account With Institution (Option A)
# + MT57B - Account With Institution (Option B)
# + MT57D - Account With Institution (Option D)
# + MT58A - Beneficiary Institution (Option A)
# + MT58D - Beneficiary Institution (Option D)
# + MT72 - Sender to Receiver Information
public type MT203Transaction record {|
    MT20 MT20;
    MT21 MT21;
    MT32B MT32B;
    MT56A MT56A?;
    MT56D MT56D?;
    MT57A MT57A?;
    MT57B MT57B?;
    MT57D MT57D?;
    MT58A MT58A?;
    MT58D MT58D?;
    MT72 MT72?;
|};

# Defines the structure of an MT203 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing transaction details 
# + block5 - Trailer Block 
# + unparsedTexts - Any additional unparsed texts
public type MT203Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT203Block4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};
