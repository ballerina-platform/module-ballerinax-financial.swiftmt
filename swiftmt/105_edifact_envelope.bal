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

import ballerina/data.xmldata;

# Defines the elements of the MT105 message block 4.
#
# + MT12 - Sub Message Type
# + MT20 - Sender's Reference
# + MT21 - Related Reference
# + MT27 - Sequence of Total
# + MT77F - EDIFACT Message
public type MT105Block4 record {|
    MT27 MT27;
    MT20 MT20;
    MT21 MT21;
    MT12 MT12;
    MT77F MT77F;
|};

# Defines the structure of an MT105 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing transaction details 
# + block5 - Trailer Block 
# + unparsedTexts - Any additional unparsed texts
public type MT105Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT105Block4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};

# Defines the MT27 field in block 4.
#
# + name - The name of the field  
# + MsgNo - The message number  
# + SeqNo - The sequence number 
public type MT27 record {|
    string name?;
    MsgNo MsgNo;
    SeqNo SeqNo;
|};

# Defines the message number.
#
# + content - The content of the message number  
# + number - The attribute number
public type MsgNo record {|
    decimal content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT77F field in block 4.
#
# + name - The name of the field  
# + Msg - The EDIFACT message   
public type MT77F record {|
    string name?;
    Msg Msg;
|};
