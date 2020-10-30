import XCTest
@testable import NSAttributedStringBuilder

final class NSAttributedStringBuilderTests: XCTestCase {
    func testInitWithTwoAText() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world")
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
            AText(" with Swift")
        }

        let sut2 = NSAttributedString {
            "Hello world"
            " with Swift"
        }

        XCTAssertTrue(sut.isEqual(testData))
        XCTAssertTrue(sut2.isEqual(sut))
    }

    func testInitWithStringAndAText() {
        let testData: NSAttributedString = {
            let mas = NSMutableAttributedString(string: "Hello world")
            mas.append(NSAttributedString(string: " with Swift"))
            return mas
        }()

        let sut = NSAttributedString {
            AText("Hello world")
            " with Swift"
        }

        let sut2 = NSAttributedString {
            "Hello world"
            AText(" with Swift")
        }

        XCTAssertTrue(sut.isEqual(testData))
        XCTAssertTrue(sut2.isEqual(sut))
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
            AText("Here is a link to ")
                .foregroundColor(.brown)
            Link("Apple", url: URL(string: "https://www.apple.com")!)
        }

        let sut2 = NSAttributedString {
            "Here is a link to "
                .foregroundColor(.brown)
            Link("Apple", url: URL(string: "https://www.apple.com")!)
        }

        XCTAssertTrue(sut.isEqual(testData))
        XCTAssertTrue(sut2.isEqual(sut))
    }

    static var allTests = [
        ("testInitWithTwoAText", testInitWithTwoAText),
        ("testInitWithStringAndAText", testInitWithStringAndAText),
        ("testInitWithTextAndLink", testInitWithTextAndLink)
    ]
}
