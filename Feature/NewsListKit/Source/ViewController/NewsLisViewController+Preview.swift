
#if DEBUG

import PreviewScreenKit
import NewsAPIKit
import SwiftUI
import MockKit
import Future
import NewsDomainKit
import UI

struct MockNewYorkTimesProvider: NewYorkTimesProvider {

    let type: NewsType
    private var mock: MockFile {
        switch type {
        case .emailed: return .emailed
        case .shared: return .shared
        case .viewed: return .viewed
        }
    }

    mutating func newsList() -> Future<NewsList> {
        let promise = Promise<NewsList>()
        do {
            promise.resolve(with: try Mock<NewsList>.from(enum: mock).content())
        } catch let error {
            promise.reject(with: error)
        }
        return promise
    }
}

struct MockNewListViewModel: NewsListViewModelProtocol {

    var type: NewsType
    var provider: NewYorkTimesProvider
    var list: NewsList? = nil
    var route: NewsListViewControllerRoute? = nil

    init(type: NewsType) {
        self.type = type
        self.provider = MockNewYorkTimesProvider(type: type)
    }

    mutating func requestList() -> Future<UI.NewsListViewModel> {
        provider.newsList().transformed { $0.toViewModel }
    }

    mutating func pullToRefresh() -> Future<UI.NewsListViewModel> {
        provider.newsList().transformed { $0.toViewModel }
    }

    func didSelect(at index: Int,
                   in viewController: UIViewController) {}
}

@available(iOS 13.0, *)
struct NewsListViewControllerWithImagePreview: PreviewProvider {
    static var previews: some View {
        return ViewControllerRepresentable(
            viewController: NewsListViewController(MockNewListViewModel(type: .emailed))
        )
    }
}
#endif

