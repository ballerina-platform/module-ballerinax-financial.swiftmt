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

public type MT205COVBlock4 record {|
    MT20 MT20;
    MT21 MT21;
    MT13C MT13C?;
    MT32A MT32A;
    MT52A MT52A?;
    MT52D MT52D?;
    MT53A MT53A?;
    MT53B MT53B?;
    MT53D MT53D?;
    MT56A MT56A?;
    MT56D MT56D?;
    MT57A MT57A?;
    MT57B MT57B?;
    MT57D MT57D?;
    MT58A MT58A?;
    MT58D MT58D?;
    MT72 MT72?;
    UndrlygCstmrCdtTrf UndrlygCstmrCdtTrf;
|};

public type MT205COVMessage record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT205COVBlock4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};
