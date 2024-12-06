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

# Defines the structure of an MT306 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing Foreign Currency Option Confirmation details
# + block5 - Trailer Block 
# + UnparsedTexts - Any additional unparsed texts
public type MT306Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT306Block4 block4;
    Block5 block5?;
    UnparsedTexts UnparsedTexts?;
|};

# Defines the elements of the MT306 message block 4.
#
# + MT15A - New Sequence  
# + MT20 - Sender's Reference  
# + MT21 - Related Reference 
# + MT22A - Type of Operation  
# + MT94A - Scope of Operation  
# + MT22C - Common Reference 
# + MT21N - Contract Number Party A  
# + MT21B - Contract Number Party B
# + MT12F - Option or Forward Style
# + MT12E - Expiration Style
# + MT12D - Option Style  
# + MT17A - Barrier Indicator  
# + MT17F - Non-Deliverable Indicator 
# + MT22K - Type of Event
# + MT30U - Date of Barrier Event  
# + MT29H - Location of Barrier Event
# + MT82A - Party A
# + MT87A - Party B  
# + MT83A - Fund or Beneficiary Customer  
# + MT77H - Type, Date, Version of Agreement
# + MT77D - Additional Conditions
# + MT14C - Year of Definitions
# + Transaction - Transaction details  
# + SettInstPayPre - Settlement Instructions for Payment of Premium
# + VanillaOp - Vanilla Option or Forward Block 
# + BinPayAmnt - Binary Payout Amount 
# + BarrBlock - Barrier Block 
# + BinBlock - Binary Block  
# + NonDeliBlock - Non Deliverable Block  
# + EarlyTerm - Early Termination  
# + AveOptnForw - Averaging Options and Forwards  
# + AddiInfo - Additional Information  
# + AddiAmnt - Additional Amounts  
# + RepInfo - Reporting Information
public type MT306Block4 record {|
    MT15A MT15A;
    MT20 MT20;
    MT21 MT21?;
    MT22A MT22A;
    MT94A MT94A?;
    MT22C MT22C;
    MT21N MT21N;
    MT21B MT21B?;
    MT12F MT12F;
    MT12E MT12E?;
    MT12D MT12D?;
    MT17A MT17A?;
    MT17F MT17F;
    MT22K MT22K;
    MT30U MT30U?;
    MT29H MT29H?;
    MT82A MT82A;
    MT87A MT87A;
    MT83A MT83A?;
    MT77H MT77H;
    MT77D MT77D?;
    MT14C MT14C?;
    MT306Transaction Transaction;
    MT306SettInstPayPre SettInstPayPre?;
    MT306VanillaOpt VanillaOp?;
    MT306BinPayAmnt BinPayAmnt?;
    MT306BarrBlock BarrBlock?;
    MT306BinBlock BinBlock?;
    MT306NonDeliBlock NonDeliBlock?;
    MT306EarlyTerm EarlyTerm?;
    MT306AveOptnForw AveOptnForw?;
    MT306AddiInfo AddiInfo?;
    MT306AddiAmnt AddiAmnt?;
    MT306RepInfo RepInfo?;
|};

# Defines the structure of the Transaction Information in the MT306 message.
#
# + MT15B - New Sequence  
# + MT17V - Buy (Sell) Indicator 
# + MT30T - Trade Date
# + MT30X - Expiration or Valuation Date  
# + MT29A - Expiration or Valuation Location and Time
# + MT30A - Final Settlement Date
# + MT29H - Payment Business Day
# + MT14S - Settlement Rate Source  
# + MT39M - Payment Clearing Centre
# + PremDetails - Premium Details  
# + CalcAgent - Calculation Agent
public type MT306Transaction record {|
    MT15B MT15B;
    MT17V MT17V?;
    MT30T MT30T;
    MT30X MT30X;
    MT29A MT29A;
    MT30A MT30A;
    MT29H MT29H?;
    MT14S MT14S?;
    MT39M MT39M?;
    MT306PremDetails PremDetails?;
    MT306CalcAgent CalcAgent;
|};

# Defines the structure of the Premium Details in the MT306Transaction element.
#
# + MT37K - Premium Price  
# + MT30V - Premium Payment Date  
# + MT34B - Premium Currency and Amount
public type MT306PremDetails record {|
    MT37K MT37K?;
    MT30V MT30V;
    MT34B MT34B;
|};

# Defines the structure of the Calculation Agent Details in the MT306Transaction element.
#
# + MT84A - Calculation Agent
public type MT306CalcAgent record {|
    MT84A MT84A;
|};

# Defines the structure of the Settlement Instructions for Payment of Premium in the MT306 message.
#
# + MT15C - New Sequence  
# + MT53A - Delivery Agent  
# + MT86A - Intermediary 2  
# + MT56A - Intermediary  
# + MT57A - Receiving Agent  
# + MT58A - Beneficiary Institution
public type MT306SettInstPayPre record {|
    MT15C MT15C;
    MT53A MT53A?;
    MT86A MT86A?;
    MT56A MT56A?;
    MT57A MT57A;
    MT58A MT58A?;
|};

