# Ballerina SWIFT MT Library

## Overview

SWIFT MT (Message Type) messages are a set of standardized financial messages used globally in interbank communication, allowing secure and efficient cross-border transactions. These messages follow a specific structure to ensure consistency in financial data exchange, supporting various operations such as payments, securities trading, and treasury transactions.

The `ballerinax/financial.swift.mt` library provides support for creating, parsing, and manipulating SWIFT MT messages in Ballerina. It facilitates the handling of commonly used MT message types, enabling developers to work with structured financial data in a flexible and programmatic manner. This library is particularly useful for building financial messaging systems that integrate SWIFT MT standards. 

## Supported Message Types

- SWIFT MT 1XX Category
- SWIFT MT 2XX Category
- SWIFT MT 3XX Category Volume 1 (MT300 - MT341)
- SWIFT MT 9XX Category
- SWIFT MT nXX Category 

## Usage

### Parsing a SWIFT fin message as a record

```ballerina
import ballerina/io;
import ballerinax/financial.swift.mt as swiftmt;

public function main() returns error? {
    string finMessage = string `{1:F01CHASUS33AXXX0000000000}
{2:I900CRESCHZZXXXXN}
{4:
:20:C11126A1378
:21:5482ABC
:25:9-9876543
:32A:090123USD233530,
-}`;  
    record {} customizedMessage = check swiftmt:parseSwiftMt(finMessage);
    if customizedMessage is swiftmt:MT900Message {
        io:println(customizedMessage);
    }
}
```

### Creating SWIFT MT documents based on the requirement

```ballerina
import ballerina/io;
import ballerinax/fiancial.swift.mt as swiftmt;

public function main() returns error? {
    swiftmt:MT900Message swiftMessage = { 
        block2: {
            messageType: "900"
        }, 
        block4: {
            MT20: { 
                msgId: {
                    content: "C11126A1378"}}, 
            MT21: {
                Ref: {
                    content: "5482ABC"}}, 
            MT32A: {
                Dt: {
                    content: "090123"},  
                Ccy: {
                    content: "USD"}, 
                Amnt: {
                    content: "33550,"}}}};
    io:println(swiftMessage);
}
```

### Generating SWIFT MT Fin Message using SWIFT MT Record Values

```ballerina
import ballerina/io;
import ballerinax/fiancial.swift.mt as swiftmt;

public function main() returns error? {
    //name and number of each field have to be defined in order to generate the fin message.
    swiftmt:MT900Message message = {
        block1: {logicalTerminal: "FTRVVY5R"},
        block2: {'type: "input", messageType: "900", receiverAddress: "ADRFTY2CXXX"}, 
        block4: {
            MT20: {name: "20", msgId: {content: "245465498", number: "1"}}, 
            MT21: {name:"21", Ref: {content: "5463557676", number: "1"}}, 
            MT32A: {name: "32A", Dt: {content: "270125", number: "1"}, 
            Ccy: {content: "USD", number: "2"}, Amnt: {content: "6897,", number: "3"}}}};
    io:println(swiftmt:getFinMessage(message)); 
}
```

## Report issues

To report bugs, request new features, start new discussions, view project boards, etc., go to the [Ballerina library parent repository](https://github.com/ballerina-platform/ballerina-library).

## Useful Links

- Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
- Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
