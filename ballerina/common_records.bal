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

public type NdToNdTxRef record {|
    string name;
    string value;
|};

public type ValidationFlag record {|
    string name;
    string value;
|};

public type Block3 record {|
    NdToNdTxRef NdToNdTxRef?;
    ValidationFlag ValidationFlag?;
|};

public type Block1 record {|
    string applicationId?;
    string serviceId?;
    string logicalTerminal?;
    string sessionNumber?;
    string sequenceNumber?;
|};

public type Block2 record {|
    string messageType;
    string receiverAddress?;
    string messagePriority?;
    @xmldata:Attribute
    string 'type?;
|};

public type MsgId record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT20 record {|
    string name;
    MsgId msgId;
|};

public type MT50 record {|
    string name;
    Nm[] Nm?;
    AdrsLine[] AdrsLine?;
|};

public type Ref record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT21R record {|
    string name;
    Ref Ref;
|};

public type MT21E record {|
    string name;
    Ref Ref;
|};

public type MT58A record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

public type MT58D record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

public type MT12 record {|
    string name;
    Msg Msg;
|};

public type Msg record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT34F record {|
    string name;
    Ccy Ccy;
    Cd Cd?;
    Amnt Amnt;
|};

public type MsgIdx record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type Ttl record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT28D record {|
    string name;
    MsgIdx MsgIdx;
    Ttl Ttl;
|};

public type Dt record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT30 record {|
    string name;
    Dt Dt;
|};

public type Auth record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT25 record {|
    string name;
    Auth Auth;
|};

public type IdnCd record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT50C record {|
    string name;
    IdnCd IdnCd;
|};

public type PrtyIdn record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT50L record {|
    string name;
    PrtyIdn PrtyIdn;
|};

public type MT21 record {|
    string name;
    Ref Ref;
|};

public type MT21F record {|
    string name;
    Ref Ref;
|};

public type MT25P record {|
    string name;
    Acc Acc;
    IdnCd IdnCd;
|};

public type MT13D record {|
    string name;
    Dt Dt;
    Tm Tm;
    Sgn Sgn;
    TmOfst TmOfst;
|};

public type Ccy record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type Amnt record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT32B record {|
    string name;
    Ccy Ccy;
    Amnt Amnt;
|};

