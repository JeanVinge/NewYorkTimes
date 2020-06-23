
import UIKit

public struct NewsListViewModel {

    public var header: String

    public let list: [News]

    public init(list: [News],
                header: String) {
        self.list = list
        self.header = header
    }
}

public struct News {
    private let index: Int
    private let section: String
    public let image: URL?
    let title: String
    let subtitle: String
    public let copyright: String?
    public let size: CGSize

    var heading: String { "\(index). \(section)" }

    public init (index: Int,
                 section: String,
                 image: URL?,
                 title: String,
                 subtitle: String,
                 copyright: String?,
                 size: CGSize) {
    self.index = index
    self.section = section
    self.image = image
    self.title = title
    self.subtitle = subtitle
    self.copyright = copyright
    self.size = size
    }
}
