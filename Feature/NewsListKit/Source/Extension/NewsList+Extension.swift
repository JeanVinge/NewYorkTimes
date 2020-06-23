
import NewsDomainKit
import UI
import LocalizationKit

extension NewsDomainKit.NewsList {
    var toNewsList: [UI.News] { results.enumerated().map { $1.toNews(at: $0 + 1) } }
    var toViewModel: UI.NewsListViewModel { .init(list: toNewsList, header: Localization.News.navigation.text()) }
}
