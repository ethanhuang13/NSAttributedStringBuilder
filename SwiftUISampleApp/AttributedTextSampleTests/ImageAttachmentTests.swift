@testable import NSAttributedStringBuilder
import XCTest

final class ImageAttachmentTests: XCTestCase {
    func testSetImage_getAttachmentAttribute() {
        let testBundle = Bundle(for: ImageAttachmentTests.self)
        let testImage = UIImage(contentsOfFile: testBundle.path(forResource: "Swift_logo_color_rgb", ofType: "jpg")!)!

        let sut = NSAttributedString {
            ImageAttachment(testImage, size: CGSize(width: 40, height: 40))
            AttrText.linebreak
        }

        XCTAssertNotNil(sut.attributes(at: 0, effectiveRange: nil)[.attachment])
        // TODO: Better test
    }
}
