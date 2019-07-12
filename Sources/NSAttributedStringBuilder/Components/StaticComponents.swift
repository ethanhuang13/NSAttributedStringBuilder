import Foundation

public typealias Empty = NSAttributedString.Empty
public typealias Space = NSAttributedString.Space
public typealias LineBreak = NSAttributedString.LineBreak

extension NSAttributedString {
    public struct Empty: Component {
        public let string: String = ""
        public let attributes: Attributes = [:]
        public init() { }
    }

    public struct Space: Component {
        public let string: String = " "
        public let attributes: Attributes = [:]
        public init() { }
    }

    public struct LineBreak: Component {
        public let string: String = "\n"
        public let attributes: Attributes = [:]
        public init() { }
    }
}