# Defines the structure of the Vanilla Option or Forward Block in the MT306 message.
#
# + MT15D - New Sequence  
# + MT30P - Earliest Exercise Date  
# + MT30Q - Intermediate Exercise Date
# + MT26F - Settlement Type
# + MT32B - Put Currency and Amount or Party A Sold Currency and Amount   
# + MT36 - Strike Price or Forward Rate  
# + MT33B - Call Currency and Amount or Party A Bought Currency and Amount
public type MT306VanillaOpt record {|
    MT15D MT15D;
    MT30P MT30P?;
    MT30Q MT30Q?;
    MT26F MT26F;
    MT32B MT32B;
    MT36 MT36;
    MT33B MT33B;
|};

# Defines the structure of the Binary Payout Amount in the MT306 message.
#
# + MT15E - New Sequence  
# + MT33E - Currency, Amount  
# + MT30H - Binary Amount Payment Date  
# + MT53A - Delivery Agent
# + MT86A - Intermediary 2  
# + MT56A - Intermediary  
# + MT57A - Receiving Agent  
# + MT58A - Beneficiary Institution
public type MT306BinPayAmnt record {|
    MT15E MT15E;
    MT33E MT33E;
    MT30H MT30H?;
    MT53A MT53A?;
    MT86A MT86A?;
    MT56A MT56A?;
    MT57A MT57A;
    MT58A MT58A?;
|};

# Defines the structure of the Barrier Block in the MT306 message.
#
# + MT15F - New Sequence  
# + MT22G - Type of Barrier  
# + MT17C - Barrier Event Equal Modifier  
# + MT37J - Barrier Level
# + MT37L - Lower Barrier Level  
# + MT14S - Barrier Settlement Rate Source
# + MT29I - Barrier Determination Business Days
# + MT14H - All Barrier Dates Business Day Convention
# + MT14K - Interim Barrier Dates Business Day Convention  
# + MT14L - Barrier Event End Date Business Day Convention  
# + MT14M - Barrier Time Type
# + MT29O - Continuous Time Period  
# + MT14N - Spot Market   
# + MT29J - Barrier Event Determination Time  
# + MT14O - Barrier Event Determination Time Source  
# + MT33Z - Rebate Amount   
# + MT30A - Rebate Amount Payment Date  
# + MT84A - Barrier Determination Agent  
# + BarrWinBlock - Barrier Window Block
public type MT306BarrBlock record {|
    MT15F MT15F;
    MT22G MT22G;
    MT17C MT17C?;
    MT37J MT37J;
    MT37L MT37L?;
    MT14S MT14S?;
    MT29I MT29I?;
    MT14H MT14H?;
    MT14K MT14K?;
    MT14L MT14L?;
    MT14M MT14M;
    MT29O MT29O?;
    MT14N MT14N?;
    MT29J MT29J?;
    MT14O MT14O?;
    MT33Z MT33Z?;
    MT30A MT30A?;
    MT84A MT84A?;
    MT306barrWinBlock[] BarrWinBlock?;
|};

# Defines the structure of the Barrier Window Block in the MT306BarrBlock element.
#
# + MT30I - Barrier Monitoring Period
public type MT306barrWinBlock record {|
    MT30I MT30I;
|};

# Defines the structure of the Binary Block in the MT306 message.
#
# + MT15G - New Sequence 
# + MT32Q - Currency Pair
public type MT306BinBlock record {|
    MT15G MT15G;
    MT32Q MT32Q;
|};

# Defines the structure of the Non Deliverable Block in the MT306 message.
#
# + MT15H - New Sequence
# + MT14S - Settlement Rate Source  
# + MT32E - Settlement Currency  
# + MT26K - Calculation Agent  
# + MT35C - Digital Token Identifier
public type MT306NonDeliBlock record {|
    MT15H MT15H;
    MT14S MT14S;
    MT32E MT32E;
    MT26K MT26K?;
    MT35C MT35C?;
|};

# Defines the structure of the Early Termination in the MT306 message.
#
# + MT15I - New Sequence  
# + MT12G - Early Termination Style  
# + MT30T - Early Termination Date
# + MT22Y - Frequency of Early Termination
# + MT85A - Exercising Party
# + MT88A - Non-Exercising Party  
# + MT84A - Calculation Agent
# + MT30Y - Commencement Date  
# + MT29L - Expiry Details  
# + MT29E - Earliest Exercise Time  
# + MT29M - Latest Exercise Time  
# + MT17I - Cash Settlement
# + MT29N - Cash Settlement Valuation Details  
# + MT30Z - Cash Settlement Payment Date
# + MT14S - Settlement Rate Source
public type MT306EarlyTerm record {|
    MT15I MT15I;
    MT12G MT12G;
    MT30T MT30T?;
    MT22Y MT22Y?;
    MT85A MT85A?;
    MT88A MT88A?;
    MT84A MT84A;
    MT30Y MT30Y?;
    MT29L MT29L?;
    MT29E MT29E?;
    MT29M MT29M?;
    MT17I MT17I?;
    MT29N MT29N?;
    MT30Z MT30Z?;
    MT14S MT14S?;
|};

