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

# Defines the elements of the MTn92 message block 4.
#
# + MT20 - Transaction Reference  
# + MT21 - Related Reference  
# + MT11S - MT and Date of Original Message (Option S)
# + MT11R - MT and Date of Original Message (Option R)    
# + MT76 - Answers  
# + MT77A - Narrative 
# + MT79 - Narrative Description of Original Message  
# + MessageCopy - Copy of Original Message (At least with mandatory fields)
public type MTn96Block4 record {|
    MT20 MT20;
    MT21 MT21;
    MT11R MT11R?;
    MT11S MT11S?;
    MT76 MT76;
    MT77A MT77A?;
    MT79 MT79?;
    MessageCopy MessageCopy?;
|};

# Defines the structure of the MTn92 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing transaction details 
# + block5 - Trailer Block 
# + unparsedTexts - Any additional unparsed texts
public type MTn96Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MTn96Block4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};
