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
.package(url: "http://github.com/dduan/Relay", from: "0.1.1")
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

## License

MIT. See `LICENSE.md`
