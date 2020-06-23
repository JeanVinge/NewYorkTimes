
import NewsDomainKit
import APICoreKit
import Future

public protocol NewYorkTimesProvider {
    mutating func newsList() -> Future<NewsList>
}

public struct NewYorkTimesFetcher: NewYorkTimesProvider {

    private var manager: RequestManager
    public var type: NewsType

    public init(_ type: NewsType = .emailed) {
        self.manager = APIRequestAdapter()
        self.type = type
    }

    public init(_ manager: RequestManager) {
        self.type = .emailed
        self.manager = manager
    }

    public mutating func newsList() -> Future<NewsList> {
        manager
            .request(NewYorkTimesTargetType.list(type))
            .map(NewsList.self)
    }
}
