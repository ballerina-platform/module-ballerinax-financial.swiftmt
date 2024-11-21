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

# Defines the elements of the MT205 message block 4.
#
# + MT20 - Transaction Reference
# + MT21 - Related Reference
# + MT13C - Time Indication
# + MT32A - Value Date, Currency Code, and Amount
# + MT52A - Ordering Institution (Option A)
# + MT52D - Ordering Institution (Option D)
# + MT53A - Sender’s Correspondent (Option A)
# + MT53B - Sender’s Correspondent (Option B)
# + MT53D - Sender’s Correspondent (Option D)
# + MT56A - Intermediary (Option A)
# + MT56D - Intermediary (Option D)
# + MT57A - Account With Institution (Option A)
# + MT57B - Account With Institution (Option B)
# + MT57D - Account With Institution (Option D)
# + MT58A - Beneficiary Institution (Option A)
# + MT58D - Beneficiary Institution (Option D)
# + MT59 - Beneficiary Customer 
# + MT59A - Beneficiary Customer (Option A)
# + MT59F - Beneficiary Customer (Option F)
# + MT70 - Remittance Information
# + MT72 - Sender to Receiver Information
public type MT205Block4 record {|
    MT20 MT20;
    MT21 MT21;
    MT13C MT13C?;
    MT32A MT32A;
    MT52A MT52A?;
    MT52D MT52D?;
    MT53A MT53A?;
    MT53B MT53B?;
    MT53D MT53D?;
    MT56A MT56A?;
    MT56D MT56D?;
    MT57A MT57A?;
    MT57B MT57B?;
    MT57D MT57D?;
    MT58A MT58A?;
    MT58D MT58D?;
    MT59 MT59?;
    MT59A MT59A?;
    MT59F MT59F?;
    MT70 MT70?;
    MT72 MT72?;
|};

# Defines the structure of an MT205 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing transaction details 
# + block5 - Trailer Block 
# + unparsedTexts - Any additional unparsed texts
public type MT205Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT205Block4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};
