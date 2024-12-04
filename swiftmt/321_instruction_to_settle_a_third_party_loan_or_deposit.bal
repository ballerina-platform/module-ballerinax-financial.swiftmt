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

# Defines the structure of an MT321 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing Instruction to Settle a Third Party Loan/Deposit
# + block5 - Trailer Block 
# + UnparsedTexts - Any additional unparsed texts
public type MT321Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT321Block4 block4;
    Block5 block5?;
    UnparsedTexts UnparsedTexts?;
|};

# Defines the elements of the MT321 message block 4.
#
# + MT16R - Start of Block  
# + MT20C - Reference  
# + MT23G - Function of the Message  
# + MT22H - Indicator
# + MT99B - Number Count  
# + Linkages - Linkages  
# + MT16S - End of Block
# + LoanDepositDetails - Loan/Deposit Details
# + SettlDetails - Settlement Details
public type MT321Block4 record {|
    MT16R MT16R;
    MT20C MT20C;
    MT23G MT23G;
    MT22H MT22H;
    MT99B MT99B?;
    MT321Linkages[] Linkages?;
    MT16S MT16S;
    MT321LoanDepositDetails LoanDepositDetails;
    MT321SettlDetails[] SettlDetails;
|};

# Defines the elements of MT321Linkages the MT321Block4 element.
#
# + MT16R - Start of Block  
# + MT13A - Linked Message  
# + MT20C - Reference  
# + MT16S - End of Block
public type MT321Linkages record {|
    MT16R MT16R;
    MT13A MT13A?;
    MT20C MT20C;
    MT16S MT16S;
|};

# Defines the elements of MT321LoanDepositDetails the MT321Block4 element.
#
# + MT16R - Start of Block 
# + MT20C - Contract Number Reference  
# + MT22H - Indicator  
# + MT98A - Date/Time  
# + MT19A - Amount  
# + MT92A - Rate  
# + MT99B - Number Count
# + MT94C - Payment Clearing Centre
# + LoanDepositParties1 - Loan/Deposit Parties 1 
# + LoanDepositParties2 - Loan/Deposit Parties 2
# + OtherParties - Other Parties
public type MT321LoanDepositDetails record {|
    MT16R MT16R;
    MT20C MT20C;
    MT22H MT22H;
    MT98A MT98A;
    MT19A MT19A;
    MT92A MT92A;
    MT99B MT99B?;
    MT94C MT94C?;
    MT321LoanDepositParties1 LoanDepositParties1;
    MT321LoanDepositParties2 LoanDepositParties2;
    MT321OtherParties OtherParties;
|};

# Defines the elements of MT321LoanDepositParties1 the MT321LoanDepositDetails element.
#
# + MT16R - Start of Block  
# + MT95A - Loan/Deposit Counterparty
# + MT16S - End of Block
public type MT321LoanDepositParties1 record {|
    MT16R MT16R;
    MT95A MT95A;
    MT16S MT16S;
|};

# Defines the elements of MT321LoanDepositParties2 the MT321LoanDepositDetails element.
#
# + MT16R - Start of Block  
# + MT95A - Investor  
# + MT97A - Safekeeping Account 
# + MT16S - End of Block
public type MT321LoanDepositParties2 record {|
    MT16R MT16R;
    MT95A MT95A?;
    MT97A MT97A;
    MT16S MT16S;
|};

# Defines the elements of MT321OtherParties the MT321LoanDepositDetails element.
#
# + MT16R - Start of Block 
# + MT95A - Party  
# + MT16S - End of Block
public type MT321OtherParties record {|
    MT16R MT16R;
    MT95A MT95A;
    MT16S MT16S;
|};

# Defines the elements of MT321SettlDetails the MT321Block4 element.
#
# + MT16R - Start of Block  
# + MT22H - Principal and Interest   
# + SettlParties - Settlement Parties
# + MT16S - End of Block
public type MT321SettlDetails record {|
    MT16R MT16R;
    MT22H MT22H;
    MT321SettlParties[] SettlParties;
    MT16S MT16S;
|};

# Defines the elements of MT321SettlParties the MT321SettlDetails element.
#
# + MT16R - Start of Block 
# + MT95A - Party  
# + MT97A - Cash Account  
# + MT70C - Party Contact Narrative 
# + MT16S - End of Block
public type MT321SettlParties record {|
    MT16R MT16R;
    MT95A MT95A;
    MT97A MT97A?;
    MT70C MT70C?;
    MT16S MT16S;
|};
