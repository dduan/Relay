import Combine

/// A relay that passes along values and completion.
///
/// Use a `PassthroughRelay` in unit tests when you want a publisher than can publish specific values on-demand during tests.
@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public final class PassthroughRelay<Output, Failure>: Relay where Failure : Error {
    private let subject = PassthroughSubject<Output, Failure>()

    /// Creates a passthrough relay.
    public init() {}

    /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
    ///
    /// - SeeAlso: `subscribe(_:)`
    /// - Parameters:
    ///     - subscriber: The subscriber to attach to this `Publisher`.
    ///                   once attached it can begin to receive values.
    public func receive<S>(subscriber: S) where Output == S.Input, Failure == S.Failure, S : Subscriber {
        self.subject.receive(subscriber: subscriber)
    }

    /// Sends a value to the subscriber.
    ///
    /// - Parameter value: The value to send.
    public func send(_ input: Output) {
        self.subject.send(input)
    }
}
