
import MockKit
import NewsDomainKit
import NewsAPIKit
import Future

struct MockNewYorkTimesProvider: NewYorkTimesProvider {

    let type: MockFile

    mutating func newsList() -> Future<NewsList> {
        let promise = Promise<NewsList>()
        do {
            let result = try Mock<NewsList>.from(enum: type).content()
            promise.resolve(with: result)
        } catch let error {
            promise.reject(with: error)
        }
        return promise
    }
}
