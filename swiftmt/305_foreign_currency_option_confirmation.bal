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

# Defines the structure of an MT305 message.
#
# + block1 - Basic Header Block 
# + block2 - Application Header Block
# + block3 - User Header Block 
# + block4 - Text Block containing Foreign Currency Option Confirmation details
# + block5 - Trailer Block 
# + UnparsedTexts - Any additional unparsed texts
public type MT305Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT305Block4 block4;
    Block5 block5?;
    UnparsedTexts UnparsedTexts?;
|};

# Defines the elements of the MT305 message block 4.
#
# + MT15A - New Sequence
# + MT20 - Transaction Reference Number  
# + MT21 - Related Reference
# + MT22 - Code/Common Reference  
# + MT23 - Further Identification
# + MT94A - Scope of Operation
# + MT82A - Party A 
# + MT87A - Party B
# + MT83A - Fund or Beneficiary Customer
# + MT30 - Date Contract Agreed/Amended
# + MT31C - Earliest Exercise Date
# + MT31G - Expiry Date
# + MT31E - Final Settlement Date  
# + MT26F - Settlement Type
# + MT39M - Payment Clearing Centre  
# + MT17F - Non-Deliverable Indicator
# + MT14S - Settlement Rate Source
# + MT32E - Settlement Currency
# + MT35C - Digital Token Identifier
# + MT26K - Calculation Agent  
# + MT32B - Underlying Currency and Amount  
# + MT36 - Strike Price
# + MT33B - Counter Currency and Amount  
# + MT37K - Premium Price
# + MT34A - Premium Payment   
# + MT53A - Sender's Correspondent  
# + MT56A - Intermediary  
# + MT57A - Account With Institution  
# + MT77H - Type, Date, Version of the Agreement  
# + MT14C - Year of Definitions  
# + MT72 - Sender to Receiver Information  
# + ReportingInformation - Reporting Information
public type MT305Block4 record {|
    MT15A MT15A;
    MT20 MT20;
    MT21 MT21;
    MT22 MT22;
    MT23 MT23;
    MT94A MT94A?;
    MT82A MT82A;
    MT87A MT87A;
    MT83A MT83A?;
    MT30 MT30;
    MT31C MT31C?;
    MT31G MT31G;
    MT31E MT31E;
    MT26F MT26F;
    MT39M MT39M?;
    MT17F MT17F?;
    MT14S MT14S?;
    MT32E MT32E?;
    MT35C MT35C?;
    MT26K MT26K?;
    MT32B MT32B;
    MT36 MT36;
    MT33B MT33B;
    MT37K MT37K;
    MT34A MT34A;
    MT53A MT53A?;
    MT56A MT56A?;
    MT57A MT57A;
    MT77H MT77H?;
    MT14C MT14C?;
    MT72 MT72?;
    MT305ReportingInformation ReportingInformation?;
|};

# Defines the structure of the Reporting Information in the MT305 message.
#
# + MT15B - New Sequence  
# + ReportingParties - Array of Reporting Parties  
# + MT81A - Central Counterparty Clearing House (CCP)  
# + MT89A - Clearing Broker  
# + MT96A - Clearing Execption Party  
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
public type MT305ReportingInformation record {|
    MT15B MT15B;
    MT305ReportingParties[] ReportingParties?;
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

# Defines the structure of the Reporting Parties in the MT305ReportingInformation element.
#
# + MT22L - Reporting Jurisdiction  
# + MT91A - Reporting Party
# + UniqueTransactionIdentifier - Array of Unique Transaction Identifiers
public type MT305ReportingParties record {|
    MT22L MT22L;
    MT91A MT91A?;
    MT305UniqueTransactionIdentifier[] UniqueTransactionIdentifier?;
|};

# Defines the structure of the Unique Transaction Identifier in the MT305ReportingParties element.
#
# + MT22M - UTI Namespace/Issuer Code 
# + MT22N - Transaction Identifier
# + PriorUniqueTransactionIdentifier - Array of Prior Unique Transaction Identifiers
public type MT305UniqueTransactionIdentifier record {|
    MT22M MT22M;
    MT22N MT22N;
    MT305PriorUniqueTransactionIdentifier[] PriorUniqueTransactionIdentifier?;
|};

# Defines the structure of the Prior Unique Transaction Identifier in the MT305UniqueTransactionIdentifier element.
#
# + MT22P - PUTI Namespace/Issuer Code  
# + MT22R - Prior Transaction Identifier
public type MT305PriorUniqueTransactionIdentifier record {|
    MT22P MT22P;
    MT22R MT22R;
|};
