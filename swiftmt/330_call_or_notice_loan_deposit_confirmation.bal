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

# Defines the structure of an MT330 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing Call/Notice Loan/Deposit Confirmation details
# + block5 - Trailer Block 
# + UnparsedTexts - Any additional unparsed texts
public type MT330Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT330Block4 block4;
    Block5 block5?;
    UnparsedTexts UnparsedTexts?;
|};

# Defines the elements of the MT330 message block 4.
#
# + MT15A - New Sequence
# + MT20 - Sender's Reference 
# + MT21 - Related Reference
# + MT22A - Type of Operation
# + MT94A - Scope of Operation  
# + MT22B - Type of Event  
# + MT22C - Common Reference 
# + MT21N - Contract Number Party A  
# + MT82A - Party A  
# + MT87A - Party B  
# + MT83A - Fund or Instructing Party
# + MT77D - Terms and Conditions
# + Transaction - Transaction Details  
# + SettlInstAmntPayPartyA - Settlement Instructions for Amounts Payable by Party A  
# + SettlInstAmntPayPartyB - Settlement Instructions for Amounts Payable by Party B 
# + SettlInstInterPayPartyA - Settlement Instructions for Interests Payable by Party A 
# + SettlInstInterPayPartyB - Settlement Instructions for Interests Payable by Party B 
# + TaxInfo - Tax Information
# + AddiInfo - Additional Information
public type MT330Block4 record {|
    MT15A MT15A;
    MT20 MT20;
    MT21 MT21?;
    MT22A MT22A;
    MT94A MT94A?;
    MT22B MT22B;
    MT22C MT22C;
    MT21N MT21N?;
    MT82A MT82A;
    MT87A MT87A;
    MT83A MT83A?;
    MT77D MT77D?;
    MT330Transaction Transaction;
    MT330SettlInstAmntPayPartyA SettlInstAmntPayPartyA;
    MT330SettlInstAmntPayPartyB SettlInstAmntPayPartyB;
    MT330SettlInstInterPayPartyA SettlInstInterPayPartyA?;
    MT330SettlInstInterPayPartyB SettlInstInterPayPartyB?;
    MT330TaxInfo TaxInfo?;
    MT330AddiInfo AddiInfo?;
|};

# Defines the structure of the Transaction Information in the MT330 message.
#
# + MT15B - New Sequence  
# + MT17R - Party A's Role  
# + MT30T - Trade Date  
# + MT30V - Value Date  
# + MT38A - Period of Notice  
# + MT32B - Currency and Balance 
# + MT32H - Principal Amount to be Settled  
# + MT30X - Interest Due Date  
# + MT34E - Currency and Interest Amount  
# + MT37G - Interest Rate  
# + MT14D - Day Count Fraction  
# + MT30F - Last Day of the Next Interest Period  
# + MT38J - Number of Days  
# + MT39M - Payment Clearing Centre
public type MT330Transaction record {|
    MT15B MT15B;
    MT17R MT17R;
    MT30T MT30T;
    MT30V MT30V;
    MT38A MT38A;
    MT32B MT32B?;
    MT32H MT32H?;
    MT30X MT30X?;
    MT34E MT34E?;
    MT37G MT37G;
    MT14D MT14D;
    MT30F MT30F?;
    MT38J MT38J?;
    MT39M MT39M?;
|};

# Defines the structure of the Settlement Instructions for Amounts Payable by Party A in the MT330 message.
#
# + MT15C - New Sequence  
# + MT53A - Delivery Agent  
# + MT86A - Intermediary 2  
# + MT56A - Intermediary  
# + MT57A - Receiving Agent  
# + MT58A - Beneficiary Institution
public type MT330SettlInstAmntPayPartyA record {|
    MT15C MT15C;
    MT53A MT53A?;
    MT86A MT86A?;
    MT56A MT56A?;
    MT57A MT57A;
    MT58A MT58A?;
|};

# Defines the structure of the Settlement Instructions for Amounts Payable by Party B in the MT330 message.
#
# + MT15D - New Sequence  
# + MT53A - Delivery Agent  
# + MT86A - Intermediary 2  
# + MT56A - Intermediary  
# + MT57A - Receiving Agent  
# + MT58A - Beneficiary Institution
public type MT330SettlInstAmntPayPartyB record {|
    MT15D MT15D;
    MT53A MT53A?;
    MT86A MT86A?;
    MT56A MT56A?;
    MT57A MT57A;
    MT58A MT58A?;
|};

# Defines the structure of the Settlement Instructions for Interests Payable by Party A in the MT330 message.
#
# + MT15E - New Sequence  
# + MT53A - Delivery Agent  
# + MT86A - Intermediary 2  
# + MT56A - Intermediary  
# + MT57A - Receiving Agent  
# + MT58A - Beneficiary Institution
public type MT330SettlInstInterPayPartyA record {|
    MT15E MT15E;
    MT53A MT53A?;
    MT86A MT86A?;
    MT56A MT56A?;
    MT57A MT57A;
    MT58A MT58A?;
|};

# Defines the structure of the Settlement Instructions for Interests Payable by Party B in the MT330 message.
#
# + MT15F - New Sequence  
# + MT53A - Delivery Agent  
# + MT86A - Intermediary 2  
# + MT56A - Intermediary  
# + MT57A - Receiving Agent  
# + MT58A - Beneficiary Institution
public type MT330SettlInstInterPayPartyB record {|
    MT15F MT15F;
    MT53A MT53A?;
    MT86A MT86A?;
    MT56A MT56A?;
    MT57A MT57A;
    MT58A MT58A?;
|};

# Defines the structure of the Tax Information in the MT330 message.
#
# + MT15G - New Sequence  
# + MT37L - Tax Rate  
# + MT33B - Transaction Currency and Net Interest Amount  
# + MT36 - Exchange Rate  
# + MT33E - Reporting Currency and Tax Amount
public type MT330TaxInfo record {|
    MT15G MT15G;
    MT37L MT37L;
    MT33B MT33B;
    MT36 MT36?;
    MT33E MT33E?;
|};

# Defines the structure of the Additional Information in the MT330 message.
#
# + MT15H - New Sequence  
# + MT29A - Contact Information  
# + MT24D - Dealing Method
# + MT84A - Dealing Branch Party A  
# + MT85A - Dealing Branch Party B
# + MT26H - Counterparty's Reference
# + MT34C - Commission and Fees 
# + MT72 - Sender to Receiver Information
public type MT330AddiInfo record {|
    MT15H MT15H;
    MT29A MT29A?;
    MT24D MT24D?;
    MT84A MT84A?;
    MT85A MT85A?;
    MT26H MT26H?;
    MT34C MT34C?;
    MT72 MT72?;
|};
