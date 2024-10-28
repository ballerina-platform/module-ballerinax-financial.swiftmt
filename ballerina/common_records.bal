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

# Defines the end to end identification.
#
# + name - The name of the field   
# + value - The value of end to end reference
public type NdToNdTxRef record {|
    string name?;
    string value;
|};

# Defines the validation flag.
#
# + name - The name of the field  
# + value - The value of the validation flag
public type ValidationFlag record {|
    string name?;
    string value;
|};

# Defines the block 3 of the message.
#
# + NdToNdTxRef - The end to end reference  
# + ValidationFlag - The validation flag to identify STP, REMIT and COV
public type Block3 record {|
    NdToNdTxRef NdToNdTxRef?;
    ValidationFlag ValidationFlag?;
|};

# Defines the block 1 of the message.
#
# + applicationId - The ID of the application sending the message.
# + serviceId - The ID of the service being utilized.
# + logicalTerminal - The logical terminal associated with the message sender or receiver.
# + sessionNumber - The session number for the message transmission.
# + sequenceNumber - The sequence number for tracking message order.
public type Block1 record {|
    string applicationId?;
    string serviceId?;
    string logicalTerminal?;
    string sessionNumber?;
    string sequenceNumber?;
|};

# Defines the block 2 of the message.
#
# + messageType - The type of the message  
# + receiverAddress - The address of the receiver of the message  
# + messagePriority - The priority of the message transmission 
# + senderInputTime - The time at which the message was sent
# + MIRDate - The message input reference date
# + MIRLogicalTerminal - The message input reference logical terminal
# + MIRSessionNumber - The message input reference session number
# + MIRSequenceNumber - The message input reference sequence number
# + receiverOutputDate - The date on which the message is delivered
# + receiverOutputTime - The time at which the message is delivered
# + 'type - An attribute specifying the type of message in additional detail
public type Block2 record {|
    string messageType;
    string receiverAddress?;
    string messagePriority?;
    Dt senderInputTime?;
    Tm MIRDate?;
    string MIRLogicalTerminal?;
    string MIRSessionNumber?;
    string MIRSequenceNumber?;
    Dt receiverOutputDate?;
    Tm receiverOutputTime?;
    @xmldata:Attribute
    string 'type?;
|};

# Defines the message id in MT20.
#
# + content - The content of the message id  
# + number - The attribute number
public type MsgId record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT20 field in block 4.
#
# + name - The name of the field  
# + msgId - The message id in the field
public type MT20 record {|
    string name?;
    MsgId msgId;
|};

# Defines the MT50 field in block 4.
#
# + name - The name of the field  
# + Nm - The name of the  ordering customer  
# + AdrsLine - The address of the ordering customer
public type MT50 record {|
    string name?;
    Nm[] Nm?;
    AdrsLine[] AdrsLine?;
|};

# Defines the reference.
#
# + content - The content of the refernece  
# + number - The attribute number
public type Ref record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT21R field in block 4.
#
# + name - The name of the field  
# + Ref - The reference in the related reference
public type MT21R record {|
    string name?;
    Ref Ref;
|};

# Defines the MT21E field in block 4.
#
# + name - The name of the field  
# + Ref - The reference in the registration reference
public type MT21E record {|
    string name?;
    Ref Ref;
|};

# Defines the MT58A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identifier type of beneficiary institution  
# + PrtyIdn - The party identifier of beneficiary institution  
# + IdnCd - The identifier code of beneficiary institution
public type MT58A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

# Defines the MT58A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identifier type of beneficiary institution  
# + PrtyIdn - The party identifier of beneficiary institution  
# + Nm - The name of the beneficiary institution  
# + AdrsLine - The address of the beneficiary institution
public type MT58D record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

# Defines the MT75 field in block 4.
#
# + name - The name of the field  
# + Nrtv - The narrative
public type MT75 record {|
    string name;
    Nrtv Nrtv;
|};

# Defines the MT76 field in block 4.
#
# + name - The name of the field  
# + Nrtv - The narrative
public type MT76 record {|
    string name;
    Nrtv Nrtv;
|};

