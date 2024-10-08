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

public type MT204Block4 record {|
    MT19 MT19;
    MT20 MT20;
    MT30 MT30;
    MT57A MT57A?;
    MT57B MT57B?;
    MT57D MT57D?;
    MT58A MT58A?;
    MT58D MT58D?;
    MT72 MT72?;
    MT204Transaction[] Transaction;
|};

public type MT204Transaction record {|
    MT20 MT20;
    MT21 MT21?;
    MT32B MT32B;
    MT53A MT53A?;
    MT53B MT53B?;
    MT53D MT53D?;
    MT72 MT72?;
|};

public type MT204Message record {|
    Block1 block1?;
    Block2 block2;
    Block3 block3?;
    MT204Block4 block4;
    Block5 block5?;
    UnparsedTexts unparsedTexts?;
|};
