import Combine

/// A type-erased Relay.
@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public final class AnyRelay<Output, Failure>: Relay where Failure: Error {
    private let forwardSend: (Output) -> Void
    private let forwardReceive: (AnySubscriber<Output, Failure>) -> Void

    /// Creates a AnyRelay from another relay, whose type is erased.
    ///
    /// - Parameter relay: The relay whose type is to be erased.
    public init<R>(_ relay: R) where Output == R.Output, Failure == R.Failure, R: Relay {
        self.forwardSend = relay.send
        self.forwardReceive = relay.receive
    }

    /// Creates a AnyRelay by specifying how receive and send should work.
    /// - Parameters:
    ///     - subscribe: A closure to be executed as `receive`.
    ///     - receive: A closure to be executed as `send`.
    public init(_ subscribe: @escaping (AnySubscriber<Output, Failure>) -> Void, _ receive: @escaping (Output) -> Void) {
        self.forwardSend = receive
        self.forwardReceive = subscribe
    }

    /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
    ///
    /// - SeeAlso: `subscribe(_:)`
    /// - Parameters:
    ///     - subscriber: The subscriber to attach to this `Publisher`.
    ///                   once attached it can begin to receive values.
    final public func receive<S>(subscriber: S) where Output == S.Input, Failure == S.Failure, S : Subscriber {
        self.forwardReceive(AnySubscriber(subscriber))
    }

    /// Sends a value to the subscriber.
    ///
    /// - Parameter value: The value to send.
    final public func send(_ value: Output) {
        self.forwardSend(value)
    }
}

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension Relay {
    /// Converts to an `AnyRelay`, erasing the specific type of this relay.
    public func eraseToAnyRelay() -> AnyRelay<Self.Output, Self.Failure> {
        AnyRelay(self)
    }
}
