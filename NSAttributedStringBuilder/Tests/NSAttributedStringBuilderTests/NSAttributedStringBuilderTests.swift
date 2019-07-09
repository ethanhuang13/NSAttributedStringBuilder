import XCTest
@testable import NSAttributedStringBuilder

final class NSAttributedStringBuilderTests: XCTestCase {
    func testInitWithStringsAndAttributes() {
        let sut = NSAttributedString {
            AttrText("Hello world")
                .font(.systemFont(ofSize: 20))
                .color(.red)
            AttrText.linebreak
            AttrText("Second line")
                .font(.systemFont(ofSize: 24))
        }

        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.string, "Hello world\nSecond line")
        XCTAssertEqual(sut.attributes(at: 0, effectiveRange: nil)[.font] as? Font, Font.systemFont(ofSize: 20))
        XCTAssertEqual(sut.attributes(at: 0, effectiveRange: nil)[.foregroundColor] as? Color, Color.red)
        XCTAssertNotEqual(sut.attributes(at: 13, effectiveRange: nil)[.font] as? Font, Font.systemFont(ofSize: 20))
    }

    func testInitWithTextAndLink() {
        let sut = NSAttributedString {
            AttrText("Here is a link to ")
                .color(.brown)
            Link("Apple", url: URL(string: "https://www.apple.com")!)
                .color(.red) // This won't work for NSAttributedString
        }

        XCTAssertNotNil(sut)
        XCTAssertTrue(sut.string.hasPrefix("Here is a link"))
        XCTAssertEqual(sut.attributes(at: 19, effectiveRange: nil)[.link] as? URL, URL(string: "https://www.apple.com"))
    }

    static var allTests = [
        ("testInitWithStringsAndAttributes", testInitWithStringsAndAttributes),
        ("testInitWithTextAndLink", testInitWithTextAndLink)
    ]
}
