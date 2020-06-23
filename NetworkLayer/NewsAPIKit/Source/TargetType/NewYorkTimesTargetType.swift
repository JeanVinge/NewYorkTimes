
import APICoreKit
import NewsDomainKit

enum NewYorkTimesTargetType {
    case list(NewsType)
}

extension NewYorkTimesTargetType: TargetType {
    var baseURL: URL { URL(string: "https://api.nytimes.com/")! }

    var path: String {
        switch self {
        case let .list(type):
            return "svc/mostpopular/v2/\(type)/7.json"
        }
    }
    var method: APICoreKit.Method { .get }
    var task: Task { .query(parameters: ["api-key" : "dylOnQnYUzEF1B9MTYYHM0MyffMPBZRi"]) }
}
