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

# Defines the elements of the MT950 message block 4.
#
# + MT20 - Transfer Reference
# + MT25 - Account Identification 
# + MT28C - Statement Number/Sequence Number
# + MT60F - Opening Balance 
# + MT61 - Statement Line
# + MT62F - Closing Balance 
# + MT64 - Closing Available Balance
# + MT60M - Intermediate Opening Balance 
# + MT62M - Intermediate Closing Balance 
public type MT950Block4 record {|
    MT20 MT20;
    MT25A MT25;
    MT28C MT28C;
    MT60F MT60F?;
    MT60M[] MT60M?;
    MT61[] MT61?;
    MT62F MT62F?;
    MT62M[] MT62M?;
    MT64[] MT64?;
|};

# Defines the structure of an MT950 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing transaction details 
# + block5 - Trailer Block 
# + unparsedTexts - Any additional unparsed texts
public type MT950Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT950Block4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};