public type CdTyp record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type Nm record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type BrthDt record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type BrthPlc record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type CstmIdnNum record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type NtnlIdnNum record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type AdrsLine record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type CntyNTw record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT50F record {|
    string name;
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

public type Acc record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MtNum record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type SesnNum record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT11S record {|
    string name;
    MtNum MtNum;
    Dt Dt;
    SesnNum SesnNum?;
|};

public type MT11R record {|
    string name;
    MtNum MtNum;
    Dt Dt;
    SesnNum SesnNum?;
|};

public type MT50G record {|
    string name;
    Acc Acc;
    IdnCd IdnCd;
|};

public type MT50H record {|
    string name;
    Acc Acc;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

public type MT57C record {|
    string name;
    PrtyIdn PrtyIdn;
|};

public type MT59F record {|
    string name;
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

public type Nrtv record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT70 record {|
    string name;
    Nrtv Nrtv;
|};

public type MT77A record {|
    string name;
    Nrtv Nrtv;
|};

public type MT77B record {|
    string name;
    Nrtv Nrtv;
|};

public type MT79 record {|
    string name;
    Nrtv Nrtv;
|};

public type MT33B record {|
    string name;
    Ccy Ccy;
    Amnt Amnt;
|};

public type Cd record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT71A record {|
    string name;
    Cd Cd;
|};

public type MT25A record {|
    string name;
    Acc Acc;
|};

public type Rt record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT36 record {|
    string name;
    Rt Rt;
|};

public type MT62F record {|
    string name;
    Cd Cd;
    Dt Dt;
    Ccy Ccy;
    Amnt Amnt;
|};

public type MT60M record {|
    string name;
    Cd Cd;
    Dt Dt;
    Ccy Ccy;
    Amnt Amnt;
|};

public type MT62M record {|
    string name;
    Cd Cd;
    Dt Dt;
    Ccy Ccy;
    Amnt Amnt;
|};

public type MT28C record {|
    string name;
    StmtNo StmtNo;
    SeqNo SeqNo?;
|};

public type StmtNo record {|
    decimal \#content;
    @xmldata:Attribute
    string number;
|};

public type SeqNo record {|
    decimal \#content;
    @xmldata:Attribute
    string number;
|};

public type MT60F record {|
    string name;
    Cd Cd;
    Dt Dt;
    Ccy Ccy;
    Amnt Amnt;
|};

public type MT64 record {|
    string name;
    Cd Cd;
    Dt Dt;
    Ccy Ccy;
    Amnt Amnt;
|};

public type TranTyp record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type RefAccOwn record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type RefAccSerInst record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type SpmtDtls record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type Cmnt record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT61 record {|
    string name;
    Cd Cd;
    Dt ValDt;
    Dt NtryDt?;
    Ccy FndCd?;
    Amnt Amnt;
    TranTyp TranTyp;
    RefAccOwn RefAccOwn;
    RefAccSerInst RefAccSerInst?;
    SpmtDtls SpmtDtls?;
    Cmnt Cmnt?;
|};

public type MT65 record {|
    string name;
    Cd Cd;
    Dt Dt;
    Ccy Ccy;
    Amnt Amnt;
|};

public type MT90D record {|
    string name;
    TtlNum TtlNum;
    Ccy Ccy;
    Amnt Amnt;
|};

public type MT90C record {|
    string name;
    TtlNum TtlNum;
    Ccy Ccy;
    Amnt Amnt;
|};

public type MT28 record {|
    string name;
    StmtNo StmtNo;
    SeqNo SeqNo?;
|};

public type MT86 record {|
    string name;
    AddInfo[] AddInfo;
|};

public type TtlNum record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type InstrnCd record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT23E record {|
    string name;
    InstrnCd InstrnCd;
    AddInfo AddInfo?;
|};

public type MT57B record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Lctn Lctn?;
|};

public type Component record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type AddInfo record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type PrtyIdnTyp record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT51A record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

public type MT52A record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

public type MT56A record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

public type MT56C record {|
    string name;
    PrtyIdn PrtyIdn;
|};

public type MT56D record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

public type MT57A record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

public type MT57D record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

public type MT52C record {|
    string name;
    PrtyIdn PrtyIdn;
|};

public type MT59 record {|
    string name;
    Acc Acc?;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

public type MT59A record {|
    string name;
    Acc Acc?;
    IdnCd IdnCd;
|};

public type MT52D record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

public type MT53B record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Lctn Lctn?;
|};

public type MT53D record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

public type MT55A record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

public type MT55B record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Lctn Lctn?;
|};

public type MT55D record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

public type Tag record {|
    string name;
    string value;
|};

public type Block5 record {|
    Tag tag;
|};

public type UnparsedTexts record {|
    string[] text;
|};

public type Tm record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type Sgn record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type TmOfst record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT13C record {|
    string name;
    Cd Cd;
    Tm Tm;
    Sgn Sgn;
    TmOfst TmOfst;
|};

public type MT19 record {|
    string name;
    Amnt Amnt;
|};

public type Typ record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT23 record {|
    string name;
    Cd Cd;
|};

public type MT26T record {|
    string name;
    Typ Typ;
|};

public type MT32A record {|
    string name;
    Dt Dt;
    Ccy Ccy;
    Amnt Amnt;
|};

public type MT50A record {|
    string name;
    Acc Acc?;
    IdnCd IdnCd;
|};

public type MT50K record {|
    string name;
    Acc Acc?;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

public type MT53A record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

public type Lctn record {|
    string \#content;
    @xmldata:Attribute
    string number;
|};

public type MT53C record {|
    string name;
    Acc Acc;
|};

public type MT54A record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    IdnCd IdnCd;
|};

public type MT52B record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Lctn Lctn?;
|};

public type MT71F record {|
    string name;
    Ccy Ccy;
    Amnt Amnt;
|};

public type MT71G record {|
    string name;
    Ccy Ccy;
    Amnt Amnt;
|};

public type MT72 record {|
    string name;
    Cd Cd;
|};

public type MT23B record {|
    string name;
    Typ Typ;
|};

public type MT54B record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Lctn Lctn;
|};

public type MT54D record {|
    string name;
    PrtyIdnTyp PrtyIdnTyp?;
    PrtyIdn PrtyIdn?;
    Nm[] Nm;
    AdrsLine[] AdrsLine;
|};

public type MT21C record {|
    string name;
    Ref Ref;
|};

public type MT21D record {|
    string name;
    Ref Ref;
|};

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
