
public extension Encodable {
    var toData: Data {
        let data = try? JSONEncoder().encode(self)
        return data ?? Data()
    }

    var toJSON: Any? {
        try? JSONSerialization.jsonObject(with: toData,
                                          options: .fragmentsAllowed)
    }
}
