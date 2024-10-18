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

# Defines the elements of the MT971 message block 4.
#
# + MT20 - Transaction Reference  
# + MT25 - Account Identification  
# + MT62F - Closing Balance
public type MT971Block4 record {|
    MT20 MT20;
    MT25A MT25;
    MT62F MT62F;
|};

# Defines the structure of the MT971 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing transaction details 
# + block5 - Trailer Block 
# + unparsedTexts - Any additional unparsed texts
public type MT971Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT971Block4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};
