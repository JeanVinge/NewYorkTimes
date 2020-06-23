
public typealias NewsList = APIResults<News>

public struct News: Codable {
    public let section: String
    public let title: String
    public let abstract: String
    public let url: URL
    public let media: [Media]
    public var copyright: String? { media.first?.copyright }
    public var metadata: Metadata? { media.first?.metadata.filter { $0.format == .mediumThreeByTwo440 }.first }
    public var image: URL? { metadata?.url }
}
