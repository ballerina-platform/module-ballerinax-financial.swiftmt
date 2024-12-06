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

# Defines the structure of an MT341 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing Forward Rate Agreement Settlement Confirmation details
# + block5 - Trailer Block 
# + UnparsedTexts - Any additional unparsed texts
public type MT341Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT341Block4 block4;
    Block5 block5?;
    UnparsedTexts UnparsedTexts?;
|};

# Defines the elements of the MT341 message block 4.
#
# + MT15A - New Sequence  
# + MT20 - Sender's Reference  
# + MT21 - Related Reference  
# + MT22A - Type of Operation  
# + MT94A - Scope of Operation  
# + MT22C - Common Reference  
# + MT23D - Type of FRA 
# + MT21N - Contract Number Party A  
# + MT21B - Contract Number Party B  
# + MT82A - Party A  
# + MT87A - Party B  
# + MT29A - Contact Information  
# + MT72 - Sender to Receiver Information  
# + Transaction - Transaction Details 
# + SettlInstAmnt - Settlement Instructions for the Settlement Amount
# + RepInfo - Reporting Information
public type MT341Block4 record {|
    MT15A MT15A;
    MT20 MT20;
    MT21 MT21?;
    MT22A MT22A;
    MT94A MT94A?;
    MT22C MT22C;
    MT23D MT23D;
    MT21N MT21N?;
    MT21B MT21B?;
    MT82A MT82A;
    MT87A MT87A;
    MT29A MT29A?;
    MT72 MT72?;
    MT341Transaction Transaction;
    MT341SettlInstAmnt SettlInstAmnt;
    MT341RepInfo RepInfo?;
|};

# Defines the structure of the Transaction Information in the MT341 message.
#
# + MT15B - New Sequence 
# + MT30T - Trade Date
# + MT32B - Currency, Notional Amount
# + MT30F - Effective Date  
# + MT30P - Termination Date
# + MT37M - Fixed Rate
# + AfbFrabbaDetails - AFB and FRABBA Details
# + MT39M - Payment Clearing Centre
public type MT341Transaction record {|
    MT15B MT15B;
    MT30T MT30T;
    MT32B MT32B;
    MT30F MT30F;
    MT30P MT30P;
    MT37M MT37M;
    MT341AfbFrabbaDetails AfbFrabbaDetails?;
    MT39M MT39M?;
|};

# Defines the structure of the AFB and FRABBA Details in the MT341Transaction.
#
# + MT30V - Fixing Date
# + MT38D - Contract Period
public type MT341AfbFrabbaDetails record {|
    MT30V MT30V?;
    MT38D MT38D?;
|};

# Defines the structure of the Settlement Instructions for the Settlement Amount in the MT341 message.
#
# + MT15C - New Sequence
# + MT37R - Settlement Rate
# + MT34E - Settlement Currency and Amount
# + MT53A - Delivery Agent 
# + MT86A - Intermediary 2
# + MT56A - Intermediary
# + MT57A - Receiving Agent
# + MT58A - Beneficiary Institution
public type MT341SettlInstAmnt record {|
    MT15C MT15C;
    MT37R MT37R;
    MT34E MT34E;
    MT53A MT53A?;
    MT86A MT86A?;
    MT56A MT56A?;
    MT57A MT57A;
    MT58A MT58A?;
|};

# Defines the structure of the Reporting Information in the MT341 message.
#
# + MT15G - New Sequence  
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
public type MT341RepInfo record {|
    MT15G MT15G;
    MT341RepParties[] RepParties?;
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

# Defines the structure of the Reporting Parties in the MT341RepInfo element.
#
# + MT22L - Reporting Jurisdiction  
# + MT91A - Reporting Party
# + UniqueTransactionIdentifier - Unique Transaction Identifier
public type MT341RepParties record {|
    MT22L MT22L;
    MT91A MT91A?;
    MT341UniqueTransactionIdentifier[] UniqueTransactionIdentifier?;
|};

# Defines the structure of the Unique Transaction Identifier in the MT341RepParties element.
#
# + MT22M - UTI Namespace/Issuer Code
# + MT22N - Transaction Identifier
# + PriorUniqueTransactionIdentifier - An array of prior unique transaction identifiers
public type MT341UniqueTransactionIdentifier record {|
    MT22M MT22M;
    MT22N MT22N;
    MT341PriorUniqueTransactionIdentifier[] PriorUniqueTransactionIdentifier?;
|};

# Defines the structure of the prior unique transaction identifier in the MT341UniqueTransactionIdentifier element.
#
# + MT22P - PUTI Namespace/Issuer Code 
# + MT22R - Prior Transaction Identifier
public type MT341PriorUniqueTransactionIdentifier record {|
    MT22P MT22P;
    MT22R MT22R;
|};

