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

# Defines the structure of an MT304 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing Advice/Instruction of a Third Party Deal 
# + block5 - Trailer Block 
# + UnparsedTexts - Any additional unparsed texts
public type MT304Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT304Block4 block4;
    Block5 block5?;
    UnparsedTexts UnparsedTexts?;
|};

# Defines the elements of the MT304 message block 4.
#
# + MT15A - New Sequence  
# + MT20 - Sender's Reference  
# + MT21 - Related Reference  
# + MT22A - Type of Operation  
# + MT94A - Scope of Operation  
# + MT17O - Open Indicator  
# + MT17F - Final Close Indicator  
# + MT17N - Net Settlement Indicator  
# + MT83A - Fund  
# + MT82A - Fund Manager  
# + MT87A - Executing Broker  
# + MT81A - Central Counterparty Clearing House (CCP)  
# + MT89A - Clearing Broker  
# + MT17I - Payment versus Payment Settlement Indicator  
# + MT77H - Type, Date, Version of Agreement  
# + MT14C - Year of Definitions  
# + MT32E - Settlement Currency  
# + MT30U - Valuation Date  
# + MT14S - Settlement Rate Source  
# + MT26K - Calculation Agent  
# + MT21A - Reference to Opening Instruction  
# + MT14E - Clearing or Settlement Session  
# + ForexTransaction - Forex Transaction Details  
# + OptionalGeneralInformation - Optional General Information  
# + AccountingInformation - Accounting Information  
# + NetAmountToBeSettled - Net Amount To Be Settled
public type MT304Block4 record {|
    MT15A MT15A;
    MT20 MT20;
    MT21 MT21?;
    MT22A MT22A;
    MT94A MT94A;
    MT17O MT17O?;
    MT17F MT17F?;
    MT17N MT17N?;
    MT83A MT83A;
    MT82A MT82A;
    MT87A MT87A;
    MT81A MT81A?;
    MT89A MT89A?;
    MT17I MT17I?;
    MT77H MT77H?;
    MT14C MT14C?;
    MT32E MT32E?;
    MT30U MT30U?;
    MT14S MT14S?;
    MT26K MT26K?;
    MT21A MT21A?;
    MT14E MT14E?;
    MT304ForexTransaction ForexTransaction;
    MT304OptionalGeneralInformation OptionalGeneralInformation?;
    MT304AccountingInformation AccountingInformation?;
    MT304NetAmountToBeSettled NetAmountToBeSettled?;
|};

# Define the forex transacion details in the MT304 message.
#
# + MT15B - New Sequence  
# + MT30T - Trade Date  
# + MT30V - Value Date  
# + MT36 - Exchange Rate  
# + MT39M - Payment Clearing Centre  
# + MT35C - Digutal Token Identifier  
# + AmountBought - Amount bought details  
# + AmountSold - Amount sold details
public type MT304ForexTransaction record {|
    MT15B MT15B;
    MT30T MT30T;
    MT30V MT30V;
    MT36 MT36;
    MT39M MT39M?;
    MT35C MT35C?;
    MT304AmountBought AmountBought;
    MT304AmountSold AmountSold;
|};

# Define the amount bought details in the MT304ForexTransaction element.
#
# + MT32B - Currency, Amount  
# + MT53A - Delivery Agent  
# + MT56A - Intermediary  
# + MT57A - Receiving Agent
public type MT304AmountBought record {|
    MT32B MT32B;
    MT53A MT53A;
    MT56A MT56A?;
    MT57A MT57A?;
|};

# Define the amount sold details in the MT304ForexTransaction element.
#
# + MT33B - Currency, Amount Sold
# + MT53A - Delivery Agent
# + MT56A - Intermediary
# + MT57A - Receiving Agent
# + MT58A - Beneficiary Institution
public type MT304AmountSold record {|
    MT33B MT33B;
    MT53A MT53A?;
    MT56A MT56A?;
    MT57A MT57A;
    MT58A MT58A?;
|};

# Define the optional general information in the MT304 message.
#
# + MT15C - New Sequence  
# + MT21A - Reference to the Associated Trade  
# + MT21G - Executing Broker's Reference 
# + UniqueTransactionIdentifier - An array of unique transaction identifiers  
# + MT22U - Unique Product Identifier  
# + MT35B - Identification of the Financial Instrument
# + MT22V - Execution Venue  
# + MT98D - Execution Timestamp  
# + MT98G - Confirmation Timestamp
# + MT98H - Clearing Timestamp
# + MT29A - Contact Information 
# + MT34C - Commission and Fees
# + MT72 - Sender to Receiver Information
public type MT304OptionalGeneralInformation record {|
    MT15C MT15C;
    MT21A MT21A?;
    MT21G MT21G?;
    MT304UniqueTransactionIdentifier[] UniqueTransactionIdentifier?;
    MT22U MT22U?;
    MT35B MT35B?;
    MT22V MT22V?;
    MT98D MT98D?;
    MT98G MT98G?;
    MT98H MT98H?;
    MT29A MT29A?;
    MT34C MT34C?;
    MT72 MT72?;
|};

# Define the unique transaction identifier in the MT304OptionalGeneralInformation element.
#
# + MT22L - Reporting Jurisdiction  
# + MT22M - UTI Namespace/Issuer Code
# + MT22N - Transaction Identifier
# + MT304PriorUniqueTransactionIdentifier - An array of prior unique transaction identifiers
public type MT304UniqueTransactionIdentifier record {|
    MT22L MT22L;
    MT22M MT22M;
    MT22N MT22N;
    MT304PriorUniqueTransactionIdentifier[] MT304PriorUniqueTransactionIdentifier?;
|};

# Define the prior unique transaction identifier in the MT304UniqueTransactionIdentifier element.
#
# + MT22P - PUTI Namespace/Issuer Code  
# + MT22R - Prior Transaction Identifier
public type MT304PriorUniqueTransactionIdentifier record {|
    MT22P MT22P;
    MT22R MT22R;
|};

# Define the accounting information in the MT304 message.
#
# + MT15D - New Sequence
# + MT21P - Reference to the Previous Deal 
# + MT17G - Gain (Loss) Indicator
# + MT32G - Currency, Amount
# + MT34B - Commission and Fees - Currency and Amount  
# + MT30F - Commission and Fees - Settlement Date
public type MT304AccountingInformation record {|
    MT15D MT15D;
    MT21P MT21P?;
    MT17G MT17G?;
    MT32G MT32G?;
    MT34B MT34B?;
    MT30F MT30F?;
|};

# Define the net amount to be settled in the MT304 message.
#
# + MT15E - New Sequence
# + MT17G - Gain (Loss) Indicator  
# + MT32G - Currency, Amount
# + MT53A - Delivery Agent  
# + MT56A - Intermediary  
# + MT57A - Receiving Agent  
# + MT58A - Beneficiary Institution
public type MT304NetAmountToBeSettled record {|
    MT15E MT15E;
    MT17G MT17G;
    MT32G MT32G;
    MT53A MT53A?;
    MT56A MT56A?;
    MT57A MT57A?;
    MT58A MT58A?;
|};
