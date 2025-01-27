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
    string value?;
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
    ValidationFlag ValidationFlag?;
    NdToNdTxRef NdToNdTxRef?;
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
    Nm[] Nm;
    AdrsLine[] AdrsLine;
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
    CdTyp[] CdTyp?;
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

# Defines the MT71B field in block 4.
#
# + name - The name of the field  
# + Nrtv - The narrative
public type MT71B record {|
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
    Lctn Lctn?;
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
    MT33B MT33B?;
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

# Defines the MT15A field in block 4.
#
# + name - The name of the field  
# + EmpField - Empty field
public type MT15A record {|
    string name?;
    EmpField EmpField;
|};

# Defines the MT22A field in block 4.
#
# + name - The name of the field  
# + OpType - The operation type
public type MT22A record {|
    string name?;
    OpType OpType;
|};

# Defines the type of operation.
#
# + content - The content of type  
# + number - The attribute number
public type OpType record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT94A field in block 4.
#
# + name - The name of the field  
# + scope - scope
public type MT94A record {|
    string name?;
    Scope scope;
|};

# Defines the scope.
#
# + content - The content of scope  
# + number - The attribute number
public type Scope record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT22C field in block 4.
#
# + name - The name of the field  
# + PtyPrefix1 - Party Prefix 1  
# + PtyPrefix2 - Party Prefix 2    
# + PtySuffix1 - Party Suffix 1    
# + PtySuffix2 - Party Suffix 2    
# + RefCd - Reference Code
public type MT22C record {|
    string name?;
    PtyPrefix1 PtyPrefix1;
    PtyPrefix2 PtyPrefix2;
    PtySuffix1 PtySuffix1;
    PtySuffix2 PtySuffix2;
    RefCd RefCd;
|};

# Defines the Reference Code.
#
# + content - The content of reference code  
# + number - The attribute number
public type RefCd record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the Party Prefix 1.
#
# + content - The content of party prefix 1  
# + number - The attribute number
public type PtyPrefix1 record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the Party Prefix 2.
#
# + content - The content of party prefix 2  
# + number - The attribute number
public type PtyPrefix2 record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the Party Suffix 1
#
# + content - The content of party suffix 1  
# + number - The attribute number
public type PtySuffix1 record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the Party Suffix 2
#
# + content - The content of party suffix 2  
# + number - The attribute number
public type PtySuffix2 record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT17T field in block 4.
#
# + name - The name of the field  
# + Indctr - Indicator
public type MT17T record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT17U field in block 4.
#
# + name - The name of the field  
# + Indctr - Indicator
public type MT17U record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT17I field in block 4.
#
# + name - The name of the field  
# + Indctr - Indicator
public type MT17I record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT82A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + IdnCd - The identification code
public type MT82A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

# Defines the MT87A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + IdnCd - The identification code
public type MT87A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

# Defines the MT83A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + IdnCd - The identification code
public type MT83A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

# Defines the MT77H field in block 4.
#
# + name - The name of the field   
# + Typ - type of Agreement  
# + Dt - date
# + Ver - version
public type MT77H record {|
    string name?;
    Typ Typ;
    Dt Dt?;
    Ver Ver?;
|};

# Defines the Version
#
# + content - The content of version  
# + number - The attribute number
public type Ver record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Description.Defines the MT77D field in block 4.
#
# + name - The name of the field   
# + Nrtv - narrative
public type MT77D record {|
    string name?;
    Nrtv Nrtv;
|};

# Defines the MT14C field in block 4.
#
# + name - The name of the field   
# + Year - Year
public type MT14C record {|
    string name?;
    Year Year;
|};

# Defines the Year
#
# + content - The content of year  
# + number - The attribute number
public type Year record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT17F field in block 4.
#
# + name - The name of the field   
# + Indctr - Indicator
public type MT17F record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT17O field in block 4.
#
# + name - The name of the field   
# + Indctr - Indicator
public type MT17O record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT32E field in block 4.
#
# + name - The name of the field  
# + Ccy - Currency
public type MT32E record {|
    string name?;
    Ccy Ccy;
|};

# Defines the MT30U field in block 4.
#
# + name - The name of the field  
# + Dt - Date
public type MT30U record {|
    string name?;
    Dt Dt;
|};

# Defines the MT14S field in block 4.
#
# + name - The name of the field  
# + RtSrc - Rate Source  
# + TimeLoc - Time and Location
public type MT14S record {|
    string name?;
    RtSrc RtSrc;
    TimeLoc TimeLoc?;
|};

# Defines the Rate Source.
#
# + content - The content of rate source  
# + number - The attribute number
public type RtSrc record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the Time and Location.
#
# + content - The content of time and location  
# + number - The attribute number
public type TimeLoc record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT26K field in block 4.
#
# + name - The name of the field  
# + calcAgent - Calculation Agent
public type MT26K record {|
    string name?;
    calcAgent calcAgent;
|};

# Defines the Calculation Agent.
#
# + content - The content of calculation agent  
# + number - The attribute number
public type calcAgent record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT21A field in block 4.
#
# + name - The name of the field  
# + MsgId - The message id in the field
public type MT21A record {|
    string name?;
    MsgId MsgId;
|};

# Defines the MT14E field in block 4.
#
# + name - The name of the field  
# + Ref - Reference
public type MT14E record {|
    string name?;
    Ref Ref;
|};

# Defines the MT15B field in block 4.
#
# + name - The name of the field  
# + EmpField - Empty field
public type MT15B record {|
    string name?;
    EmpField EmpField;
|};

# Defines the MT30T field in block 4.
#
# + name - The name of the field  
# + Dt - Date
public type MT30T record {|
    string name?;
    Dt Dt;
|};

# Defines the MT30V field in block 4.
#
# + name - The name of the field  
# + Dt - Date
public type MT30V record {|
    string name?;
    Dt Dt;
|};

# Defines the MT39M field in block 4.
#
# + name - The name of the field  
# + CntyCd - Country Code
public type MT39M record {|
    string name?;
    CntyCd CntyCd;
|};

# Defines the Country Code.
#
# + content - The content of country code
# + number - The attribute number
public type CntyCd record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT35C field in block 4.
#
# + name - The name of the field  
# + DigiTknId - Digital Token Identifier
# + Desc - Description
public type MT35C record {|
    string name?;
    DigiTknId DigiTknId;
    Desc Desc?;
|};

# Defines the Digital Token Identifier.
#
# + content - The content of digital token identifier
# + number - The attribute number
public type DigiTknId record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the description.
#
# + content - The content of description
# + number - The attribute number
public type Desc record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT15C field in block 4.
#
# + name - The name of the field  
# + EmpField - Empty field
public type MT15C record {|
    string name?;
    EmpField EmpField;
|};

# Defines the Empty field.
#
# + content - The content of empty field
# + number - The attribute number
public type EmpField record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT29A field in block 4.
#
# + name - The name of the field  
# + Nrtv - Narrative
public type MT29A record {|
    string name?;
    Nrtv Nrtv;
|};

# Defines the MT24D field in block 4.
#
# + name - The name of the field  
# + method - The method
# + AddInfo - Additional Information
public type MT24D record {|
    string name?;
    Method method;
    AddInfo AddInfo?;
|};

# Defines the method.
#
# + content - The content of method
# + number - The attribute number
public type Method record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT84A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + IdnCd - The identification code
public type MT84A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

# Defines the MT85A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + IdnCd - The identification code
public type MT85A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

# Defines the MT88A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + IdnCd - The identification code
public type MT88A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

# Defines the MT26H field in block 4.
#
# + name - The name of the field  
# + MsgId - The message id in the field
public type MT26H record {|
    string name?;
    MsgId MsgId;
|};

# Defines the MT21G field in block 4.
#
# + name - The name of the field  
# + MsgId - The message id in the field
public type MT21G record {|
    string name?;
    MsgId MsgId;
|};

# Defines the MT15D field in block 4.
#
# + name - The name of the field  
# + EmpField - Empty field
public type MT15D record {|
    string name?;
    EmpField EmpField;
|};

# Defines the MT17A field in block 4.
#
# + name - The name of the field  
# + Indctr - Indicator
public type MT17A record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT16A field in block 4.
#
# + name - The name of the field  
# + nmb - Number
public type MT16A record {|
    string name?;
    nmb nmb;
|};

# Defines the Number.
#
# + content - The content of number
# + number - The attribute number
public type nmb record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT15E field in block 4.
#
# + name - The name of the field
# + EmpField - Empty field
public type MT15E record {|
    string name?;
    EmpField EmpField;
|};

# Defines the MT81A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + IdnCd - The identification code
public type MT81A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

# Defines the MT89A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + IdnCd - The identification code
public type MT89A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

# Defines the MT96A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + IdnCd - The identification code
public type MT96A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

# Defines the MT22S field in block 4.
#
# + name - The name of the field  
# + SideId - Side Indicator  
# + Idfier - Identification
public type MT22S record {|
    string name?;
    SideId SideId;
    Idfier Idfier?;
|};

# Defines the Side Indicator.
#
# + content - The content of side indicator
# + number - The attribute number
public type SideId record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT22T field in block 4.
#
# + name - The name of the field
# + Idfier - Identification
public type MT22T record {|
    string name?;
    Idfier Idfier;
|};

# Defines the MT17E field in block 4.
#
# + name - The name of the field
# + Indctr - Indicator
public type MT17E record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT22U field in block 4.
#
# + name - The name of the field
# + ProdId - Product Identifier
public type MT22U record {|
    string name?;
    ProdId ProdId;
|};

# Defines the Product Identifier.
#
# + content - The content of product identifier
# + number - The attribute number
public type ProdId record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Define the MT35B field in block 4.
#
# + name - The name of the field  
# + InstrId - Identification of Instrument  
# + InstrDesc - Description of Instrument
public type MT35B record {|
    string name?;
    InstrId InstrId?;
    InstrDesc InstrDesc?;
|};

# Defines the Identification of Instrument.
#
# + content - The content of instrument identifier
# + number - The attribute number
public type InstrId record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the Description of Instrument.
#
# + content - The content of instrument description
# + number - The attribute number
public type InstrDesc record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT17H field in block 4.
#
# + name - The name of the field
# + Indctr - Indicator
public type MT17H record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT17P field in block 4.
#
# + name - The name of the field
# + Indctr - Indicator
public type MT17P record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT22V field in block 4.
#
# + name - The name of the field
# + Venue - Venue
public type MT22V record {|
    string name?;
    Venue Venue;
|};

# Defines the Venue.
#
# + content - The content of venue
# + number - The attribute number
public type Venue record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT98D field in block 4.
#
# + name - The name of the field  
# + Dt - Date  
# + Tm - Time  
# + Decimals - Decimals  
# + UtcInd - UTC Indicator
public type MT98D record {|
    string name?;
    Dt Dt;
    Tm Tm;
    Decimals Decimals?;
    UtcInd UtcInd?;
|};

# Defines the Decimals.
#
# + content - The content of decimals
# + number - The attribute number
public type Decimals record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the UTC Indicator.
#
# + content - The content of utc indicator
# + number - The attribute number
public type UtcInd record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT17W field in block 4.
#
# + name - The name of the field  
# + Flag - Flag
public type MT17W record {|
    string name?;
    Flag Flag;
|};

# Defines the Flag.
#
# + content - The content of flag
# + number - The attribute number
public type Flag record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT22W field in block 4.
#
# + name - The name of the field  
# + Idfier - Identification
public type MT22W record {|
    string name?;
    Idfier Idfier;
|};

# Defines the MT17Y field in block 4.
#
# + name - The name of the field  
# + Indctr - Indicator
public type MT17Y record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT17Z field in block 4.
#
# + name - The name of the field  
# + Indctr - Indicator
public type MT17Z record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT22Q field in block 4.
#
# + name - The name of the field  
# + Portfolio - Portfolio
public type MT22Q record {|
    string name?;
    Portfolio Portfolio;
|};

# Defines the Portfolio.
#
# + content - The content of portfolio
# + number - The attribute number
public type Portfolio record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT17L field in block 4.
#
# + name - The name of the field  
# + Indctr - Indicator
public type MT17L record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT17M field in block 4.
#
# + name - The name of the field
# + Indctr - Indicator
public type MT17M record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT17Q field in block 4.
#
# + name - The name of the field
# + Indctr - Indicator
public type MT17Q record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT17S field in block 4.
#
# + name - The name of the field
# + Indctr - Indicator
public type MT17S record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT17X field in block 4.
#
# + name - The name of the field
# + Indctr - Indicator
public type MT17X record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT98G field in block 4.
#
# + name - The name of the field  
# + Dt - Date  
# + Tm - Tm  
# + Decimals - Decimals  
# + UtcInd - UTC Indicator
public type MT98G record {|
    string name?;
    Dt Dt;
    Tm Tm;
    Decimals Decimals?;
    UtcInd UtcInd?;
|};

# Defines the MT98H field in block 4.
#
# + name - The name of the field  
# + Tm - Tm  
# + Decimals - Decimals  
# + UtcInd - UTC Indicator
public type MT98H record {|
    string name?;
    Tm Tm;
    Decimals Decimals?;
    UtcInd UtcInd?;
|};

# Defines the MT34C field in block 4.
#
# + name - The name of the field  
# + CommType - Commission Type  
# + Sign - Sign 
# + Ccy - Currency/Percent  
# + Amnt - Amount/Rate
public type MT34C record {|
    string name?;
    CommType CommType;
    Sign Sign?;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the Commission Type.
#
# + content - The content of commission type
# + number - The attribute number
public type CommType record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the Sign of Currency.
#
# + content - The content of sign
# + number - The attribute number
public type Sign record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines MT22L field in block 4.
#
# + name - The name of the field  
# + RptJuris - Reporting Jurisdiction
public type MT22L record {|
    string name?;
    RptJuris RptJuris;
|};

# Defines the Reporting Jurisdiction.
#
# + content - The content of reporting jurisdiction
# + number - The attribute number
public type RptJuris record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT91A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - The party identification type  
# + PrtyIdn - The party identification  
# + IdnCd - The identification code
public type MT91A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

# Defines the MT22M field in block 4.
#
# + name - The name of the field  
# + Nmspace - Namespace
public type MT22M record {|
    string name?;
    Nmspace Nmspace;
|};

# Defines the Namespace.
#
# + content - The content of namespace
# + number - The attribute number
public type Nmspace record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT22N field in block 4.
#
# + name - The name of the field  
# + Idfier - Identifier
public type MT22N record {|
    string name?;
    Idfier Idfier;
|};

# Defines the Identifier for transaction.
#
# + content - The content of identifier
# + number - The attribute number
public type Idfier record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT22P field in block 4.
#
# + name - The name of the field  
# + Nmspace - Namespace
public type MT22P record {|
    string name?;
    Nmspace Nmspace;
|};

# Defines the MT22R field in block 4.
#
# + name - The name of the field  
# + Idfier - Identifier
public type MT22R record {|
    string name?;
    Idfier Idfier;
|};

# Defines the MT15F field in block 4.
#
# + name - The name of the field
# + EmpField - Empty field
public type MT15F record {|
    string name?;
    EmpField EmpField;
|};

# Defines the MT21H field in block 4.
#
# + name - The name of the field  
# + EveType - Event Type  
# + RefPrevConf - Reference to Previous Confirmation
public type MT21H record {|
    string name?;
    EveType EveType;
    RefPrevConf RefPrevConf;
|};

# Defines the Event Type.
#
# + content - The content of event type
# + number - The attribute number
public type EveType record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the Reference to Previous Confirmation.
#
# + content - The content of reference to previous confirmation
# + number - The attribute number
public type RefPrevConf record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT30F field in block 4.
#
# + name - The name of the field  
# + Dt - Date
public type MT30F record {|
    string name?;
    Dt Dt;
|};

# Defines the MT32H field in block 4.
#
# + name - The name of the field  
# + Sign - Sign 
# + Ccy - Currency  
# + Amnt - Amount
public type MT32H record {|
    string name?;
    Sign Sign?;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the MT33E field in block 4.
#
# + name - The name of the field  
# + Ccy - Currency  
# + Amnt - Amount
public type MT33E record {|
    string name?;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the MT17N field in block 4.
#
# + name - The name of the field 
# + Indctr - Indicator
public type MT17N record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT21P field in block 4.
#
# + name - The name of the field  
# + MsgId - Reference
public type MT21P record {|
    string name?;
    MsgId MsgId;
|};

# Defines the MT17G field in block 4.
#
# + name - The name of the field  
# + Indctr - Indicator
public type MT17G record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT32G field in block 4.
#
# + name - The name of the field  
# + Ccy - Currency 
# + Amnt - Amount
public type MT32G record {|
    string name?;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the MT34B field in block 4.
#
# + name - The name of the field  
# + Ccy - Currency
# + Amnt - Amount
public type MT34B record {|
    string name?;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the MT22 field in block 4.
#
# + name - The name of the field  
# + Cd - The Code
# + CmnRef - Common Reference
public type MT22 record {|
    string name?;
    Cd Cd;
    CmnRef CmnRef;
|};

# Defines the Common Reference.
#
# + content - The content of common reference
# + number - The attribute number
public type CmnRef record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT31C field in block 4.
#
# + name - The name of the field
# + Dt - Date
public type MT31C record {|
    string name?;
    Dt Dt;
|};

# Defines the MT31G field in block 4.
#
# + name - The name of the field
# + Dt - Date
# + Tm - Time  
# + Lctn - Location
public type MT31G record {|
    string name?;
    Dt Dt;
    Tm Tm;
    Lctn Lctn;
|};

# Defines the MT31E field in block 4.
#
# + name - The name of the field
# + Dt - Date
public type MT31E record {|
    string name?;
    Dt Dt;
|};

# Defines the MT26F field in block 4.
#
# + name - The name of the field
# + Typ - The type of settlement
public type MT26F record {|
    string name?;
    Typ Typ;
|};

# Defines the MT37K field in block 4.
#
# + name - The name of the field  
# + Ccy - Currency
# + Rt - Rate
public type MT37K record {|
    string name?;
    Ccy Ccy;
    Rt Rt;
|};

# Defines the MT34A field in block 4.
#
# + name - The name of the field  
# + Dt - Date  
# + Ccy - Currency  
# + Amnt - Amount
public type MT34A record {|
    string name?;
    Dt Dt;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the MT21N field in block 4.
#
# + name - The name of the field  
# + cntrctNum - Contract Number
public type MT21N record {|
    string name?;
    cntrctNum cntrctNum;
|};

# Defines the Contract Number.
#
# + content - The content of contract number  
# + number - The attribute number
public type cntrctNum record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT21N field in block 4.
#
# + name - The name of the field  
# + cntrctNum - Contract Number
public type MT21B record {|
    string name?;
    CmnRef cntrctNum;
|};

# Defines the MT12F field in block 4.
#
# + name - The name of the field  
# + Style - Option or Forward Style
public type MT12F record {|
    string name?;
    Style Style;
|};

# Defines the Style.
#
# + content - The content of style  
# + number - The attribute number
public type Style record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT12E field in block 4.
#
# + name - The name of the field
# + Style - Expiration Style
public type MT12E record {|
    string name?;
    Style Style;
|};

# Defines the MT12C field in block 4.
#
# + name - The name of the field
# + OpType - Option Type
public type MT12D record {|
    string name?;
    OpType OpType;
|};

# Defines the MT22K field in block 4.
#
# + name - The name of the field  
# + EveType - Type of Event
# + Nrtv - Narrative
public type MT22K record {|
    string name?;
    EveType EveType;
    Nrtv Nrtv?;
|};

# Defines the MT29H field in block 4.
#
# + name - The name of the field  
# + Lctn - Location
public type MT29H record {|
    string name?;
    Lctn Lctn;
|};

# Defines the MT17V field in block 4.
#
# + name - The name of the field  
# + Indctr - Indicator
public type MT17V record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT30X field in block 4.
#
# + name - The name of the field  
# + Dt - Date
public type MT30X record {|
    string name?;
    Dt Dt;
|};

# Defines the MT30A field in block 4.
#
# + name - The name of the field  
# + Dt - Date
# + Indctr - Indicator  
# + nmb - Number
public type MT30A record {|
    string name?;
    Dt Dt;
    Indctr Indctr;
    nmb nmb;
|};

# Defines the MT86A field in block 4.
#
# + name - The name of the field  
# + PrtyIdnTyp - Party Identification Type  
# + PrtyIdn - Party Identification
# + IdnCd - Identifier Code
public type MT86A record {|
    string name?;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn;
    IdnCd IdnCd;
|};

# Defines the MT30P field in block 4.
#
# + name - The name of the field  
# + Dt - Date
public type MT30P record {|
    string name?;
    Dt Dt;
|};

# Defines the MT30Q field in block 4.
#
# + name - The name of the field  
# + Dt - Date
public type MT30Q record {|
    string name?;
    Dt Dt;
|};

# Defines the MT30H field in block 4.
#
# + name - The name of the field  
# + Dt - Date
public type MT30H record {|
    string name?;
    Dt Dt;
|};

# Defines the MT22G field in block 4.
#
# + name - The name of the field  
# + BarrTyp - Barrier Type
public type MT22G record {|
    string name?;
    BarrTyp BarrTyp;
|};

# Defines the Barrier Type.
#
# + content - The content of barrier type  
# + number - The attribute number
public type BarrTyp record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT17C field in block 4.
#
# + name - The name of the field  
# + Indctr - Indicator
public type MT17C record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT37J field in block 4.
#
# + name - The name of the field  
# + Rt - Rate
public type MT37J record {|
    string name?;
    Rt Rt;
|};

# Defines the MT37L field in block 4.
#
# + name - The name of the field  
# + Rt - Rate
public type MT37L record {|
    string name?;
    Rt Rt;
|};

# Defines the MT29I field in block 4.
#
# + name - The name of the field  
# + BarrDeterBusinessDays - Barrier Determination Business Days
public type MT29I record {|
    string name?;
    BarrDeterBusinessDays BarrDeterBusinessDays;
|};

# Defines the Barrier Determination Business Days. 
#
# + content - The content of barrier determination business days
# + number - The attribute number
public type BarrDeterBusinessDays record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT14H field in block 4.
#
# + name - The name of the field  
# + Conv - Convention
public type MT14H record {|
    string name?;
    Conv Conv;
|};

# Defines the Convention.
#
# + content - The content of convention  
# + number - The attribute number
public type Conv record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT14K field in block 4.
#
# + name - The name of the field  
# + Conv - Convention
public type MT14K record {|
    string name?;
    Conv Conv;
|};

# Defines the MT14L field in block 4.
#
# + name - The name of the field  
# + Conv - Convention
public type MT14L record {|
    string name?;
    Conv Conv;
|};

# Defines the MT14M field in block 4.
#
# + name - The name of the field  
# + BarrTyp - Type
public type MT14M record {|
    string name?;
    BarrTyp BarrTyp;
|};

# Defines the MT29O field in block 4.
#
# + name - The name of the field  
# + Lctn - Location  
# + StartTm - Start Time  
# + EndTm - End Time
public type MT29O record {|
    string name?;
    Lctn Lctn;
    CtTm StartTm;
    CtTm EndTm;
|};

# Defines Continuous Time.
#
# + content - The content of time  
# + number - The attribute number
public type CtTm record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT14N field in block 4.
#
# + name - The name of the field  
# + Market - Market
public type MT14N record {|
    string name?;
    Market Market;
|};

# Defines the Market.
#
# + content - The content of market  
# + number - The attribute number
public type Market record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT29J field in block 4.
#
# + name - The name of the field
# + Lctn - Location
# + Tm - Time
public type MT29J record {|
    string name?;
    Lctn Lctn;
    CtTm Tm;
|};

# Defines the MT14O field in block 4.
#
# + name - The name of the field  
# + Typ - Type
public type MT14O record {|
    string name?;
    BarrTyp Typ;
|};

# Defines the MT33Z field in block 4.
#
# + name - The name of the field  
# + Amnt - Amount
public type MT33Z record {|
    string name?;
    Amnt Amnt;
|};

# Defines the MT30I field in block 4.
#
# + name - The name of the field  
# + Dt - Date or Start Date  
# + EndDt - End Date
public type MT30I record {|
    string name?;
    Dt Dt;
    Dt EndDt?;
|};

# Defines the MT15G field in block 4.
#
# + name - The name of the field  
# + EmpField - Empty field
public type MT15G record {|
    string name?;
    EmpField EmpField;
|};

# Defines the MT32Q field in block 4.
#
# + name - The name of the field  
# + Ccy1 - Currency 
# + Ccy2 - Currency
public type MT32Q record {|
    string name?;
    Ccy Ccy1;
    Ccy Ccy2;
|};

# Defines the MT15H field in block 4.
#
# + name - The name of the field  
# + EmpField - Empty field
public type MT15H record {|
    string name?;
    EmpField EmpField;
|};

# Defines the MT15I field in block 4.
#
# + name - The name of the field  
# + EmpField - Empty field
public type MT15I record {|
    string name?;
    EmpField EmpField;
|};

# Defines the MT12G field in block 4.
#
# + name - The name of the field  
# + Style - Early Termination  Style
public type MT12G record {|
    string name?;
    Style Style;
|};

# Defines the MT22Y field in block 4.
#
# + name - The name of the field  
# + Period - Period
public type MT22Y record {|
    string name?;
    Period Period;
|};

# Defines the Period.
#
# + content - The content of period  
# + number - The attribute number
public type Period record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT30Y field in block 4.
#
# + name - The name of the field  
# + Dt - Date
public type MT30Y record {|
    string name?;
    Dt Dt;
|};

# Defines the MT29L field in block 4.
#
# + name - The name of the field  
# + Dt - Date
# + Lctn - Location  
# + Tm - Time
public type MT29L record {|
    string name?;
    Dt Dt;
    Lctn Lctn;
    CtTm Tm;
|};

# Defines the MT29E field in block 4.
#
# + name - The name of the field  
# + Lctn - Location
# + Tm - Time
public type MT29E record {|
    string name?;
    Lctn Lctn;
    CtTm Tm;
|};

# Defines the MT29M field in block 4.
#
# + name - The name of the field  
# + Lctn - Location
# + Tm - Time
public type MT29M record {|
    string name?;
    Lctn Lctn;
    CtTm Tm;
|};

# Defines the MT29N field in block 4.
#
# + name - The name of the field  
# + Dt - Date
# + Lctn - Location  
# + Tm - Time
public type MT29N record {|
    string name?;
    Dt Dt;
    Lctn Lctn;
    CtTm Tm;
|};

# Defines the MT30Z field in block 4.
#
# + name - The name of the field  
# + Dt - Date
public type MT30Z record {|
    string name?;
    Dt Dt;
|};

# Defines the MT15J field in block 4.
#
# + name - The name of the field  
# + EmpField - Empty field
public type MT15J record {|
    string name?;
    EmpField EmpField;
|};

# Defines the MT14P field in block 4.
#
# + name - The name of the field  
# + Method - Method
public type MT14P record {|
    string name?;
    Method Method;
|};

# Defines the MT29Q field in block 4.
#
# + name - The name of the field  
# + ValvBusiDays - Valuation Business Days
public type MT29Q record {|
    string name?;
    ValvBusiDays ValvBusiDays;
|};

# Defines the Valuation Business Days.
#
# + content - The content of valuation business days
# + number - The attribute number
public type ValvBusiDays record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT14R field in block 4.
#
# + name - The name of the field  
# + Conv - Convention
public type MT14R record {|
    string name?;
    Conv Conv;
|};

# Defines the MT14Q field in block 4.
#
# + name - The name of the field  
# + Cons - Consequence
public type MT14Q record {|
    string name?;
    Cons Cons;
|};

# Defines the Consequence.
#
# + content - The content of consequence  
# + number - The attribute number
public type Cons record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT14B field in block 4.
#
# + name - The name of the field  
# + AdjTyp - Adjustment Type
public type MT14B record {|
    string name?;
    AdjTyp AdjTyp;
|};

# Defines the Adjustment Type.
#
# + content - The content of adjustment type  
# + number - The attribute number
public type AdjTyp record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT19C field in block 4.
#
# + name - The name of the field  
# + Sign - Sign
# + Fac - Factor
public type MT19C record {|
    string name?;
    SignM Sign;
    Fac Fac;
|};

# Defines the Math Sign.
#
# + content - The content of sign  
# + number - The attribute number
public type SignM record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the Factor.
#
# + content - The content of factor  
# + number - The attribute number
public type Fac record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT19Y field in block 4.
#
# + name - The name of the field  
# + Wght - Weight
public type MT19Y record {|
    string name?;
    Wght Wght;
|};

# Defines the Weight.
#
# + content - The content of weight  
# + number - The attribute number
public type Wght record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT30K field in block 4.
#
# + name - The name of the field  
# + Dt - Date or Start Date
# + EndDt - End Date
public type MT30K record {|
    string name?;
    Dt Dt;
    Dt EndDt?;
|};

# Defines the MT19Z field in block 4.
#
# + name - The name of the field  
# + Wght - Weight
public type MT19Z record {|
    string name?;
    Wght Wght;
|};

# Defines the MT15K field in block 4.
#
# + name - The name of the field  
# + EmpField - Empty field
public type MT15K record {|
    string name?;
    EmpField EmpField;
|};

# Defines the MT15L field in block 4.
#
# + name - The name of the field  
# + EmpField - Empty field
public type MT15L record {|
    string name?;
    EmpField EmpField;
|};

# Defines the MT15M field in block 4.
#
# + name - The name of the field  
# + EmpField - Empty field
public type MT15M record {|
    string name?;
    EmpField EmpField;
|};

# Defines the MT18A field in block 4.
#
# + name - The name of the field  
# + nmb - Number
public type MT18A record {|
    string name?;
    nmb nmb;
|};

# Defines the MT22B field in block 4.
#
# + name - The name of the field  
# + EveType - Type
public type MT22B record {|
    string name?;
    EveType EveType;
|};

# Defines the MT17R field in block 4.
#
# + name - The name of the field
# + Indctr - Indicator
public type MT17R record {|
    string name?;
    Indctr Indctr;
|};

# Defines the MT34E field in block 4.
#
# + name - The name of the field  
# + Sign - Sign
# + Ccy - Currency  
# + Amnt - Amount
public type MT34E record {|
    string name?;
    Sign Sign?;
    Ccy Ccy;
    Amnt Amnt;
|};

# Defines the MT37G field in block 4.
#
# + name - The name of the field  
# + Sign - Sign
# + Rt - Rate
public type MT37G record {|
    string name?;
    SignM Sign?;
    Rt Rt;
|};

# Defines the MT14D field in block 4.
#
# + name - The name of the field  
# + IsdaCd - Code
public type MT14D record {|
    string name?;
    IsdaCd IsdaCd;
|};

# Defines the ISDA Code.
#
# + content - The content of ISDA code  
# + number - The attribute number
public type IsdaCd record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT38J field in block 4.
#
# + name - The name of the field  
# + Indctr - Indicator  
# + nmb - Number
public type MT38J record {|
    string name?;
    Indctr Indctr;
    nmb nmb;
|};

# Defines the MT16R field in block 4.
#
# + name - The name of the field  
# + BlockSt - Start of Block
public type MT16R record {|
    string name?;
    BlockSt BlockSt;
|};

# Defines start of block.
#
# + content - The content of block start  
# + number - The attribute number
public type BlockSt record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines End of block.
#
# + content - The content of block End  
# + number - The attribute number
public type BlockEnd record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT20C field in block 4.
#
# + name - The name of the field  
# + Qual - Qualifier
# + Ref - Reference
public type MT20C record {|
    string name?;
    Qual Qual;
    Ref Ref;
|};

# Defines the Qualifier.
#
# + content - The content of qualifier  
# + number - The attribute number
public type Qual record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT23G field in block 4. 
#
# + name - The name of the field  
# + Fun - Function
# + SubFun - Sub Function
public type MT23G record {|
    string name?;
    Fun Fun;
    SubFun SubFun?;
|};

# Defines the Function.
#
# + content - The content of function  
# + number - The attribute number
public type Fun record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the Sub Function.
#
# + content - The content of sub function  
# + number - The attribute number
public type SubFun record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT23H field in block 4.
#
# + name - The name of the field  
# + Qual - Qualifier
# + Indctr - Indicator
public type MT22H record {|
    string name?;
    Qual Qual;
    Indctr Indctr;
|};

# Defines the MT99B field in block 4.
#
# + name - The name of the field
# + Qual - Qualifier
# + nmb - Number
public type MT99B record {|
    string name?;
    Qual Qual;
    nmb nmb;
|};

# Defines the MT16S field in block 4.
#
# + name - The name of the field  
# + BlockEnd - End of Block
public type MT16S record {|
    string name?;
    BlockEnd BlockEnd;
|};

# Defines the MT13A field in block 4.
#
# + name - The name of the field  
# + Qual - Qualifier
# + NumbId - Number Id
# + DtSrcSchm - Data Source Scheme
public type MT13A record {|
    string name?;
    Qual Qual;
    NumbId NumbId;
    DtSrcSchm DtSrcSchm?;
|};

# Defines the Number Id.
#
# + content - The content of number id  
# + number - The attribute number
public type NumbId record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the Data Source Scheme.
#
# + content - The content of data source scheme 
# + number - The attribute number
public type DtSrcSchm record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT98A field in block 4.
#
# + name - The name of the field  
# + Qual - Qualifier
# + Dt - Date
public type MT98A record {|
    string name?;
    Qual Qual;
    Dt Dt;
|};

# Defines the MT19A field in block 4.
#
# + name - The name of the field  
# + Qual - Qualifier
# + Sign - Sign  
# + CurrCd - Currency Code  
# + Amnt - Amount
public type MT19A record {|
    string name?;
    Qual Qual;
    Sign Sign?;
    CurrCd CurrCd;
    Amnt Amnt;
|};

# Defines the Currency Code.
#
# + content - The content of currency code  
# + number - The attribute number
public type CurrCd record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT92A field in block 4.
#
# + name - The name of the field  
# + Qual - Qualifier
# + Sign - Sign  
# + Rt - Rate
public type MT92A record {|
    string name?;
    Qual Qual;
    Sign Sign?;
    Rt Rt;
|};

# Defines the MT94C field in block 4.
#
# + name - The name of the field  
# + Qual - Qualifier
# + CntyCd - Country Code
public type MT94C record {|
    string name?;
    Qual Qual;
    CntyCd CntyCd;
|};

# Defines the MT95C field in block 4.
#
# + name - The name of the field  
# + Qual - Qualifier
# + DtSrcSchm - Data Source Scheme  
# + PropCd - Proprietary Code
public type MT95A record {|
    string name?;
    Qual Qual;
    DtSrcSchm DtSrcSchm;
    PropCd PropCd;
|};

# Defines the Proprietary Code.
#
# + content - The content of proprietary code
# + number - The attribute number
public type PropCd record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT97A field in block 4.
#
# + name - The name of the field  
# + Qual - Qualifier
# + AccNmb - Account Number
public type MT97A record {|
    string name?;
    Qual Qual;
    AccNmb AccNmb;
|};

# Defines the Account Number.
#
# + content - The content of account number  
# + number - The attribute number
public type AccNmb record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT70C field in block 4.
#
# + name - The name of the field  
# + Qual - Qualifier
# + Nrtv - Narrative
public type MT70C record {|
    string name?;
    Qual Qual;
    Nrtv Nrtv;
|};

# Defines the MT38A field in block 4.
#
# + name - The name of the field  
# + Period - Period
public type MT38A record {|
    string name?;
    Period Period;
|};

# Defines the MT37M field in block 4.
#
# + name - The name of the field  
# + Sign - Sign
# + Rt - Rate
public type MT37M record {|
    string name?;
    SignM Sign?;
    Rt Rt;
|};

# Defines the MT14F field in block 4.
#
# + name - The name of the field  
# + FlRt - Floating Rate Option
public type MT14F record {|
    string name?;
    FlRtOp FlRt;
|};

# Defines the Floating rate Option.
#
# + content - The content of floating rate option
# + number - The attribute number
public type FlRtOp record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT38D field in block 4.
#
# + name - The name of the field  
# + Period - Period
public type MT38D record {|
    string name?;
    Period Period;
|};

# Defines the MT38E field in block 4.
#
# + name - The name of the field
# + NmbFr - Number From
# + PerFr - Period From  
# + NmbTo - Number To  
# + PerTo - Period To
public type MT38G record {|
    string name?;
    NmbFr NmbFr;
    PerFr PerFr;
    NmbTo NmbTo;
    PerTo PerTo;
|};

# Defines the 'Number From' in MT38G.
#
# + content - content of 'Number From'  
# + number - attribute number
public type NmbFr record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the 'Period From' in MT38G.
#
# + content - content of 'Period From'
# + number - attribute number
public type PerFr record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the 'Number To' in MT38G.
#
# + content - content of 'Number To'
# + number - attribute number
public type NmbTo record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the 'Period To' in MT38G.
#
# + content - content of 'Period To'
# + number - attribute number
public type PerTo record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT23D field in block 4.
#
# + name - The name of the field
# + FraTyp - FRA Type
public type MT23D record {|
    string name?;
    FraTyp FraTyp;
|};

# Defines the FRA Type.
#
# + content - content of FRA type  
# + number - attribute number
public type FraTyp record {|
    string content;
    @xmldata:Attribute
    string number?;
|};

# Defines the MT37R field in block 4.
#
# + name - The name of the field  
# + Sign - Sign
# + Rt - Rate
public type MT37R record {|
    string name?;
    SignM Sign?;
    Rt Rt;
|};
