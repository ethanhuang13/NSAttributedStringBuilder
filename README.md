# NSAttributedStringBuilder
Composing NSAttributedString with SwiftUI-style syntax.

**NSAttributedStringBuilder** is a `NSAttributedString` syntax helper powerd by the now pitching [Function Builder](https://forums.swift.org/t/function-builders/25167). This project is in an early development stage, and currently mainly for proof-of-concept.

Project Link: [https://github.com/ethanhuang13/NSAttributedStringBuilder](https://github.com/ethanhuang13/NSAttributedStringBuilder)

## How to use?

Traditionally we compose a `NSAttributedString` like this:

```Swift
let mas = NSMutableAttributedString(string: "")
mas.append(NSAttributedString(string: "Hello world", attributes: [.font: UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.red]))
mas.append(NSAttributedString(string: "\n"))
mas.append(NSAttributedString(string: "with Swift", attributes: [.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor.orange]))

```
Now, wit **NSAttributedStringBuilder**, we can use SwiftUI-like syntax to declare `NSAttributedString`.

```Swift
let attributedString = NSAttributedString {
    AttrText("Hello world")
        .font(.systemFont(ofSize: 24))
        .color(.red)
    AttrText.linebreak
    AttrText("with Swift")
        .font(.systemFont(ofSize: 20))
        .color(.orange)
}

```

## Installation
**NSAttributedStringBuilder** supports **Swift Package Manager**. Open your project in Xcode 11, navigate to **Menu -> Swift Packages -> Add Package Dependency** and enter [https://github.com/ethanhuang13/NSAttributedStringBuilder](https://github.com/ethanhuang13/NSAttributedStringBuilder) to install.

## SwiftUI Sample Project
Besides clearer `NSAttributedString` syntax, since **NSAttributedStringBuilder** uses Function Builder it also enables API to build components in `UIViewRepresentable`(which embbed `UIView` in a SwiftUI `View`).

Just like a SwiftUI `Text` takes a `String` as input, the purpose of `AttributedText` in the sample project is to take a `NSAttributedString` as input and render in SwiftUI.

To achieve this, `AttributedText.swift` uses `@NSAttributedStringBuilder` to support SwiftUI-style syntax:

![AttributedText.swift](demo2.png)

Then use `AttributedText` will be like:
![demo](demo.png)

You can clone the [repo](https://github.com/ethanhuang13/NSAttributedStringBuilder) and open ***/SwiftUISampleApp/AttributedTextSample.xcodeproj***. The sample uses `UILabel`, you can also use an `UITextView` or `NSTextView`. 

## TODO
* Support older system versions
* Support more attributes like `NSParagraphStyle`
* Support image attachment
* More...

## Known Issue
* Requires iOS 13+ or macOS 10.15 because using Swift 5.1's [opaque result type](https://github.com/apple/swift-evolution/blob/master/proposals/0244-opaque-result-types.md) (the `some` keyword) in `Component`'s protocol extension.
* NSAttributedString does not support link color, therefore `Link` component with a `.color()` modifier has no effect. Alternatively you need to specify in `UITextView.linkTextAttributes` or `.tintColor`. 

## Others
Initially discussed on this [Twitter thread](https://twitter.com/ethanhuang13/status/1148135534826442752). Part of the code are inspired by [zonble](https://github.com/zonble/NSAttributedStringBuilder)🙏.
