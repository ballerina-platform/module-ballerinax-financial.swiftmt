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

# Defines the elements of the MT942 message block 4.
#
# + MT13D - Date/Time Indication
# + MT20 - Transfer Reference
# + MT21 - Related Reference 
# + MT25 - Account Identification 
# + MT25P - Account Identification
# + MT28C - Statement Number/Sequence Number
# + MT34F - Credit Floor Indicator (Array)
# + MT61 - Statement Line 
# + MT86 - Information to Account Owner
# + MT90C - Number and Sum of Credit Entries
# + MT90D - Number and Sum of Debit Entries
public type MT942Block4 record {|
    MT13D MT13D;
    MT20 MT20;
    MT21 MT21?;
    MT25A MT25?;
    MT25P MT25P?;
    MT28C MT28C;
    MT34F[] MT34F;
    MT61[] MT61?;
    MT86[] MT86?;
    MT90C MT90C?;
    MT90D MT90D?;
|};

# Defines the structure of an MT942 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing transaction details 
# + block5 - Trailer Block 
# + unparsedTexts - Any additional unparsed texts
public type MT942Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT942Block4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};
