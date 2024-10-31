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

import financial.swift.mt.com.prowidesoftware.swift.model as comprowidesoftwareswiftmodel;
import financial.swift.mt.java.lang as javalang;

import ballerina/jballerina.java;

# Ballerina class mapping for the Java `com.prowidesoftware.swift.io.ConversionService` class.
@java:Binding {'class: "com.prowidesoftware.swift.io.ConversionService"}
public distinct class ConversionService {

    *java:JObject;
    *javalang:Object;

    # The `handle` field that stores the reference to the `com.prowidesoftware.swift.io.ConversionService` object.
    public handle jObj;

    # The init function of the Ballerina class mapping the `com.prowidesoftware.swift.io.ConversionService` Java class.
    #
    # + obj - The `handle` value containing the Java reference of the object.
    public isolated function init(handle obj) {
        self.jObj = obj;
    }

    # The function to retrieve the string representation of the Ballerina class mapping the `com.prowidesoftware.swift.io.ConversionService` Java class.
    #
    # + return - The `string` form of the Java object instance.
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }

    # The function that maps to the `equals` method of `com.prowidesoftware.swift.io.ConversionService`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function 'equals(javalang:Object arg0) returns boolean {
        return com_prowidesoftware_swift_io_ConversionService_equals(self.jObj, arg0.jObj);
    }

    # The function that maps to the `getClass` method of `com.prowidesoftware.swift.io.ConversionService`.
    #
    # + return - The `javalang:Class` value returning from the Java mapping.
    public function getClass() returns javalang:Class {
        handle externalObj = com_prowidesoftware_swift_io_ConversionService_getClass(self.jObj);
        javalang:Class newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getFIN` method of `com.prowidesoftware.swift.io.ConversionService`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `string` value returning from the Java mapping.
    public function getFIN(string arg0) returns string {
        return java:toString(com_prowidesoftware_swift_io_ConversionService_getFIN(self.jObj, java:fromString(arg0))) ?: "";
    }

    # The function that maps to the `getFIN` method of `com.prowidesoftware.swift.io.ConversionService`.
    #
    # + arg0 - The `comprowidesoftwareswiftmodel:SwiftMessage` value required to map with the Java method parameter.
    # + return - The `string` value returning from the Java mapping.
    public function getFIN2(comprowidesoftwareswiftmodel:SwiftMessage arg0) returns string {
        return java:toString(com_prowidesoftware_swift_io_ConversionService_getFIN2(self.jObj, arg0.jObj)) ?: "";
    }

    # The function that maps to the `getMessageFromFIN` method of `com.prowidesoftware.swift.io.ConversionService`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `comprowidesoftwareswiftmodel:SwiftMessage` value returning from the Java mapping.
    public function getMessageFromFIN(string arg0) returns comprowidesoftwareswiftmodel:SwiftMessage {
        handle externalObj = com_prowidesoftware_swift_io_ConversionService_getMessageFromFIN(self.jObj, java:fromString(arg0));
        comprowidesoftwareswiftmodel:SwiftMessage newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getMessageFromXML` method of `com.prowidesoftware.swift.io.ConversionService`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `comprowidesoftwareswiftmodel:SwiftMessage` value returning from the Java mapping.
    public function getMessageFromXML(string arg0) returns comprowidesoftwareswiftmodel:SwiftMessage {
        handle externalObj = com_prowidesoftware_swift_io_ConversionService_getMessageFromXML(self.jObj, java:fromString(arg0));
        comprowidesoftwareswiftmodel:SwiftMessage newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getXml` method of `com.prowidesoftware.swift.io.ConversionService`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `string` value returning from the Java mapping.
    public function getXml(string arg0) returns string {
        return java:toString(com_prowidesoftware_swift_io_ConversionService_getXml(self.jObj, java:fromString(arg0))) ?: "";
    }

    # The function that maps to the `getXml` method of `com.prowidesoftware.swift.io.ConversionService`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `boolean` value required to map with the Java method parameter.
    # + return - The `string` value returning from the Java mapping.
    public isolated function getXml2(string arg0, boolean arg1) returns string {
        return java:toString(com_prowidesoftware_swift_io_ConversionService_getXml2(self.jObj, java:fromString(arg0), arg1)) ?: "";
    }

    # The function that maps to the `getXml` method of `com.prowidesoftware.swift.io.ConversionService`.
    #
    # + arg0 - The `comprowidesoftwareswiftmodel:SwiftMessage` value required to map with the Java method parameter.
    # + return - The `string` value returning from the Java mapping.
    public function getXml3(comprowidesoftwareswiftmodel:SwiftMessage arg0) returns string {
        return java:toString(com_prowidesoftware_swift_io_ConversionService_getXml3(self.jObj, arg0.jObj)) ?: "";
    }

    # The function that maps to the `getXml` method of `com.prowidesoftware.swift.io.ConversionService`.
    #
    # + arg0 - The `comprowidesoftwareswiftmodel:SwiftMessage` value required to map with the Java method parameter.
    # + arg1 - The `boolean` value required to map with the Java method parameter.
    # + return - The `string` value returning from the Java mapping.
    public function getXml4(comprowidesoftwareswiftmodel:SwiftMessage arg0, boolean arg1) returns string {
        return java:toString(com_prowidesoftware_swift_io_ConversionService_getXml4(self.jObj, arg0.jObj, arg1)) ?: "";
    }

    # The function that maps to the `hashCode` method of `com.prowidesoftware.swift.io.ConversionService`.
    #
    # + return - The `int` value returning from the Java mapping.
    public function hashCode() returns int {
        return com_prowidesoftware_swift_io_ConversionService_hashCode(self.jObj);
    }

    # The function that maps to the `notify` method of `com.prowidesoftware.swift.io.ConversionService`.
    public function notify() {
        com_prowidesoftware_swift_io_ConversionService_notify(self.jObj);
    }

    # The function that maps to the `notifyAll` method of `com.prowidesoftware.swift.io.ConversionService`.
    public function notifyAll() {
        com_prowidesoftware_swift_io_ConversionService_notifyAll(self.jObj);
    }

    # The function that maps to the `wait` method of `com.prowidesoftware.swift.io.ConversionService`.
    #
    # + return - The `javalang:InterruptedException` value returning from the Java mapping.
    public function 'wait() returns javalang:InterruptedException? {
        error|() externalObj = com_prowidesoftware_swift_io_ConversionService_wait(self.jObj);
        if (externalObj is error) {
            javalang:InterruptedException e = error javalang:InterruptedException(javalang:INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `wait` method of `com.prowidesoftware.swift.io.ConversionService`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `javalang:InterruptedException` value returning from the Java mapping.
    public function wait2(int arg0) returns javalang:InterruptedException? {
        error|() externalObj = com_prowidesoftware_swift_io_ConversionService_wait2(self.jObj, arg0);
        if (externalObj is error) {
            javalang:InterruptedException e = error javalang:InterruptedException(javalang:INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `wait` method of `com.prowidesoftware.swift.io.ConversionService`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + return - The `javalang:InterruptedException` value returning from the Java mapping.
    public function wait3(int arg0, int arg1) returns javalang:InterruptedException? {
        error|() externalObj = com_prowidesoftware_swift_io_ConversionService_wait3(self.jObj, arg0, arg1);
        if (externalObj is error) {
            javalang:InterruptedException e = error javalang:InterruptedException(javalang:INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

}

# The constructor function to generate an object of `com.prowidesoftware.swift.io.ConversionService`.
#
# + return - The new `ConversionService` class generated.
public isolated function newConversionService1() returns ConversionService {
    handle externalObj = com_prowidesoftware_swift_io_ConversionService_newConversionService1();
    ConversionService newObj = new (externalObj);
    return newObj;
}

function com_prowidesoftware_swift_io_ConversionService_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "com.prowidesoftware.swift.io.ConversionService",
    paramTypes: ["java.lang.Object"]
} external;

function com_prowidesoftware_swift_io_ConversionService_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "com.prowidesoftware.swift.io.ConversionService",
    paramTypes: []
} external;

function com_prowidesoftware_swift_io_ConversionService_getFIN(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getFIN",
    'class: "com.prowidesoftware.swift.io.ConversionService",
    paramTypes: ["java.lang.String"]
} external;

function com_prowidesoftware_swift_io_ConversionService_getFIN2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getFIN",
    'class: "com.prowidesoftware.swift.io.ConversionService",
    paramTypes: ["com.prowidesoftware.swift.model.SwiftMessage"]
} external;

function com_prowidesoftware_swift_io_ConversionService_getMessageFromFIN(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getMessageFromFIN",
    'class: "com.prowidesoftware.swift.io.ConversionService",
    paramTypes: ["java.lang.String"]
} external;

function com_prowidesoftware_swift_io_ConversionService_getMessageFromXML(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getMessageFromXML",
    'class: "com.prowidesoftware.swift.io.ConversionService",
    paramTypes: ["java.lang.String"]
} external;

function com_prowidesoftware_swift_io_ConversionService_getXml(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getXml",
    'class: "com.prowidesoftware.swift.io.ConversionService",
    paramTypes: ["java.lang.String"]
} external;

isolated function com_prowidesoftware_swift_io_ConversionService_getXml2(handle receiver, handle arg0, boolean arg1) returns handle = @java:Method {
    name: "getXml",
    'class: "com.prowidesoftware.swift.io.ConversionService",
    paramTypes: ["java.lang.String", "boolean"]
} external;

function com_prowidesoftware_swift_io_ConversionService_getXml3(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getXml",
    'class: "com.prowidesoftware.swift.io.ConversionService",
    paramTypes: ["com.prowidesoftware.swift.model.SwiftMessage"]
} external;

function com_prowidesoftware_swift_io_ConversionService_getXml4(handle receiver, handle arg0, boolean arg1) returns handle = @java:Method {
    name: "getXml",
    'class: "com.prowidesoftware.swift.io.ConversionService",
    paramTypes: ["com.prowidesoftware.swift.model.SwiftMessage", "boolean"]
} external;

function com_prowidesoftware_swift_io_ConversionService_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "com.prowidesoftware.swift.io.ConversionService",
    paramTypes: []
} external;

function com_prowidesoftware_swift_io_ConversionService_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "com.prowidesoftware.swift.io.ConversionService",
    paramTypes: []
} external;

function com_prowidesoftware_swift_io_ConversionService_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "com.prowidesoftware.swift.io.ConversionService",
    paramTypes: []
} external;

function com_prowidesoftware_swift_io_ConversionService_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "com.prowidesoftware.swift.io.ConversionService",
    paramTypes: []
} external;

function com_prowidesoftware_swift_io_ConversionService_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "com.prowidesoftware.swift.io.ConversionService",
    paramTypes: ["long"]
} external;

function com_prowidesoftware_swift_io_ConversionService_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "com.prowidesoftware.swift.io.ConversionService",
    paramTypes: ["long", "int"]
} external;

isolated function com_prowidesoftware_swift_io_ConversionService_newConversionService1() returns handle = @java:Constructor {
    'class: "com.prowidesoftware.swift.io.ConversionService",
    paramTypes: []
} external;
