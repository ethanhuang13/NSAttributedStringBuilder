#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public typealias Link = NSAttributedString.Link

extension NSAttributedString {
    public struct Link: Component {
        public let string: String
        public let url: URL
        public let attributes: Attributes

        public init(_ string: String, url: URL, attributes: Attributes = [:]) {
            self.string = string
            self.url = url

            var attributes = attributes
            attributes[.link] = url
            self.attributes = attributes
        }

        public var attributedString: NSAttributedString {
            NSAttributedString(string: string, attributes: attributes)
        }
    }
}
