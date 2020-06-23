/**
 *  Swift by Sundell sample code
 *  Copyright (c) John Sundell 2017
 *  See LICENSE file for license
 *
 *  Read the blog post at https://swiftbysundell.com/posts/under-the-hood-of-futures-and-promises-in-swift
 */

public typealias FutureResult<Value> = Result<Value, Error>
public typealias FutureErrorCompletion = (Error) -> Void

public class Future<Value> {

    // MARK: Var

    public typealias FutureResponse = (FutureResult<Value>) -> Void

    fileprivate var result: FutureResult<Value>? {
        didSet { result.map(report) }
    }
    private lazy var callbacks = [FutureResponse]()
    private lazy var callbackErrors = [FutureErrorCompletion]()

    // MARK: Init

    public func observe(with callback: @escaping FutureResponse) {
        callbacks.append(callback)
        result.map(callback)
    }

    private func report(result: FutureResult<Value>) {
        for callback in callbacks {
            callback(result)
        }
    }
}

public extension Future {
    func chained<NextValue>(with closure: @escaping (Value) throws -> Future<NextValue>) -> Future<NextValue> {
        let promise = Promise<NextValue>()

        observe { result in
            switch result {
            case .success(let value):
                do {
                    let future = try closure(value)

                    future.observe { result in
                        switch result {
                        case .success(let value):
                            promise.resolve(with: value)
                        case .failure(let error):
                            promise.reject(with: error)
                        }
                    }
                } catch {
                    promise.reject(with: error)
                }
            case .failure(let error):
                promise.reject(with: error)
            }
        }

        return promise
    }

    func transformed<NextValue>(with closure: @escaping (Value) throws -> NextValue) -> Future<NextValue> {
        return chained { value in
            return try Promise(value: closure(value))
        }
    }
}

public class Promise<Value>: Future<Value> {
    public init(value: Value? = nil) {
        super.init()
        result = value.map(Result.success)
    }

    public func resolve(with value: Value) {
        result = .success(value)
    }

    public func reject(with error: Error) {
        result = .failure(error)
    }
}
