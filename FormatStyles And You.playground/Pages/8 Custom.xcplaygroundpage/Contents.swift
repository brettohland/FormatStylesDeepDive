import Foundation

// MARK: - Customizing Existing FormatStyles

struct ToYen: FormatStyle {
    typealias FormatInput = Decimal
    typealias FormatOutput = String

    static let multiplier = 100.0
    static let yenCurrencyCode = "jpy"

    let formatter: Decimal.FormatStyle.Currency

    var attributed: ToYen.AttributedStyle = AttributedStyle()

    init(locale: Locale? = nil) {
        formatter = Decimal.FormatStyle.Currency(code: Self.yenCurrencyCode)
            .scale(Self.multiplier)
            .locale(locale ?? .current)
    }

    func format(_ value: Decimal) -> String {
        formatter.format(value)
    }

    // This is an optional protocol method, but needed to support locale switching
    func locale(_ locale: Locale) -> ToYen {
        .init(locale: locale)
    }
}

// MARK: Add Attributed Style support

extension ToYen {
    struct AttributedStyle: FormatStyle {
        typealias FormatInput = Decimal
        typealias FormatOutput = AttributedString

        func format(_ value: Decimal) -> AttributedString {
            ToYen().formatter.attributed.format(value)
        }
    }
}

// MARK: Extend `FormatStyle` to simplify access

extension FormatStyle where Self == ToYen {
    static var toYen: ToYen { .init() }
}

// MARK: - Usage Examples

Decimal(30.0)

Decimal(30).formatted(ToYen()) // "¥3,000"
Decimal(30).formatted(.toYen) // "¥3,000")
Decimal(30).formatted(.toYen.locale(Locale(identifier: "zh_CN"))) // "JP¥3,000"
Decimal(30).formatted(.toYen.attributed)

// MARK: - Creating a FormatStyle for a custom data type

struct ISBN {
    let prefix: String
    let registrationGroup: String
    let registrant: String
    let publication: String
    let checkDigit: String
}

extension ISBN {
    func formatted() -> String {
        ISBN.FormatStyle().format(self)
    }

    func formatted<F: Foundation.FormatStyle>(_ format: F) -> F.FormatOutput where F.FormatInput == ISBN {
        format.format(self)
    }
}

extension ISBN {
    struct FormatStyle: Codable, Sendable, Hashable {
        enum DelimiterStrategy: Codable {
            case hyphen
            case none
        }

        let strategy: DelimiterStrategy

        init(delimiter strategy: DelimiterStrategy = .hyphen) {
            self.strategy = strategy
        }
    }
}

// MARK: - ISBN.FormatStyle instance methods

extension ISBN.FormatStyle {
    func delimiter(_ strategy: DelimiterStrategy = .hyphen) -> Self {
        .init(delimiter: strategy)
    }
}

// MARK: - ISBN.FormatStyle `FormatStyle` conforma1tion

extension ISBN.FormatStyle: FormatStyle {
    func format(_ value: ISBN) -> String {
        switch strategy {
        case .hyphen:
            return "\(value.prefix)-\(value.registrationGroup)-\(value.registrant)-\(value.publication)-\(value.checkDigit)"
        case .none:
            return "\(value.prefix)\(value.registrationGroup)\(value.registrant)\(value.publication)\(value.checkDigit)"
        }
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension FormatStyle where Self == ISBN.FormatStyle {
    static var isbn: Self { .init() }
}

let isbn = ISBN(prefix: "978", registrationGroup: "17", registrant: "85889", publication: "01", checkDigit: "1")
isbn.formatted() // "978-17-85889-01-1"
isbn.formatted(.isbn) // "978-17-85889-01-1"
isbn.formatted(.isbn.delimiter(.none)) // "9781785889011"
isbn.formatted(ISBN.FormatStyle()) // "978-17-85889-01-1"
isbn.formatted(ISBN.FormatStyle(delimiter: .none)) // "9781785889011"
