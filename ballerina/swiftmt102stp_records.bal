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

public type MT102STPBlock4 record {|
    MT19 MT19?;
    MT20 MT20;
    MT13C MT13C?;
    MT23 MT23;
    MT26T MT26T?;
    MT32A MT32A;
    MT36 MT36?;
    MT50A MT50A?;
    MT50F MT50F?;
    MT50K MT50K?;
    MT52A MT52A?;
    MT53A MT53A?;
    MT53C MT53C?;
    MT54A MT54A?;
    MT52B MT52B?;
    MT71A MT71A?;
    MT71G MT71G?;
    MT72 MT72?;
    MT77B MT77B?;
    MT102STPTransaction[] Transaction;
|};

public type MT102STPTransaction record {|
    MT13C MT13C?;
    MT21 MT21;
    MT26T MT26T?;
    MT33B MT33B?;
    MT32B MT32B;
    MT36 MT36?;
    MT50A MT50A?;
    MT50F MT50F?;
    MT50K MT50K?;
    MT52A MT52A?;
    MT57A MT57A?;
    MT59 MT59?;
    MT59A MT59A?;
    MT59F MT59F?;
    MT70 MT70?;
    MT71A MT71A?;
    MT71F MT71F?;
    MT71G MT71G?;
    MT77B MT77B?;
|};

public type MT102STPMessage record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT102STPBlock4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};
