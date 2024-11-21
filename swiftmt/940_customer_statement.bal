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

# Defines the elements of the MT940 message block 4.
#
# + MT20 - Transaction Reference
# + MT25 - Account Identification
# + MT25P - Account Identification
# + MT21 - Related Reference 
# + MT28C - Statement Number/Sequence Number
# + MT60F - Opening Balance
# + MT61 - Statement Line 
# + MT86 - Information Account Owner
# + MT62F - Closing Balance
# + MT64 - Closing Balance Available 
# + MT65 - Forward Balance Available 
# + MT60M - Intermediate Opening Balance
# + MT62M - Intermediate Closing Balance
public type MT940Block4 record {|
    MT20 MT20;
    MT21 MT21?;
    MT25A MT25?;
    MT25P MT25P?;
    MT28C MT28C;
    MT60F MT60F;
    MT60M[] MT60M?;
    MT61[] MT61?;
    MT86[] MT86?;
    MT62F MT62F;
    MT62M[] MT62M?;
    MT64[] MT64?;
    MT65[] MT65?;
|};

# Defines the structure of an MT940 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing transaction details 
# + block5 - Trailer Block 
# + unparsedTexts - Any additional unparsed texts
public type MT940Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT940Block4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};
