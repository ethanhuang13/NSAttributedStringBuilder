# NSAttributedStringBuilder
An NSAttributedString syntax helper powerd by Function Builder.

Link: [https://github.com/ethanhuang13/NSAttributedStringBuilder](https://github.com/ethanhuang13/NSAttributedStringBuilder)

## Installation
Open your project in Xcode 11, **Add Package Dependency** and enter [https://github.com/ethanhuang13/NSAttributedStringBuilder](https://github.com/ethanhuang13/NSAttributedStringBuilder)

## AttributedTextSample
Alternatively, you can clone the repo and open */SwiftUISampleApp/AttributedTextSample.xcodeproj*. It's a simple SwiftUI demo app. See `AttributedText.swift` for how to use NSAttributedStringBuilder in a SwiftUI custom view.

## TODO
* Support older system versions. (Currently using `some` for **modifier** in Component's protocol extension requires iOS 13+ or macOS 10.15.)
* Support more modifier like paragraphStyle

## Known Issue
* NSAttributedString does not support link color, therefore `Link` component with a `.color()` modifier has no effect. Alternatively you need to specify in `UITextView.linkTextAttributes` or `.tintColor`. 

## Others
Initially discussed on this [Twitter thread](https://twitter.com/ethanhuang13/status/1148135534826442752). Part of the code are inspired by [zonble](https://github.com/zonble/NSAttributedStringBuilder)🙏.
