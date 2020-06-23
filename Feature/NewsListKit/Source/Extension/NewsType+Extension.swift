
import LocalizationKit
import NewsDomainKit

public extension NewsType {
    func text() -> String {
        switch self {
        case .emailed: return Localization.TabBar.emailed.text()
        case .shared: return Localization.TabBar.shared.text()
        case .viewed: return Localization.TabBar.viewed.text()
        }
    }
}
