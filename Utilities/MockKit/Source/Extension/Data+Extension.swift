
public extension Data {

    init(from json: String,
         in bundle: Bundle) {
        self.init(from: json,
                  ext: "json",
                  bundle: bundle)
    }

    init(from resource: String,
         ext: String,
         bundle: Bundle,
         options: NSData.ReadingOptions = .mappedIfSafe) {
        guard let path = bundle.path(forResource: resource,
                                     ofType: ext) else {
                                        fatalError("resource \(resource) can't be nil")
        }
        do {
            try self.init(contentsOf: URL(fileURLWithPath: path),
                          options: options)
        } catch let error {
            fatalError("error while making data: \(error.localizedDescription)")
        }
    }
}
