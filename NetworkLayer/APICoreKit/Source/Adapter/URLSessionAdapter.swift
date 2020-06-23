
public struct URLSessionAdapter {

    // MARK: Var

    public static var `default`: URLSession {
        URLSession(configuration: .defaultCoreAPI)
    }
}
