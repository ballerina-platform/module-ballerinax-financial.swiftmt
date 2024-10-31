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

# Defines the elements of the MT935 message block 4.
#
# + MT20 - Transaction Reference Reference 
# + MT23 - Further Identification
# + MT25 - Account Identification 
# + MT30 - Effective Date of New Rate    
# + MT37H - New Interest Rate
# + MT72 - Sender to Receiver Information
public type MT935Block4 record {|
    MT20 MT20;
    MT23Id MT23?;
    MT25A MT25?;
    MT30 MT30;
    MT37H MT37H;
    MT72 MT72?;
|};

# Defines the structure of an MT935 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing transaction details 
# + block5 - Trailer Block 
# + unparsedTexts - Any additional unparsed texts
public type MT935Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT935Block4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};

# Defines the MT23Id field in block 4.
#
# + name - The name of the field  
# + Ccy - The currency
# + NumOfDays - Number of days
# + Fnctn - Function
public type MT23Id record {|
    string name?;
    Ccy Ccy;
    NumOfDays NumOfDays?;
    Fnctn Fnctn;
|};

# Defines the function in the requested message.
#
# + content - The content in the function  
# + number - The attribute number
public type Fnctn record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the number of days in the requested message.
#
# + content - The content in the number of days  
# + number - The attribute number
public type NumOfDays record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT37H field in block 4.
#
# + name - The name of the field  
# + Indctr - The indicator
# + Sgn - The sign
# + Rt - The rate 
public type MT37H record {|
    string name?;
    Indctr Indctr;
    Sgn Sgn?;
    Rt Rt;
|};

# Defines the indicator in the requested message.
#
# + content - The content in the indicator  
# + number - The attribute number
public type Indctr record {|
    string content;
    @xmldata:Attribute
    string number?;
|};
