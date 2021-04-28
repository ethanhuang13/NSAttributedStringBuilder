import Foundation

public typealias Empty = NSAttributedString.Empty
public typealias Space = NSAttributedString.Space
public typealias LineBreak = NSAttributedString.LineBreak

public extension NSAttributedString {
    struct Empty: Component {
        // MARK: Lifecycle

        public init() {}

        // MARK: Public

        public let string: String = ""
        public let attributes: Attributes = [:]
    }

    struct Space: Component {
        // MARK: Lifecycle

        public init() {}

        // MARK: Public

        public let string: String = " "
        public let attributes: Attributes = [:]
    }

    struct LineBreak: Component {
        // MARK: Lifecycle

        public init() {}

        // MARK: Public

        public let string: String = "\n"
        public let attributes: Attributes = [:]
    }
}
