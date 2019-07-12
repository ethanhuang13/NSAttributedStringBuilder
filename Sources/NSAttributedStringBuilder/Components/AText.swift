#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public typealias AText = NSAttributedString.AttrText

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

extension AText {
    public static let space = AText(" ")
    public static let linebreak = AText("\n")
}
