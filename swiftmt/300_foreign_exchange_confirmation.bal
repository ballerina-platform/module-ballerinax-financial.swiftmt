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

# Defines the structure of an MT300 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing Foreign Exchange Confirmation details 
# + block5 - Trailer Block 
# + UnparsedTexts - Any additional unparsed texts
public type MT300Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT300Block4 block4;
    Block5 block5?;
    UnparsedTexts UnparsedTexts?;
|};

# Defines the elements of the MT300 message block 4.
#
# + MT15A - New Sequence  
# + MT20 - Sender's Reference  
# + MT21 - Related Reference  
# + MT22A - Type of Operation  
# + MT94A - Scope of Operation  
# + MT22C - Common Reference  
# + MT17T - Block Trade Indicator  
# + MT17U - Split Settlement Indicator  
# + MT17I - Payment versus Payment Indicator  
# + MT82A - Party A  
# + MT87A - Party B  
# + MT83A - Fund or Beneficiary Customer  
# + MT77H - Type, Date, Version of Agreement  
# + MT77D - Terms of Agreement  
# + MT14C - Year of Definitions  
# + MT17F - Non-Deliverable Indicator  
# + MT17O - NDF Open Indicator  
# + MT32E - Settlement Currency  
# + MT30U - Valuation Date  
# + MT14S - Settlement Rate Source  
# + MT26K - Calculation Agent  
# + MT21A - Reference to Opening Confirmation  
# + MT14E - Clearing or Settlement Session  
# + Transaction - Transaction details  
# + OptionalGeneralInformation - Optional General Information  
# + SplitSettlementDetails - Split Settlement Details  
# + ReportingInformation - Reporting Information  
# + PostTradeEvents - Post Trade Events
public type MT300Block4 record {|
    MT15A MT15A;
    MT20 MT20;
    MT21 MT21?;
    MT22A MT22A;
    MT94A MT94A?;
    MT22C MT22C;
    MT17T MT17T?;
    MT17U MT17U?;
    MT17I MT17I?;
    MT82A MT82A;
    MT87A MT87A;
    MT83A MT83A?;
    MT77H MT77H?;
    MT77D MT77D?;
    MT14C MT14C?;
    MT17F MT17F?;
    MT17O MT17O?;
    MT32E MT32E?;
    MT30U MT30U?;
    MT14S MT14S?;
    MT26K MT26K?;
    MT21A MT21A?;
    MT14E MT14E?;
    MT300Transaction Transaction;
    MT300OptionalGeneralInformation OptionalGeneralInformation?;
    MT300SplitSettlementDetails SplitSettlementDetails?;
    MT300ReportingInformation ReportingInformation?;
    MT300PostTradeEvents PostTradeEvents?;
|};

# Define the transacions in the MT300 message.
#
# + MT15B - New Sequence  
# + MT30T - Trade Date  
# + MT30V - Value Date  
# + MT36 - Exchange Rate  
# + MT39M - Payment Clearing Centre  
# + MT35C - Digutal Token Identifier  
# + AmountBought - Amount bought details  
# + AmountSold - Amount sold details
public type MT300Transaction record {|
    MT15B MT15B;
    MT30T MT30T;
    MT30V MT30V;
    MT36 MT36;
    MT39M MT39M?;
    MT35C MT35C?;
    MT300AmountBought AmountBought;
    MT300AmountSold AmountSold;
|};

# Define the amount bought details in the MT300Transaction element.
#
# + MT32B - Currency, Amount  
# + MT53A - Delivery Agent  
# + MT56A - Intermediary  
# + MT57A - Receiving Agent
public type MT300AmountBought record {|
    MT32B MT32B;
    MT53A MT53A?;
    MT56A MT56A?;
    MT57A MT57A;
|};

# Define the amount sold details in the MT300Transaction element.
#
# + MT33B - Currency, Amount  
# + MT53A - Delivery Agent  
# + MT56A - Intermediary  
# + MT57A - Receiving Agent  
# + MT58A - Beneficiary Institution
public type MT300AmountSold record {|
    MT33B MT33B;
    MT53A MT53A?;
    MT56A MT56A?;
    MT57A MT57A;
    MT58A MT58A?;
|};

# Define the optional general information in the MT300 message.
#
# + MT15C - New Sequence  
# + MT29A - Contact Information  
# + MT24D - Dealing Method  
# + MT84A - Dealing Branch Party A  
# + MT85A - Dealing Branch Party B  
# + MT88A - Broker Identification  
# + MT71F - Broker's Commission  
# + MT26H - Counterparty's Reference  
# + MT21G - Broker's Reference  
# + MT72 - Sender to Receiver Information
public type MT300OptionalGeneralInformation record {|
    MT15C MT15C;
    MT29A MT29A?;
    MT24D MT24D?;
    MT84A MT84A?;
    MT85A MT85A?;
    MT88A MT88A?;
    MT71F MT71F?;
    MT26H MT26H?;
    MT21G MT21G?;
    MT72 MT72?;
|};

