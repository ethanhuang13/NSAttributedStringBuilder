import XCTest
@testable import NSAttributedStringBuilder

final class NSAttributedStringBuilderTests: XCTestCase {
    func testInitWithTwoAttrText() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world")
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
            AttrText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    func testInitTextWithFontAndColor() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "")
            mas.append(NSAttributedString(string: "Hello world",
                                          attributes: [
                                            .font: Font.systemFont(ofSize: 20),
                                            .foregroundColor: Color.red]))
            mas.append(NSAttributedString(string: "\n"))
            mas.append(NSAttributedString(string: "Second line",
                                          attributes: [.font: Font.systemFont(ofSize: 24)]))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Hello world")
                .font(.systemFont(ofSize: 20))
                .color(.red)
            AttrText.linebreak
            AttrText("Second line")
                .font(.systemFont(ofSize: 24))
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    func testInitWithTextAndLink() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "")
            mas.append(NSAttributedString(string: "Here is a link to ",
                                          attributes: [.foregroundColor: Color.brown]))
            mas.append(NSAttributedString(string: "Apple",
                                          attributes: [.link: URL(string: "https://www.apple.com")!]))
            return mas
        }()

        let sut = NSAttributedString {
            AttrText("Here is a link to ")
                .color(.brown)
            Link("Apple", url: URL(string: "https://www.apple.com")!)
        }

        XCTAssertTrue(sut.isEqual(testData))
    }

    static var allTests = [
        ("testInitTextWithFontAndColor", testInitTextWithFontAndColor),
        ("testInitWithTextAndLink", testInitWithTextAndLink)
    ]
}
