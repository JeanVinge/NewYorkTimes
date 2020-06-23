
import UIKit
import NewsDomainKit
import NewsAPIKit
import Future
import UI

public protocol NewsListViewModelProtocol {
    var type: NewsType { get }
    var provider: NewYorkTimesProvider { get }
    var list: NewsList? { get set }
    var route: NewsListViewControllerRoute? { get set }
    
    mutating func requestList() -> Future<UI.NewsListViewModel>
    mutating func pullToRefresh() -> Future<UI.NewsListViewModel>
    
    func didSelect(at index: Int, in viewController: UIViewController)
}


public class NewsListViewModel: NewsListViewModelProtocol {
    
    // MARK: Var
    
    public var provider: NewYorkTimesProvider
    public var route: NewsListViewControllerRoute?
    public var list: NewsList?
    public var type: NewsType = .emailed
    
    // MARK: Init

    public init(type: NewsType,
                route: NewsListViewControllerRoute) {
        self.type = type
        self.provider = NewYorkTimesFetcher(type)
        self.route = route
    }
    
    public init(provider: NewYorkTimesProvider = NewYorkTimesFetcher(),
                route: NewsListViewControllerRoute? = nil) {
        self.provider = provider
        self.route = route
    }
    
    public func pullToRefresh() -> Future<UI.NewsListViewModel> {
        request()
    }
    
    public func requestList() -> Future<UI.NewsListViewModel> {
        request()
    }
    
    private func request() -> Future<UI.NewsListViewModel> {
        self.provider.newsList().transformed { list in
            self.list = list
            return list.toViewModel
        }
    }
    
    public func didSelect(at index: Int, in viewController: UIViewController) {
        guard let list = list, list.results.indices.contains(index) else { return }
        route?.didSelect(in: viewController, with: list.results[index])
    }
    
}