# Defines the MT12 field in block 4.
#
# + name - The name of the field  
# + Msg - The message in the requested message
public type MT12 record {|
    string name?;
    Msg Msg;
|};

# Defines the message in the requested message.
#
# + content - The content in the message  
# + number - The attribute number
public type Msg record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT34F field in block 4.
#
# + name - The name of the field 
# + Ccy - The currency of the floor limit  
# + Cd - The debit or credit code   
# + Amnt - The amount details
public type MT34F record {|
    string name?;
    Ccy Ccy;
    Cd Cd?;
    Amnt Amnt;
|};

# Defines the message index.
#
# + content - The content of the message index  
# + number - The attribute number
public type MsgIdx record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the total number of messages.
#
# + content - The content of the total  
# + number - The attribute number
public type Ttl record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT28D field in block 4.
#
# + name - The name of the field  
# + MsgIdx - The message index 
# + Ttl - The total number of messages
public type MT28D record {|
    string name?;
    MsgIdx MsgIdx;
    Ttl Ttl;
|};

# Defines the date.
#
# + content - The content of the date  
# + number - The attribute number
public type Dt record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT30 field in block 4.
#
# + name - The name of the field  
# + Dt - The date in the field
public type MT30 record {|
    string name?;
    Dt Dt;
|};

# Defines the authorization.
#
# + content - The content of the authorization  
# + number - The attribute number
public type Auth record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT25 field in block 4.
#
# + name - The name of the field  
# + Auth - The authorization details
public type MT25 record {|
    string name?;
    Auth Auth;
|};

# Defines the identification code.
#
# + content - The content of the identification code  
# + number - The attribute number
public type IdnCd record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT50C field in block 4.
#
# + name - The name of the field  
# + IdnCd - The identification code
public type MT50C record {|
    string name?;
    IdnCd IdnCd;
|};

# Defines the party identification.
#
# + content - The content of the party identification  
# + number - The attribute number
public type PrtyIdn record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT50L field in block 4.
#
# + name - The name of the field  
# + PrtyIdn - The party identification
public type MT50L record {|
    string name?;
    PrtyIdn PrtyIdn;
|};

# Defines the MT21 field in block 4.
#
# + name - The name of the field  
# + Ref - The reference details
public type MT21 record {|
    string name?;
    Ref Ref;
|};

# Defines the MT21F field in block 4.
#
# + name - The name of the field  
# + Ref - The reference details
public type MT21F record {|
    string name?;
    Ref Ref;
|};

# Defines the MT25P field in block 4.
#
# + name - The name of the field  
# + Acc - The account details  
# + IdnCd - The identification code
public type MT25P record {|
    string name?;
    Acc Acc;
    IdnCd IdnCd;
|};

# Defines the MT13D field in block 4.
#
# + name - The name of the field  
# + Dt - The date details  
# + Tm - The time details  
# + Sgn - The sign details  
# + TmOfst - The time offset
public type MT13D record {|
    string name?;
    Dt Dt;
    Tm Tm;
    Sgn Sgn;
    TmOfst TmOfst;
|};

