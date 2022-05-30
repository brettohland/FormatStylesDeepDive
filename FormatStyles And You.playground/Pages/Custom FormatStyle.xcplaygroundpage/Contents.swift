import Foundation

struct ToYen: FormatStyle {
    typealias FormatInput = Int
    typealias FormatOutput = String

    static let multiplier = 100
    static let yenCurrencyCode = "jpy"

    let formatter: IntegerFormatStyle<Int>.Currency

    var attributed: ToYen.AttributedStyle = AttributedStyle()

    init(locale: Locale? = nil) {
        formatter = IntegerFormatStyle<Int>.Currency(code: Self.yenCurrencyCode, locale: locale ?? Locale.current)
    }

    func format(_ value: Int) -> String {
        (value * Self.multiplier).formatted(formatter)
    }

    // This is optional.
    func locale(_ locale: Locale) -> ToYen {
        .init(locale: locale)
    }
}

// MARK: Add Attributed Style support

extension ToYen {
    struct AttributedStyle: FormatStyle {
        typealias FormatInput = Int
        typealias FormatOutput = AttributedString

        func format(_ value: Int) -> AttributedString {
            (value * ToYen.multiplier).formatted(ToYen().formatter.attributed)
        }
    }
}

// MARK: Extend `FormatStyle` to simplify access

extension FormatStyle where Self == ToYen {
    static var toYen: ToYen { .init() }
}

// MARK: - Usage Examples

30.formatted(ToYen()) // "¥3,000"
30.formatted(.toYen) // "¥3,000")

30.formatted(.toYen.locale(Locale(identifier: "zh_CN"))) // "JP¥3,000"

30.formatted(.toYen.attributed)
