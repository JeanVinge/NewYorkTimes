
public protocol ConfigurableView {
    func initLayout()
    func initSubviews()
    func initConstraints()
}

public extension ConfigurableView where Self: NSObject {
    func initLayout() {
        initSubviews()
        initConstraints()
    }

    func initSubviews() {}
    func initConstraints() {}
}
