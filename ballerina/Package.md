# Ballerina SWIFT MT Library

## Overview

SWIFT MT (Message Type) messages are a set of standardized financial messages used globally in interbank communication, allowing secure and efficient cross-border transactions. These messages follow a specific structure to ensure consistency in financial data exchange, supporting various operations such as payments, securities trading, and treasury transactions.

The `ballerinax/swiftmt` library provides support for creating, parsing, and manipulating SWIFT MT messages in Ballerina. It facilitates the handling of commonly used MT message types, enabling developers to work with structured financial data in a flexible and programmatic manner. This library is particularly useful for building financial messaging systems that integrate SWIFT MT standards. 

## Supported Message Types

- SWIFT MT 1XX Category
- SWIFT MT 2XX Category
- SWIFT MT 9XX Category
- SWIFT MT nXX Category

## Usage

### Converting SWIFT fin message to Record value

```ballerina
import ballerina/io;
import ajai21/swiftmt;

public function main() returns error? {
    string finMessage = "{1:F01CHASUS33AXXX0000000000}{2:I900CRESCHZZXXXXN}{4:\n" +
                ":20:C11126A1378\n" +
                ":21:5482ABC\n" +
                ":25:9-9876543\n" +
                ":32A:090123USD233530,\n" +
                "-}"; 
    record {|anydata...;|} customizedMessage = check swiftmt:swiftMtParser(finMessage);
    if customizedMessage is swiftmt:MT900Message {
        io:println(customizedMessage);
    }
}
```

### Creating new SWIFT MT documents based on requirement

```ballerina
import ballerina/io;
import ajai21/swiftmt;

public function main() returns error? {
    swiftmt:MT900Message swiftMessage = { 
        block2: {
            messageType: "900"
        }, 
        block4: {
            MT20: {
                name: "20", 
                msgId: {
                    \#content: "C11126A1378", 
                    number: "1"}}, 
            MT21: {
                Ref: {
                    \#content: "5482ABC", 
                    number: "1"}, 
                name: "21"}, 
            MT32A: {
                Dt: {
                    \#content: "090123", 
                    number: "1"}, 
                name: "", 
                Ccy: {
                    \#content: "USD", 
                    number: "2"}, 
                Amnt: {
                    \#content: "33550,", 
                    number: "3"}}}};
    io:println(swiftMessage);
}
```
