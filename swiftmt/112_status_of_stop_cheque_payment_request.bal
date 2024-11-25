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

# Defines the elements of the MT112 message block 4.
#
# + MT20 - Sender's Reference  
# + MT21 - Check Number Reference 
# + MT30 - Date of Issue  
# + MT32A - Amount (Option A) 
# + MT32B - Amount (Option B)    
# + MT52A - Drawer Bank (Option A)  
# + MT52B - Drawer Bank (Option B)  
# + MT52D - Drawer Bank (Option D)    
# + MT59 - Payee    
# + MT76 - Answers
public type MT112Block4 record {|
    MT20 MT20;
    MT21 MT21;
    MT30 MT30;
    MT32A MT32A?;
    MT32B MT32B?;
    MT52A MT52A?;
    MT52B MT52B?;
    MT52D MT52D?;
    MT59 MT59?;
    MT76 MT76;
|};

# Defines the structure of an MT112 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing transaction details 
# + block5 - Trailer Block 
# + unparsedTexts - Any additional unparsed texts
public type MT112Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT112Block4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};
