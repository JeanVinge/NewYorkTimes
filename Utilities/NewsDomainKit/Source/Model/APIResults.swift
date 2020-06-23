
public struct APIResults<T: Codable>: Codable {

    enum CodingKeys: String, CodingKey {
        case count = "num_results"
        case results
    }

    public let count: Int
    public let results: [T]
}