# Defines the structure of the Averaging Options and Forwards in the MT306 message.
#
# + MT15J - New Sequence 
# + MT14P - Averaging Method
# + MT14S - Settlement Rate Source  
# + MT29Q - Valuation Business Days  
# + MT14R - Averaging Date Business Day Convention  
# + MT14Q - Averaging Date Disruption Consequence  
# + MT16A - Maximum Days of Postponement  
# + MT14B - Adjustment Type  
# + MT19C - Adjestment Factor  
# + SettRate - Settlement Rate
# + ForwRate - Forward Rate or Strike Price
public type MT306AveOptnForw record {|
    MT15J MT15J;
    MT14P MT14P?;
    MT14S MT14S?;
    MT29Q MT29Q?;
    MT14R MT14R?;
    MT14Q MT14Q?;
    MT16A MT16A?;
    MT14B MT14B?;
    MT19C MT19C?;
    MT306SettRate[] SettRate?;
    MT306ForwRate[] ForwRate?;
|};

# Defines the structure of the Settlement Rate Details in the MT306AveOptnForw element.
#
# + MT30I - Settlement Rate Averaging Period  
# + MT19Y - Weight
public type MT306SettRate record {|
    MT30I MT30I;
    MT19Y MT19Y?;
|};

# Defines the structure of the Forward Rate or Strike Price in the MT306AveOptnForw element.
#
# + MT30K - Forward Rate or Strike Price Averaging Period  
# + MT19Z - Weight
public type MT306ForwRate record {|
    MT30K MT30K;
    MT19Z MT19Z?;
|};

# Defines the structure of the Additional Information in the MT306 message.
#
# + MT15K - New Sequence  
# + MT29A - Contract Information  
# + MT24D - Dealing Method
# + MT88A - Broker Identification  
# + MT71F - Broker's Commission
# + MT21G - Broker's Reference
# + MT72 - Sender to Receiver Information
public type MT306AddiInfo record {|
    MT15K MT15K;
    MT29A MT29A?;
    MT24D MT24D?;
    MT88A MT88A?;
    MT71F MT71F?;
    MT21G MT21G?;
    MT72 MT72?;
|};

# Defines the structure of the Additional Amounts in the MT306 message.
#
# + MT15L - New Sequence  
# + MT18A - Number of Repetitions  
# + MT30F - Payment Date
# + MT32H - Currency, Payment Amount  
# + MT53A - Delivery Agent
# + MT86A - Intermediary 2  
# + MT56A - Intermediary  
# + MT57A - Receiving Agent
public type MT306AddiAmnt record {|
    MT15L MT15L;
    MT18A MT18A;
    MT30F MT30F;
    MT32H MT32H;
    MT53A MT53A?;
    MT86A MT86A?;
    MT56A MT56A?;
    MT57A MT57A;
|};

# Defines the structure of the Reporting Information in the MT306 message.
#
# + MT15M - New Sequence  
# + RepParties - Reporting Parties
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
# + MT17Y - Financial Nature of the Counterparty Indicator  
# + MT17Z - Collateral Portfolio Indicator
# + MT22Q - Collateral Portfolio Code
# + MT17L - Portfolio Compression Indicator
# + MT17M - Corporate Sector Indicator
# + MT17Q - Trade with Non-EEA Counterparty Indicator
# + MT17S - Intragroup Trade Indicator
# + MT17X - Commercial or Treasury Financing Indicator
# + MT34C - Commission and Fees
# + MT77A - Additional Reporting Information
public type MT306RepInfo record {|
    MT15M MT15M;
    MT306RepParties[] RepParties?;
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
    MT17Y MT17Y?;
    MT17Z MT17Z?;
    MT22Q MT22Q?;
    MT17L MT17L?;
    MT17M MT17M?;
    MT17Q MT17Q?;
    MT17S MT17S?;
    MT17X MT17X?;
    MT34C MT34C?;
    MT77A MT77A?;
|};

# Defines the structure of the Reporting Parties in the MT306RepInfo element.
#
# + MT22L - Reporting Jurisdiction  
# + MT91A - Reporting Party
# + UniqueTransactionIdentifier - Unique Transaction Identifier
public type MT306RepParties record {|
    MT22L MT22L;
    MT91A MT91A?;
    MT306UniqueTransactionIdentifier[] UniqueTransactionIdentifier?;
|};

# Defines the structure of the Unique Transaction Identifier in the MT306RepParties element.
#
# + MT22M - UTI Namespace/Issuer Code
# + MT22N - Transaction Identifier
# + PriorUniqueTransactionIdentifier - An array of prior unique transaction identifiers
public type MT306UniqueTransactionIdentifier record {|
    MT22M MT22M;
    MT22N MT22N;
    MT306PriorUniqueTransactionIdentifier[] PriorUniqueTransactionIdentifier?;
|};

# Defines the structure of the prior unique transaction identifier in the Mt306UniqueTransactionIdentifier element.
#
# + MT22P - PUTI Namespace/Issuer Code 
# + MT22R - Prior Transaction Identifier
public type MT306PriorUniqueTransactionIdentifier record {|
    MT22P MT22P;
    MT22R MT22R;
|};
