#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public typealias AttrText = NSAttributedString.AttrText

extension NSAttributedString {
    public struct AttrText: Component {
        public let string: String
        public let attributes: Attributes

        public init(_ string: String, attributes: Attributes = [:]) {
            self.string = string
            self.attributes = attributes
        }
    }
}

extension AttrText {
    public static let space = AttrText(" ")
    public static let linebreak = AttrText("\n")
}
