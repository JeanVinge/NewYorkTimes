
public protocol LocalizationProtocol {
    func text() -> String
}

fileprivate class BundleHack: NSObject {}
fileprivate let currentBundle = Bundle(for: type(of: BundleHack()))

fileprivate func localize(_ text: String) -> String {
    NSLocalizedString(text,
                      tableName: "localizable",
                      bundle: currentBundle,
                      comment: "")
}

public enum Localization {
    public enum News: String, LocalizationProtocol {
        case navigation = "news.navigation"

        public func text() -> String {
            localize(rawValue)
        }
    }

    public enum EmptyState: String, LocalizationProtocol {
        case title = "empty.state.title"
        case button = "empty.state.button"

        public func text() -> String {
            localize(rawValue)
        }
    }

    public enum TabBar: String, LocalizationProtocol {
        case emailed = "tabbar.emailed"
        case shared = "tabbar.shared"
        case viewed = "tabbar.viewed"

        public func text() -> String {
            localize(rawValue)
        }
    }
}

