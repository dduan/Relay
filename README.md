# Relay

A `Relay` is a `Combine.Subject` without the interface for sending completion
signal.

## Why

A `Subject`, like a `Publisher`, is stateful. Once the complete signal is sent,
subscriber will stop receiving values. In practice, this is rarely desired.
Anyone with a reference to a subject can terminate the data stream for all
subscribers. In large projects this is a source of bugs.

`Relay`s take away the mutability of the "completion" state, making it safer to
share.

## Install

### Xcode:

Add package `https://github.com/dduan/Relay.git`.

### [Swift Package Manager](https://swift.org/package-manager)

```swift
.package(url: "http://github.com/dduan/Relay", from: "0.1.2")
```

### [CocoaPods](http://cocoapods.org/):

```ruby
use_frameworks!

pod "CombineRelay"
```

### [Carthage](https://github.com/Carthage/Carthage)

```
github "dduan/Relay"
```

## Usage

Relay provides some types that each corresponds to a type in Combine:

| Relay             | Combine                 |
|-                  |-                        |
| Relay             | [Subject][]             |
| PassthroughRelay  | [PassthroughSubject][]  |
| CurrentValueRelay | [CurrentValueSubject][] |
| AnyRelay          | [AnySubject][]          |

Each type has identical interface and behavior to its Combine counterpart. Except it's impossible to send a
complete signal.

[Subject]: https://developer.apple.com/documentation/combine/subject
[PassthroughSubject]: https://developer.apple.com/documentation/combine/passthroughsubject
[CurrentValueSubject]: https://developer.apple.com/documentation/combine/currentvaluesubject
[AnySubject]: https://developer.apple.com/documentation/combine/anysubject

## License

MIT. See `LICENSE.md`
