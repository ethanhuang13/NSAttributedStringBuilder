import SwiftUI
import NSAttributedStringBuilder

/// A custom view to use NSAttributedString in SwiftUI
final public class AttributedText: UIViewRepresentable {
    var attributedString: NSAttributedString

    private init(_ attributedString: NSAttributedString) {
        self.attributedString = attributedString
    }

    public convenience init(@NSAttributedStringBuilder _ builder: () -> NSAttributedString) {
        self.init(builder())
    }

    public func makeUIView(context: UIViewRepresentableContext<AttributedText>) -> UITextView {
        let textView = UITextView(frame: .zero)
        textView.attributedText = self.attributedString
        textView.isEditable = false
        textView.backgroundColor = .clear
        textView.textAlignment = .center
        return textView
    }

    public func updateUIView(_ textView: UITextView, context: UIViewRepresentableContext<AttributedText>) {
        textView.attributedText = self.attributedString
    }
}

#if DEBUG
struct AttributedText_Previews : PreviewProvider {
    static var previews: some View {
        AttributedText {
            ImageAttachment(UIImage(named: "Swift_logo_color_rgb.jpg")!, size: CGSize(width: 90, height: 90))
            AText.linebreak
                .lineSpacing(20)
            AText("Hello SwiftUI")
                .backgroundColor(.red)
                .baselineOffset(10)
                .font(.systemFont(ofSize: 20))
                .color(.yellow)
                .expansion(1)
                .kerning(3)
                .ligature(.none)
                .obliqueness(0.5)
                .shadow(color: .black, radius: 10, x: 4, y: 4)
                .strikethrough(style: .patternDash, color: .black)
                .stroke(width: -2, color: .green)
                .underline(.patternDashDotDot, color: .cyan)
            AText.linebreak
            AText(" with fun")
                .paragraphSpacing(10, before: 60)
                .alignment(.right)
        }
    }
}
#endif
