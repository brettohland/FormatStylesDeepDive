import PlaygroundSupport
import SwiftUI

// Not all FormatStyle instances provided by Apple will output AttributedString values.
// Check the blog for all of the details.

struct ContentView: View {
    var percentAttributed: AttributedString {
        var percentAttributedString = 0.8890.formatted(.percent.attributed)
        percentAttributedString.swiftUI.font = .title
        percentAttributedString.runs.forEach { run in
            if let numberRun = run.numberPart {
                switch numberRun {
                case .integer:
                    percentAttributedString[run.range].foregroundColor = .orange
                case .fraction:
                    percentAttributedString[run.range].foregroundColor = .blue
                }
            }

            if let symbolRun = run.numberSymbol {
                switch symbolRun {
                case .percent:
                    percentAttributedString[run.range].foregroundColor = .green
                case .decimalSeparator:
                    percentAttributedString[run.range].foregroundColor = .red
                default:
                    break
                }
            }
        }

        return percentAttributedString
    }

    var body: some View {
        VStack {
            Text(percentAttributed)
        }
        .padding()
    }
}

PlaygroundPage.current.setLiveView(ContentView())


