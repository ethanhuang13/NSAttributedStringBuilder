@testable import NSAttributedStringBuilder
import XCTest

final class ImageAttachmentTests: XCTestCase {
    func testSetImage() {
        let testBundle = Bundle(for: ImageAttachmentTests.self)
        let testImage = UIImage(contentsOfFile: testBundle.path(forResource: "Swift_logo_color_rgb", ofType: "jpg")!)!

        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world")
            let attachment = NSTextAttachment()
            attachment.image = testImage
            attachment.bounds = CGRect(x: 0, y: 0, width: 40, height: 40)
            mas.append(NSAttributedString(attachment: attachment))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
            ImageAttachment(testImage, size: CGSize(width: 40, height: 40))
        }

        XCTAssertTrue(sut.isEqual(testData))
    }
}