# Define the split settlement details in the MT300 message.
#
# + MT15D - New Sequence  
# + MT17A - Buy (Sell) Indicator 
# + MT32B - Currency, Amount  
# + MT53A - Delivery Agent  
# + MT56A - Intermediary  
# + MT57A - Receiving Agent  
# + MT58A - Beneficiary Institution  
# + MT16A - Number of Settlements
public type MT300SplitSettlementDetails record {|
    MT15D MT15D;
    MT17A MT17A;
    MT32B MT32B;
    MT53A MT53A?;
    MT56A MT56A?;
    MT57A MT57A;
    MT58A MT58A?;
    MT16A MT16A;
|};

# Define the reporting information in the MT300 message.
#
# + MT15E - New Sequence  
# + ReportingParties - An array of Reporting Parties  
# + MT81A - Central Counterparty Clearing House (CCP)  
# + MT89A - Clearing Broker  
# + MT96A - Clearing Exception Party  
# + MT22S - Clearing Broker Identification  
# + MT22T - Cleared Product Identification  
# + MT17E - Clearing Threshold Indicator  
# + MT22U - Unique Product Identifier  
# + MT35B - Identification of Financial Instrument  
# + MT17H - Allocation Indicator  
# + MT17P - Collateralisation Indicator  
# + MT22V - Execution Venue  
# + MT98D - Execution Timestamp  
# + MT17W - Non Standard Flag  
# + MT22W - Link Swap Identification  
# + MT17Y - Financial Nature of the Counterparty Indicator  
# + MT17Z - Collateral Portfolio Indicator  
# + MT22Q - Collateral Portfolio Code  
# + MT17L - Portfolio Compression Indicator  
# + MT17M - Corporate Sector Indicator  
# + MT17Q - Trade with Non-EEA Counterparty Indicator  
# + MT17S - Intragroup Trade Indicator  
# + MT17X - Commercial or Treasury Financing Indicator  
# + MT98G - Confirmation Timestamp  
# + MT98H - Clearing Timestamp  
# + MT34C - Commission and Fees  
# + MT77A - Additional Reporting Information
public type MT300ReportingInformation record {|
    MT15E MT15E;
    MT300ReportingParties[] ReportingParties?;
    MT81A MT81A?;
    MT89A MT89A?;
    MT96A MT96A?;
    MT22S MT22S?;
    MT22T MT22T?;
    MT17E MT17E?;
    MT22U MT22U?;
    MT35B MT35B?;
    MT17H MT17H?;
    MT17P MT17P?;
    MT22V MT22V?;
    MT98D MT98D?;
    MT17W MT17W?;
    MT22W MT22W?;
    MT17Y MT17Y?;
    MT17Z MT17Z?;
    MT22Q MT22Q?;
    MT17L MT17L?;
    MT17M MT17M?;
    MT17Q MT17Q?;
    MT17S MT17S?;
    MT17X MT17X?;
    MT98G MT98G?;
    MT98H MT98H?;
    MT34C MT34C?;
    MT77A MT77A?;
|};

# Define the reporting parties in the MT300ReportingInformation element.
#
# + MT22L - Reporting Jurisdiction  
# + MT91A - Reporting Party  
# + UniqueTransactionIdentifier - Unique Transaction Identifier
public type MT300ReportingParties record {|
    MT22L MT22L;
    MT91A MT91A?;
    MT300UniqueTransactionIdentifier UniqueTransactionIdentifier?;
|};

# Define the unique transaction identifier in the MT300ReportingParties element.
#
# + MT22M - UTI Namespace/Issuer Code  
# + MT22N - Transaction Identifier  
# + PriorUniqueTransactionIdentifier - Prior Unique Transaction Identifier
public type MT300UniqueTransactionIdentifier record {|
    MT22M MT22M;
    MT22N MT22N;
    MT300PriorUniqueTransactionIdentifier PriorUniqueTransactionIdentifier?;
|};

# Define the prior unique transaction identifier in the MT300UniqueTransactionIdentifier element.
#
# + MT22P - PUTI Namespace/Issuer Code  
# + MT22R - Prior Transaction Identifier
public type MT300PriorUniqueTransactionIdentifier record {|
    MT22P MT22P;
    MT22R MT22R;
|};

# Define the post trade events in the MT300 message.
#
# + MT15F - New Sequence 
# + MT21H - Event Type and Reference  
# + MT21F - Underlying Liability Reference  
# + MT30F - Profit and Loss Settlement Date  
# + MT32H - Profit and Loss Settlement Amount  
# + MT33E - Outstanding Settlement Amount
public type MT300PostTradeEvents record {|
    MT15F MT15F;
    MT21H MT21H;
    MT21F MT21F?;
    MT30F MT30F?;
    MT32H MT32H?;
    MT33E MT33E?;
|};
