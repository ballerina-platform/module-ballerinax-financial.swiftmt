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

public type MT103Block4 record {|
    MT20 MT20;
    MT13C MT13C?;
    MT23B MT23B;
    MT23E[] MT23E?;
    MT26T MT26T?;
    MT32A MT32A;
    MT33B MT33B?;
    MT36 MT36?;
    MT50A MT50A?;
    MT50F MT50F?;
    MT50K MT50K?;
    MT51A MT51A?;
    MT52A MT52A?;
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
    MT59 MT59?;
    MT59A MT59A?;
    MT59F MT59F?;
    MT70 MT70?;
    MT71A MT71A;
    MT71F MT71F?;
    MT71G MT71G?;
    MT72 MT72?;
    MT77B MT77B?;
|};

public type MT103Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT103Block4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};
