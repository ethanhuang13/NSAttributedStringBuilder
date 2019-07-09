import SwiftUI
import NSAttributedStringBuilder

/// A custom view to use NSAttributedString in SwiftUI
final public class AttributedText: UIViewRepresentable {
    var numberOfLines: Int = 0

    var attributedString: NSAttributedString

    private init(_ attributedString: NSAttributedString) {
        self.attributedString = attributedString
    }

    public convenience init(@NSAttributedStringBuilder _ builder: () -> NSAttributedString) {
        self.init(builder())
    }

    public func makeUIView(context: UIViewRepresentableContext<AttributedText>) -> UILabel {
        let label = UILabel(frame: .zero)
        label.attributedText = self.attributedString
        label.numberOfLines = self.numberOfLines
        label.textAlignment = .center
        return label
    }

    public func updateUIView(_ label: UILabel, context: UIViewRepresentableContext<AttributedText>) {
        label.attributedText = self.attributedString
    }
}

#if DEBUG
struct AttributedText_Previews : PreviewProvider {
    static var previews: some View {
        AttributedText {
            AttrText("Test Title")
                .font(.preferredFont(forTextStyle: .headline))
                .color(.red)
            AttrText.linebreak
            AttrText("Test subtitle")
                .font(.preferredFont(forTextStyle: .subheadline))
                .color(.green)
        }
    }
}
#endif
