#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit
#endif

public typealias AText = NSAttributedString.AttrText

public extension NSAttributedString {
    struct AttrText: Component {
        // MARK: Lifecycle

        public init(_ string: String, attributes: Attributes = [:]) {
            self.string = string
            self.attributes = attributes
        }

        // MARK: Public

        public let string: String
        public let attributes: Attributes
    }
}
