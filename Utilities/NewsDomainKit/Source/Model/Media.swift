
public struct Media: Codable {

    enum CodingKeys: String, CodingKey {
        case metadata = "media-metadata"
        case copyright
    }

    public let copyright: String
    public let metadata: [Metadata]
}
