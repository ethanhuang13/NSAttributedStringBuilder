#if canImport(UIKit)
import UIKit

#if !os(watchOS)
public typealias ImageAttachment = NSAttributedString.ImageAttachment

extension NSAttributedString {
    public struct ImageAttachment: Component {
        public let string: String = ""
        public let attributes: Attributes = [:]
        private let attachment: NSTextAttachment

        public init(_ image: UIImage, size: Size? = nil) {
            let attachment = NSTextAttachment()
            attachment.image = image

            if let size = size {
                attachment.bounds.size = size
            }

            self.attachment = attachment
        }

        public var attributedString: NSAttributedString {
            return NSAttributedString(attachment: attachment)
        }
    }
}
#endif

#endif
