import Foundation

struct ToYen: FormatStyle {
    typealias FormatInput = Int
    typealias FormatOutput = String

    static let multiplier = 100
    static let formatter = IntegerFormatStyle<Int>.Currency.currency(code: "jpy")

    var attributed: ToYen.AttributedStyle = AttributedStyle()

    func format(_ value: Int) -> String {
        (value * ToYen.multiplier).formatted(ToYen.formatter)
    }
}

extension ToYen {
    struct AttributedStyle: FormatStyle {
        typealias FormatInput = Int
        typealias FormatOutput = AttributedString

        func format(_ value: Int) -> AttributedString {
            (value * ToYen.multiplier).formatted(ToYen.formatter.attributed)
        }
    }
}

extension FormatStyle where Self == ToYen {
    static var toYen: ToYen { .init() }
}

30.formatted(ToYen()) // "¥3,000"
30.formatted(.toYen) // "¥3,000"
30.formatted(ToYen().attributed)
30.formatted(.toYen.attributed)

// MARK: Output AttributedString
