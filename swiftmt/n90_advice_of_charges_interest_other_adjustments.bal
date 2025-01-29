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

# Defines the elements of the MTn90 message block 4.
#
# + MT20 - Transaction Reference  
# + MT21 - Related Reference  
# + MT25 - Account Identification 
# + MT32C - Value Date, Currency Code, and Amount
# + MT32D - Value Date, Currency Code, and Amount
# + MT52A - Ordering Institution (Option A)
# + MT52D - Ordering Institution (Option D)
# + MT71B - Details of Charges Information
# + MT72 - Sender to Receiver Information
public type MTn90Block4 record {|
    MT20 MT20;
    MT21 MT21;
    MT25A MT25;
    MT32A MT32C?;
    MT32A MT32D?;
    MT52A MT52A?;
    MT52D MT52D?;
    MT71B MT71B;
    MT72 MT72?;
|};

# Defines the structure of the MTn90 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing transaction details 
# + block5 - Trailer Block 
# + unparsedTexts - Any additional unparsed texts
public type MTn90Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MTn90Block4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};
