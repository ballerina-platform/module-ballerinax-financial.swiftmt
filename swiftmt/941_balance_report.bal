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

# Defines the elements of the MT941 message block 4.
#
# + MT13D - Date/Time Indication
# + MT20 - Transfer Reference
# + MT21 - Related Reference 
# + MT25 - Account Identification 
# + MT25P - Account Identification
# + MT28 - Statement Number/Sequence Number
# + MT60F - Opening Balance 
# + MT62F - Closing Balance 
# + MT64 - Closing Available Balance
# + MT65 - Forward Available Balance
# + MT86 - Information to Account Owner
# + MT90C - Number and Sum of Credit Entries
# + MT90D - Number and Sum of Debit Entries
public type MT941Block4 record {|
    MT20 MT20;
    MT21 MT21?;
    MT25A MT25?;
    MT25P MT25P?;
    MT28 MT28;
    MT13D MT13D?;
    MT60F MT60F?;
    MT90D MT90D?;
    MT90C MT90C?;
    MT62F MT62F;
    MT64[] MT64?;
    MT65[] MT65?;
    MT86[] MT86?;
|};

# Defines the structure of an MT941 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing transaction details 
# + block5 - Trailer Block 
# + unparsedTexts - Any additional unparsed texts
public type MT941Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT941Block4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};
