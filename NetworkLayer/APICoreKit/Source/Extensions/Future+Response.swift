
import Future

public extension Future where Value == Response {
    func JSON(_ options: JSONSerialization.ReadingOptions = .allowFragments) -> Future<Any> {
        chained { response -> Future<Any> in
            let promise = Promise<Any>()
            do {
                promise.resolve(with: try response.JSON(options))
            } catch let error {
                promise.reject(with: error)
            }
            return promise
        }
    }

    func map<T: Codable>(_ type: T.Type) -> Future<T> {
        chained { response in
            let promise = Promise<T>()
            do {
                promise.resolve(with: try response.map(type))
            } catch let error {
                promise.reject(with: error)
            }
            return promise
        }
    }
}
