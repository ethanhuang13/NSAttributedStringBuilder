import SwiftUI
import NSAttributedStringBuilder

struct ContentView : View {
    var body: some View {
        VStack {
            Text("Text Title")
                .font(.largeTitle)
            Text("Text Subtitle")
                .font(.headline)
            Text("Text Link")
                .font(.body)
                .underline()
                .color(.blue)

            Spacer()

            // UILabel: UIViewRepresentable 
            AttributedText {
                ImageAttachment(UIImage(named: "Swift_logo_color_rgb.jpg")!)
                AttrText("AttributedText Title")
                    .font(.preferredFont(forTextStyle: .largeTitle))
                AttrText.linebreak
                AttrText("AttributedText Subtitle")
                    .font(.preferredFont(forTextStyle: .headline))
                AttrText.linebreak
                Link("Attributed Link", url: URL(string: "https://www.apple.com")!)
                    .font(.preferredFont(forTextStyle: .body))
            }
            .background(Color.gray)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
