#if canImport(UIKit)
    import UIKit

    #if !os(watchOS)
        public typealias ImageAttachment = NSAttributedString.ImageAttachment

        public extension NSAttributedString {
            struct ImageAttachment: Component {
                // MARK: Lifecycle

                public init(_ image: UIImage, size: Size? = nil) {
                    let attachment = NSTextAttachment()
                    attachment.image = image

                    if let size = size {
                        attachment.bounds.size = size
                    }

                    self.attachment = attachment
                }

                // MARK: Public

                public let string: String = ""
                public let attributes: Attributes = [:]

                public var attributedString: NSAttributedString {
                    NSAttributedString(attachment: attachment)
                }

                // MARK: Private

                private let attachment: NSTextAttachment
            }
        }
    #endif

#endif