# Defines the currency.
#
# + content - The content of the currency  
# + number - The attribute number
public type Ccy record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the amount.
#
# + content - The content of the amount  
# + number - The attribute number
public type Amnt record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT32B field in block 4.
#
# + name - The name of the field  
# + Ccy - The currency details  
# + Amnt - The amount details
public type MT32B record {|
    string name?;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the code type.
#
# + content - The content of the code type  
# + number - The attribute number
public type CdTyp record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the name.
#
# + content - The content of the name  
# + number - The attribute number
public type Nm record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the birth date.
#
# + content - The content of the birth date  
# + number - The attribute number
public type BrthDt record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the birth place.
#
# + content - The content of the birth place  
# + number - The attribute number
public type BrthPlc record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the customer identification.
#
# + content - The content of the customer identification number  
# + number - The attribute number
public type CstmIdnNum record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the national identification number.
#
# + content - The content of the national identification number  
# + number - The attribute number
public type NtnlIdnNum record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the address line.
#
# + content - The content of the address line  
# + number - The attribute number
public type AdrsLine record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the country or town.
#
# + content - The content of the country or town  
# + number - The attribute number
public type CntyNTw record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT50F field in block 4.
#
# + name - The name of the field  
# + PrtyIdn - The party identification  
# + CdTyp - The code types  
# + Nm - The name in the field 
# + AdrsLine - The address lines  
# + CntyNTw - The country or town  
# + BrthDt - The birth date  
# + BrthPlc - The birth place  
# + CstmIdnNum - The customer identification number  
# + NtnlIdnNum - The national identification number  
# + AddInfo - The additional information
public type MT50F record {|
    string name?;
    PrtyIdn PrtyIdn;
    CdTyp[] CdTyp;
    Nm[] Nm?;
    AdrsLine[] AdrsLine?;
    CntyNTw[] CntyNTw?;
    BrthDt BrthDt?;
    BrthPlc BrthPlc?;
    CstmIdnNum CstmIdnNum?;
    NtnlIdnNum NtnlIdnNum?;
    AddInfo[] AddInfo?;
|};

# Defines the account.
#
# + content - The content of the account  
# + number - The attribute number
public type Acc record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the message type number.
#
# + content - The content of the message type number  
# + number - The attribute number
public type MtNum record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the session number.
#
# + content - The content of the session number  
# + number - The attribute number
public type SesnNum record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the input sequence number.
#
# + content - The content of the input sequence number  
# + number - The attribute number
public type InptSeqNo record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT11S field in block 4.
#
# + name - The name of the field  
# + MtNum - The message type number  
# + Dt - The date  
# + SesnNum - The session number
# + InptSeqNo - Input sequence number
public type MT11S record {|
    string name?;
    MtNum MtNum;
    Dt Dt;
    SesnNum SesnNum?;
    InptSeqNo InptSeqNo?;
|};

# Defines the MT11R field in block 4.
#
# + name - The name of the field  
# + MtNum - The message type number  
# + Dt - The date  
# + SesnNum - The session number
# + InptSeqNo - Input sequence number
public type MT11R record {|
    string name?;
    MtNum MtNum;
    Dt Dt;
    SesnNum SesnNum?;
    InptSeqNo InptSeqNo?;
|};

# Defines the MT50G field in block 4.
#
# + name - The name of the field  
# + Acc - The account  
# + IdnCd - The identification code
public type MT50G record {|
    string name?;
    Acc Acc;
    IdnCd IdnCd;
|};

# Defines the MT50H field in block 4.
#
# + name - The name of the field  
# + Acc - The account  
# + Nm - The names  
# + AdrsLine - The address lines
public type MT50H record {|
    string name?;
    Acc Acc;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

# Defines the MT57C field in block 4.
#
# + name - The name of the field  
# + PrtyIdn - The party identification
public type MT57C record {|
    string name?;
    PrtyIdn PrtyIdn;
|};

# Defines the MT59F field in block 4.
#
# + name - The name of the field  
# + Acc - The account  
# + CdTyp - The code types  
# + Nm - The name in the field
# + AdrsLine - The address lines  
# + CntyNTw - The country or town  
# + BrthDt - The birth date  
# + BrthPlc - The birth place  
# + CstmIdnNum - The customer identification number  
# + NtnlIdnNum - The national identification number  
# + AddInfo - The additional information
public type MT59F record {|
    string name?;
    Acc Acc?;
    CdTyp[] CdTyp;
    Nm[] Nm?;
    AdrsLine[] AdrsLine?;
    CntyNTw[] CntyNTw?;
    BrthDt BrthDt?;
    BrthPlc BrthPlc?;
    CstmIdnNum CstmIdnNum?;
    NtnlIdnNum NtnlIdnNum?;
    AddInfo[] AddInfo?;
|};

# Defines the narrative.
#
# + content - The content of the narrative  
# + number - The attribute number
public type Nrtv record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT70 field in block 4.
#
# + name - The name of the field  
# + Nrtv - The narrative
public type MT70 record {|
    string name?;
    Nrtv Nrtv;
|};

# Defines the MT77A field in block 4.
#
# + name - The name of the field  
# + Nrtv - The narrative
public type MT77A record {|
    string name?;
    Nrtv Nrtv;
|};

# Defines the MT77B field in block 4.
#
# + name - The name of the field  
# + Nrtv - The narrative in the field
public type MT77B record {|
    string name?;
    Nrtv Nrtv;
|};

# Defines the MT79 field in block 4.
#
# + name - The name of the field  
# + Nrtv - The array of narratives of the field
public type MT79 record {|
    string name?;
    Nrtv[] Nrtv;
|};

# Defines the MT33B field in block 4.
#
# + name - The name of the field  
# + Ccy - The currency  
# + Amnt - The amount
public type MT33B record {|
    string name?;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the code.
#
# + content - The content of the code  
# + number - The attribute number
public type Cd record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT71A field in block 4.
#
# + name - The name of the field  
# + Cd - The code
public type MT71A record {|
    string name?;
    Cd Cd;
|};

# Defines the MT25A field in block 4.
#
# + name - The name of the field  
# + Acc - The account
public type MT25A record {|
    string name?;
    Acc Acc;
|};

# Defines the rate.
#
# + content - The content of the rate  
# + number - The attribute number
public type Rt record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT36 field in block 4.
#
# + name - The name of the field  
# + Rt - The rate
public type MT36 record {|
    string name?;
    Rt Rt;
|};

# Defines the MT62F field in block 4.
#
# + name - The name of the field  
# + Cd - The code  
# + Dt - The date  
# + Ccy - The currency  
# + Amnt - The amount
public type MT62F record {|
    string name?;
    Cd Cd;
    Dt Dt;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the MT60M field in block 4.
#
# + name - The name of the field  
# + Cd - The code  
# + Dt - The date  
# + Ccy - The currency  
# + Amnt - The amount
public type MT60M record {|
    string name?;
    Cd Cd;
    Dt Dt;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the MT62M field in block 4.
#
# + name - The name of the field  
# + Cd - The code  
# + Dt - The date  
# + Ccy - The currency  
# + Amnt - The amount
public type MT62M record {|
    string name?;
    Cd Cd;
    Dt Dt;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the MT65 field in block 4.
#
# + name - The name of the field  
# + Cd - The code  
# + Dt - The date  
# + Ccy - The currency  
# + Amnt - The amount
public type MT65 record {|
    string name?;
    Cd Cd;
    Dt Dt;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the MT60F field in block 4.
#
# + name - The name of the field  
# + Cd - The code  
# + Dt - The date  
# + Ccy - The currency  
# + Amnt - The amount
public type MT60F record {|
    string name?;
    Cd Cd;
    Dt Dt;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the MT64 field in block 4.
#
# + name - The name of the field  
# + Cd - The code  
# + Dt - The date  
# + Ccy - The currency  
# + Amnt - The amount
public type MT64 record {|
    string name?;
    Cd Cd;
    Dt Dt;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the MT28C field in block 4.
#
# + name - The name of the field  
# + StmtNo - The statement number  
# + SeqNo - The sequence number 
public type MT28C record {|
    string name?;
    StmtNo StmtNo;
    SeqNo SeqNo?;
|};

# Defines the statement number.
#
# + content - The content of the statement number  
# + number - The attribute number
public type StmtNo record {|
    decimal content;
    @xmldata:Attribute
    string number?;
|};

# Defines the sequence number.
#
# + content - The content of the sequence number  
# + number - The attribute number
public type SeqNo record {|
    decimal content;
    @xmldata:Attribute
    string number?;
|};

# Defines the transaction type.
#
# + content - The content of the transaction type  
# + number - The attribute number
public type TranTyp record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the reference account owner.
#
# + content - The content of the reference account owner  
# + number - The attribute number
public type RefAccOwn record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the reference account service institution.
#
# + content - The content of the reference account service institution  
# + number - The attribute number
public type RefAccSerInst record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the supplementary details.
#
# + content - The content of the supplementary details  
# + number - The attribute number
public type SpmtDtls record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the comment field.
#
# + content - The content of the comment  
# + number - The attribute number
public type Cmnt record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT61 field in block 4.
#
# + name - The name of the field  
# + Cd - The code  
# + ValDt - The value date  
# + NtryDt - The entry date   
# + FndCd - The fund code   
# + Amnt - The amount  
# + TranTyp - The transaction type 
# + IdnCd - The identification Code 
# + RefAccOwn - The reference account owner  
# + RefAccSerInst - The reference account service institution   
# + SpmtDtls - The supplementary details    
public type MT61 record {|
    string name?;
    Cd Cd;
    Dt ValDt;
    Dt NtryDt?;
    Ccy FndCd?;
    Amnt Amnt;
    TranTyp TranTyp;
    Cd IdnCd;
    RefAccOwn RefAccOwn;
    RefAccSerInst RefAccSerInst?;
    SpmtDtls SpmtDtls?;
|};

# Defines the MT90D field in block 4.
#
# + name - The name of the field  
# + TtlNum - The total number of entries
# + Ccy - The currency  
# + Amnt - The amount
public type MT90D record {|
    string name?;
    TtlNum TtlNum;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the MT90C field in block 4.
#
# + name - The name of the field  
# + TtlNum - The total number of entries 
# + Ccy - The currency  
# + Amnt - The amount
public type MT90C record {|
    string name?;
    TtlNum TtlNum;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the MT28 field in block 4.
#
# + name - The name of the field  
# + StmtNo - The statement number  
# + SeqNo - The sequence number
public type MT28 record {|
    string name?;
    StmtNo StmtNo;
    SeqNo SeqNo?;
|};

# Defines the MT86 field in block 4.
#
# + name - The name of the field  
# + AddInfo - The additional information
public type MT86 record {|
    string name?;
    AddInfo[] AddInfo;
|};

# Defines the total number of messages.
#
# + content - The content of the total number  
# + number - The attribute number
public type TtlNum record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the instruction code.
#
# + content - The content of the instruction code  
# + number - The attribute number
public type InstrnCd record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT23E field in block 4.
#
# + name - The name of the field  
# + InstrnCd - The instruction code  
# + AddInfo - The additional information 
public type MT23E record {|
    string name?;
    InstrnCd InstrnCd;
    AddInfo AddInfo?;
|};

# Defines the MT57B field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type   
# + PrtyIdn - The party identification   
# + Lctn - The location 
public type MT57B record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Lctn Lctn?;
|};

# Defines the component field.
#
# + content - The content of the component  
# + number - The attribute number
public type Component record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the additional information.
#
# + content - The content of the additional information  
# + number - The attribute number
public type AddInfo record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the party identification type.
#
# + content - The content of the party identification type  
# + number - The attribute number
public type PrtyIdnTyp record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT51A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type   
# + PrtyIdn - The party identification   
# + IdnCd - The identification code
public type MT51A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

# Defines the MT52A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type (optional)  
# + PrtyIdn - The party identification (optional)  
# + IdnCd - The identification code
public type MT52A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

# Defines the MT56A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + IdnCd - The identification code
public type MT56A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

# Defines the MT56C field in block 4.
#
# + name - The name of the field  
# + PrtyIdn - The party identification
public type MT56C record {|
    string name?;
    PrtyIdn PrtyIdn;
|};

# Defines the MT56D field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + Nm - The name  
# + AdrsLine - The address line
public type MT56D record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

# Defines the MT57A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + IdnCd - The identification code
public type MT57A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

# Defines the MT57D field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + Nm - The name  
# + AdrsLine - The address line
public type MT57D record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

# Defines the MT52C field in block 4.
#
# + name - The name of the field  
# + PrtyIdn - The party identification
public type MT52C record {|
    string name?;
    PrtyIdn PrtyIdn;
|};

# Defines the MT59 field in block 4.
#
# + name - The name of the field  
# + Acc - The account  
# + Nm - The name  
# + AdrsLine - The address line
public type MT59 record {|
    string name?;
    Acc Acc?;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

# Defines the MT59A field in block 4.
#
# + name - The name of the field  
# + Acc - The account  
# + IdnCd - The identification code
public type MT59A record {|
    string name?;
    Acc Acc?;
    IdnCd IdnCd;
|};

# Defines the MT52D field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + Nm - The name  
# + AdrsLine - The address line
public type MT52D record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

# Defines the MT53B field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + Lctn - The location
public type MT53B record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Lctn Lctn?;
|};

# Defines the MT53D field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + Nm - The name  
# + AdrsLine - The address line
public type MT53D record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

# Defines the MT55A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + IdnCd - The identification code
public type MT55A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

# Defines the MT55B field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + Lctn - The location
public type MT55B record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Lctn Lctn?;
|};

# Defines the MT55D field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + Nm - The name  
# + AdrsLine - The address line
public type MT55D record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

# Defines a tag in block 5.
#
# + name - The name of the tag  
# + value - The value of the tag
public type Tag record {|
    string name?;
    string value;
|};

# Defines Block 5 in the message structure.
#
# + tag - The tag in the block
public type Block5 record {|
    Tag tag?;
|};

# Defines unparsed text messages.
#
# + text - Array of unparsed text strings
public type UnparsedTexts record {|
    string[] text;
|};

# Defines the time.
#
# + content - The content of the time   
# + number - The attribute number
public type Tm record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the sign of time zone.
#
# + content - The content of the sign   
# + number - The attriubute number
public type Sgn record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the time offset.
#
# + content - The content of time offset  
# + number - The attribute number
public type TmOfst record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT13C field in block 4.
#
# + name - The name of the field  
# + Cd - The code  
# + Tm - The time  
# + Sgn - The sign  
# + TmOfst - The time offset
public type MT13C record {|
    string name?;
    Cd Cd;
    Tm Tm;
    Sgn Sgn;
    TmOfst TmOfst;
|};

# Defines the MT19 field in block 4.
#
# + name - The name of the field  
# + Amnt - The amount
public type MT19 record {|
    string name?;
    Amnt Amnt;
|};

# Defines the type.
#
# + content - The content of type  
# + number - The attribute number
public type Typ record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT23 field in block 4.
#
# + name - The name of the field  
# + Cd - The code
public type MT23 record {|
    string name?;
    Cd Cd;
|};

# Defines the MT26T field in block 4.
#
# + name - The name of the field  
# + Typ - The type
public type MT26T record {|
    string name?;
    Typ Typ;
|};

# Defines the MT32A field in block 4.
#
# + name - The name of the field  
# + Dt - The date  
# + Ccy - The currency  
# + Amnt - The amount
public type MT32A record {|
    string name?;
    Dt Dt;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the MT50A field in block 4.
#
# + name - The name of the field  
# + Acc - The account  
# + IdnCd - The identification code
public type MT50A record {|
    string name?;
    Acc Acc?;
    IdnCd IdnCd;
|};

# Defines the MT50K field in block 4.
#
# + name - The name of the field  
# + Acc - The account  
# + Nm - The names  
# + AdrsLine - The address lines
public type MT50K record {|
    string name?;
    Acc Acc?;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

# Defines the MT53A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + IdnCd - The identification code
public type MT53A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

# Defines the location.
#
# + content - The content of location  
# + number - The attribute number
public type Lctn record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT53C field in block 4.
#
# + name - The name of the field  
# + Acc - The account
public type MT53C record {|
    string name?;
    Acc Acc;
|};

# Defines the MT54A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + IdnCd - The identification code
public type MT54A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

# Defines the MT52B field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + Lctn - The location
public type MT52B record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Lctn Lctn?;
|};

# Defines the MT71F field in block 4.
#
# + name - The name of the field  
# + Ccy - The currency  
# + Amnt - The amount
public type MT71F record {|
    string name?;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the MT71G field in block 4.
#
# + name - The name of the field  
# + Ccy - The currency  
# + Amnt - The amount
public type MT71G record {|
    string name?;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the MT72 field in block 4.
#
# + name - The name of the field  
# + Cd - The code
public type MT72 record {|
    string name?;
    Cd Cd;
|};

# Defines the MT23B field in block 4.
#
# + name - The name of the field  
# + Typ - The type
public type MT23B record {|
    string name?;
    Typ Typ;
|};

# Defines the MT54B field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + Lctn - The location
public type MT54B record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Lctn Lctn;
|};

# Defines the MT54D field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + Nm - The names  
# + AdrsLine - The address lines
public type MT54D record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

# Defines the MT21C field in block 4.
#
# + name - The name of the field  
# + Ref - The reference of the field
public type MT21C record {|
    string name?;
    Ref Ref;
|};

# Defines the MT21D field in block 4.
#
# + name - The name of the field  
# + Ref - The reference of the field
public type MT21D record {|
    string name?;
    Ref Ref;
|};

# Defines the elements of underlying customer credit transfer details.
#
# + MT33B - Currency/Instructed Amount  
# + MT50A - Ordering Customer (Option A)  
# + MT50F - Ordering Customer (Option F)  
# + MT50K - Ordering Customer (Option K)  
# + MT52A - Ordering Institution (Option A)  
# + MT52D - Ordering Institution (Option D)  
# + MT56A - Intermediary Institution (Option A)  
# + MT56D - Intermediary Institution (Option D)  
# + MT57A - Account with Institution (Option A)  
# + MT57B - Account with Institution (Option B) 
# + MT57D - Account with Institution (Option D)  
# + MT59 - Beneficiary Customer  
# + MT59A - Beneficiary Customer (Option A)  
# + MT59F - Beneficiary Customer (Option F)  
# + MT70 - Remmitance Information  
# + MT72 - Sender to Receiver Information
public type UndrlygCstmrCdtTrf record {|
    MT33B MT33B?;
    MT50A MT50A?;
    MT50F MT50F?;
    MT50K MT50K?;
    MT52A MT52A?;
    MT52D MT52D?;
    MT56A MT56A?;
    MT56D MT56D?;
    MT57A MT57A?;
    MT57B MT57B?;
    MT57D MT57D?;
    MT59 MT59?;
    MT59A MT59A?;
    MT59F MT59F?;
    MT70 MT70?;
    MT72 MT72?;
|};

# Defines the elements of the copy of original message.
#
# + MT12 - field 12 of original message
# + MT13C - field 13C of original message  
# + MT13D - field 13D of original message  
# + MT19 - field 19 of original message  
# + MT20 - field 20 of original message  
# + MT21 - field 21 of original message  
# + MT21C - field 21C of original message  
# + MT21D - field 21D of original message  
# + MT21E - field 21E of original message  
# + MT21F - field 21F of original message  
# + MT21R - field 21R of original message  
# + MT23B - field 23B of original message  
# + MT23E - field 23E of original message  
# + MT25 - field 25 of original message  
# + MT25A - field 25A of original message  
# + MT25P - field 25P of original message  
# + MT26T - field 26T of original message  
# + MT28 - field 28 of original message  
# + MT28C - field 28C of original message  
# + MT28D - field 28D of original message  
# + MT30 - field 30 of original message  
# + MT32A - field 32A of original message  
# + MT32B - field 32B of original message  
# + MT33B - field 33B of original message  
# + MT34F - field 34F of original message  
# + MT36 - field 36 of original message  
# + MT50A - field 50A of original message  
# + MT50C - field 50C of original message  
# + MT50F - field 50F of original message  
# + MT50K - field 50K of original message  
# + MT50L - field 50L of original message  
# + MT50G - field 50G of original message  
# + MT50H - field 50H of original message  
# + MT51A - field 51A of original message  
# + MT52A - field 52A of original message  
# + MT52B - field 52B of original message  
# + MT52C - field 52C of original message  
# + MT52D - field 52D of original message 
# + MT53A - field 53A of original message  
# + MT53B - field 53B of original message  
# + MT53D - field 53D of original message  
# + MT54A - field 54A of original message  
# + MT54B - field 54B of original message  
# + MT54D - field 54D of original message  
# + MT55A - field 55A of original message  
# + MT55B - field 55B of original message  
# + MT55D - field 55D of original message  
# + MT56A - field 56A of original message  
# + MT56C - field 56C of original message  
# + MT56D - field 56D of original message 
# + MT57A - field 57A of original message  
# + MT57B - field 57B of original message  
# + MT57C - field 57C of original message  
# + MT57D - field 57D of original message 
# + MT58A - field 58A of original message  
# + MT58D - field 58D of original message  
# + MT59 - field 59 of original message 
# + MT59A - field 59A of original message 
# + MT59F - field 59F of original message  
# + MT60F - field 60F of original message  
# + MT60M - field 60M of original message  
# + MT61 - field 61 of original message  
# + MT62F - field 62F of original message  
# + MT62M - field 62M of original message  
# + MT64 - field 64 of original message  
# + MT65 - field 65 of original message  
# + MT70 - field 70 of original message  
# + MT71A - field 71A of original message  
# + MT71F - field 71F of original message  
# + MT71G - field 71G of original message  
# + MT72 - field 72 of original message  
# + MT77B - field 77B of original message  
# + MT77T - field 77T of original message  
# + MT86 - field 86 of original message  
# + MT90C - field 90C of original message  
# + MT90D - field 90D of original message
public type MessageCopy record {|
    MT12 MT12?;
    MT13C MT13C?;
    MT13D MT13D?;
    MT19 MT19?;
    MT20 MT20?;
    MT21 MT21?;
    MT21C MT21C?;
    MT21D MT21D?;
    MT21E MT21E?;
    MT21F MT21F?;
    MT21R MT21R?;
    MT23B MT23B?;
    MT23E[] MT23E?;
    MT25|MT25A MT25?;
    MT25A MT25A?;
    MT25P MT25P?;
    MT26T MT26T?;
    MT28 MT28?;
    MT28C MT28C?;
    MT28D MT28D?;
    MT30 MT30?;
    MT32A MT32A?;
    MT32B MT32B?;
    MT33B MT33B?;
    MT34F[] MT34F?;
    MT36 MT36?;
    MT50A MT50A?;
    MT50C MT50C?;
    MT50F MT50F?;
    MT50K MT50K?;
    MT50L MT50L?;
    MT50G MT50G?;
    MT50H MT50H?;
    MT51A MT51A?;
    MT52A MT52A?;
    MT52B MT52B?;
    MT52C MT52C?;
    MT52D MT52D?;
    MT53A MT53A?;
    MT53B MT53B?;
    MT53D MT53D?;
    MT54A MT54A?;
    MT54B MT54B?;
    MT54D MT54D?;
    MT55A MT55A?;
    MT55B MT55B?;
    MT55D MT55D?;
    MT56A MT56A?;
    MT56C MT56C?;
    MT56D MT56D?;
    MT57A MT57A?;
    MT57B MT57B?;
    MT57C MT57C?;
    MT57D MT57D?;
    MT58A MT58A?;
    MT58D MT58D?;
    MT59 MT59?;
    MT59A MT59A?;
    MT59F MT59F?;
    MT60F[] MT60F?;
    MT60M[] MT60M?;
    MT61[] MT61?;
    MT62F[] MT62F?;
    MT62M[] MT62M?;
    MT64[] MT64?;
    MT65[] MT65?;
    MT70 MT70?;
    MT71A MT71A?;
    MT71F MT71F?;
    MT71G MT71G?;
    MT72 MT72?;
    MT77B MT77B?;
    MT77T MT77T?;
    MT86[] MT86?;
    MT90C MT90C?;
    MT90D MT90D?;
|};
