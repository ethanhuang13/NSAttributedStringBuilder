# NSAttributedStringBuilder
[![Build Status](https://github.com/ethanhuang13/NSAttributedStringBuilder/workflows/Swift/badge.svg)](https://github.com/ethanhuang13/NSAttributedStringBuilder/actions?workflow=Swift)
[![codecov](https://codecov.io/gh/ethanhuang13/NSAttributedStringBuilder/branch/master/graph/badge.svg)](https://codecov.io/gh/ethanhuang13/NSAttributedStringBuilder)
[![GitHub release](https://img.shields.io/github/release/ethanhuang13/nsattributedstringbuilder.svg)]()
![GitHub top language](https://img.shields.io/github/languages/top/ethanhuang13/nsattributedstringbuilder.svg)
[![License](https://img.shields.io/github/license/ethanhuang13/nsattributedstringbuilder.svg)](https://github.com/ethanhuang13/ladybug/blob/master/LICENSE)
[![Twitter](https://img.shields.io/badge/Twitter-%40ethanhuang13-blue.svg)](https://twitter.com/ethanhuang13)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://paypal.me/ethanhuang13) 

Composing `NSAttributedString` with SwiftUI-style syntax, powered by [Result Builder](https://forums.swift.org/t/function-builders/25167).

Project Link: [https://github.com/ethanhuang13/NSAttributedStringBuilder](https://github.com/ethanhuang13/NSAttributedStringBuilder)

## Features

| | Features |
| --- | --- |
| 🐦 | Open source library written in Swift 5.4 |
| 🍬 | SwiftUI-like syntax |
| 💪 | Support most attributes in `NSAttributedString.Key` |
| 📦 | Distribution with Swift Package Manager |
| 🧪 | Fully tested code |
| 🛠 | Continuously integrates in [Swift Source Compatibility Suite](https://github.com/apple/swift-source-compat-suite/pull/373) |

## How to use?

Traditionally we compose a `NSAttributedString` like this:

```Swift
let mas = NSMutableAttributedString(string: "")
mas.append(NSAttributedString(string: "Hello world", attributes: [.font: UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.red]))
mas.append(NSAttributedString(string: "\n"))
mas.append(NSAttributedString(string: "with Swift", attributes: [.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor.orange]))

```
Now, with **NSAttributedStringBuilder**, we can use SwiftUI-like syntax to declare `NSAttributedString`:

```Swift
let attributedString = NSAttributedString {
    AText("Hello world")
        .font(.systemFont(ofSize: 24))
        .foregroundColor(.red)
    LineBreak()
    AText("with Swift")
        .font(.systemFont(ofSize: 20))
        .foregroundColor(.orange)
}

```

Add  Conditional String Builder and Loop String Builder

```Swift
@NSAttributedStringBuilder
var attributedString:NSAttributedString{
    AText("Hello world")
         .attribute(.foregroundColor, value: Color.blue)
            
   for character in ["a", "b", "c", "d"] {
       AText(character)
            .backgroundColor(UIColor.red)
            .alignment(.left)
   }
            
   if condition {
       AText("True")
            .foregroundColor(UIColor.black)
   }
   else{
       AText("False")
            .backgroundColor(UIColor.yellow)
   }
}
```



## Requirements

Xcode 12.5. This project uses Swift 5.4 feature [Result Builder](https://github.com/apple/swift-evolution/blob/main/proposals/0289-result-builders.md).

## Installation

### Swift Package
Open your project in Xcode 12, navigate to **Menu -> Swift Packages -> Add Package Dependency** and enter [https://github.com/ethanhuang13/NSAttributedStringBuilder](https://github.com/ethanhuang13/NSAttributedStringBuilder) to install.

### CocoaPods
Add `pod 'NSAttributedStringBuilder13'` to your `Podfile`. 

## SwiftUI Sample Project
Besides clearer `NSAttributedString` syntax, since **NSAttributedStringBuilder** uses Result Builder it also enables API to build components in `UIViewRepresentable`(which embeds `UIView` in a SwiftUI `View`).

Just like a SwiftUI `Text` takes a `String` as input, the purpose of `AttributedText` in the sample project is to take a `NSAttributedString` as input and render in SwiftUI.

To achieve this, `AttributedText.swift` uses `@NSAttributedStringBuilder` to support SwiftUI-style syntax:

![AttributedText.swift](demo2.jpg)

Then using an `AttributedText` will be like:
![ContentView.swift](demo.jpg)

Open the sample in ***/SwiftUISampleApp/AttributedTextSample.xcodeproj*** and check `AttributedText`. It uses `UITextView`, you can also use `UILabel` or `NSTextView`. 

## TODO
* Better tests for image attachment

## Known Issue
* `NSAttributedString` does not support link color, therefore `Link` component with a `.color()` modifier has no effect. Alternatively you need to specify in `UITextView.linkTextAttributes` or `.tintColor`. 

## Others
Initially discussed on this [Twitter thread](https://twitter.com/ethanhuang13/status/1148135534826442752). Some code are inspired by [zonble](https://github.com/zonble/NSAttributedStringBuilder)🙏.
