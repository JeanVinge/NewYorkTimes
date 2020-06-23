
public struct Metadata: Codable {

    public enum FormatType: String, Codable {
        case standard = "Standard Thumbnail"
        case mediumThreeByTwo210
        case mediumThreeByTwo440
    }

    public let url: URL
    public var format: FormatType
    public let height: Double
    public let width: Double
}
