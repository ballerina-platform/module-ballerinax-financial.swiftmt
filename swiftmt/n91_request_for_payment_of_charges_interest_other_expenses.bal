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

# Defines the elements of the MTn91 message block 4.
#
# + MT20 - Transaction Reference  
# + MT21 - Related Reference  
# + MT32B - Currency Code and Amount
# + MT52A - Ordering Institution (Option A)
# + MT52D - Ordering Institution (Option D)
# + MT57A - Account With Institution (Option A)
# + MT57B - Account With Institution (Option B)
# + MT57D - Account With Institution (Option D)
# + MT71B - Details of Charges Information
# + MT72 - Sender to Receiver Information
public type MTn91Block4 record {|
    MT20 MT20;
    MT21 MT21;
    MT32B MT32B;
    MT52A MT52A?;
    MT52D MT52D?;
    MT57A MT57A?;
    MT57B MT57B?;
    MT57D MT57D?;
    MT71B MT71B;
    MT72 MT72?;
|};

# Defines the structure of the MTn91 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing transaction details 
# + block5 - Trailer Block 
# + unparsedTexts - Any additional unparsed texts
public type MTn91Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MTn91Block4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};
