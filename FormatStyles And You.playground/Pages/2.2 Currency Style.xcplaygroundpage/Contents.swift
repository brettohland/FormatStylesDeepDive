import Foundation

10.formatted(.currency(code: "JPY")) // "10%"

FloatingPointFormatStyle<Double>.Currency(code: "JPY").rounded(rule: .up, increment: 1).format(10.9) // ¥11"
IntegerFormatStyle<Int>.Currency(code: "GBP").presentation(.fullName).format(42) // "42.00 British pounds"
Decimal.FormatStyle.Currency(code: "USD").scale(12).format(0.1) // "$1.20"

// MARK: - Rounded

Decimal(0.59).formatted(.currency(code: "GBP").rounded()) // "£0.59"
Decimal(0.599).formatted(.currency(code: "GBP").rounded()) // "£0.60"
Decimal(0.5999).formatted(.currency(code: "GBP").rounded()) // "£0.60"

Decimal(5.001).formatted(.currency(code: "GBP").rounded(rule: .awayFromZero)) // "£5.01"
Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .awayFromZero)) // "£5.01"

Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .awayFromZero, increment: 1)) // "£6"
Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .awayFromZero, increment: 10)) // "£10"

Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .down)) // "£5.00"
Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .toNearestOrAwayFromZero)) // "£5.01"
Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .towardZero)) // "£5.00"
Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .up)) // "£5.01"

Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .down, increment: 1)) // "£5"
Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .toNearestOrAwayFromZero, increment: 1)) // "£5"
Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .towardZero, increment: 1)) // "£5"
Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .up, increment: 1)) // "£5"

// MARK: - Grouping

Int(3_000).formatted(.currency(code: "GBP").grouping(.never)) // "£3000.00"
Int(3_000).formatted(.currency(code: "GBP").grouping(.automatic)) // "£3,000.00"

// MARK: - Precision

// Please don't use Floating point numbers to store currency. Please.
Float(3_000.003).formatted(.currency(code: "GBP").precision(.fractionLength(4))) // "£3,000.0029" <- This is why
Float(3_000.003).formatted(.currency(code: "GBP").precision(.fractionLength(1 ... 4))) // "£3,000.0029"

Decimal(3_000.003).formatted(.currency(code: "GBP").precision(.fractionLength(4))) // "£3,000.0029"
Decimal(3_000.003).formatted(.currency(code: "GBP").precision(.fractionLength(1 ... 4))) // "£3,000.0029"

Decimal(3_000.003).formatted(.currency(code: "GBP").precision(.integerLength(3))) // "£000.00"
Decimal(3_000.003).formatted(.currency(code: "GBP").precision(.integerLength(4))) // "£3,000.00"
Decimal(3_000.003).formatted(.currency(code: "GBP").precision(.integerLength(5))) // "£03,000.00"

Decimal(3_000.003).formatted(.currency(code: "GBP").precision(.integerLength(0 ... 3))) // "£.00"
Decimal(3_000.003).formatted(.currency(code: "GBP").precision(.integerLength(0 ... 4))) // "£3,000.00"
Decimal(3_000.003).formatted(.currency(code: "GBP").precision(.integerLength(0 ... 5))) // "£03,000.00"

Decimal(3).formatted(.currency(code: "GBP").precision(.integerAndFractionLength(integer: 4, fraction: 4))) // "£0,003.0000"
Decimal(3).formatted(
    .currency(code: "GBP")
        .precision(.integerAndFractionLength(integerLimits: 1 ... 5, fractionLimits: 1 ... 5))
) // "£3.0"
Decimal(3.00004).formatted(
    .currency(code: "GBP")
        .precision(.integerAndFractionLength(integerLimits: 1 ... 5, fractionLimits: 1 ... 5))
) // "£3.00004"
Decimal(3.000000004).formatted(
    .currency(code: "GBP")
        .precision(.integerAndFractionLength(integerLimits: 1 ... 5, fractionLimits: 1 ... 5))
)
Decimal(30_000.01).formatted(
    .currency(code: "GBP")
        .precision(.integerAndFractionLength(integerLimits: 1 ... 5, fractionLimits: 1 ... 5))
) // "£30,000.01"
Decimal(3_000_000.000001).formatted(
    .currency(code: "GBP")
        .precision(.integerAndFractionLength(integerLimits: 1 ... 5, fractionLimits: 1 ... 5))
) // "£0.0"

Decimal(10.1).formatted(.currency(code: "GBP").precision(.significantDigits(1))) // "£10"
Decimal(10.1).formatted(.currency(code: "GBP").precision(.significantDigits(2))) // "£10"
Decimal(10.1).formatted(.currency(code: "GBP").precision(.significantDigits(3))) // "£10.1"
Decimal(10.1).formatted(.currency(code: "GBP").precision(.significantDigits(4))) // "£10.10"
Decimal(10.1).formatted(.currency(code: "GBP").precision(.significantDigits(5))) // "£10.100"

Decimal(1).formatted(.currency(code: "GBP").precision(.significantDigits(1 ... 3))) // "£1"
Decimal(10).formatted(.currency(code: "GBP").precision(.significantDigits(1 ... 3))) // "£10"
Decimal(10.1).formatted(.currency(code: "GBP").precision(.significantDigits(1 ... 3))) // "£10.1"
Decimal(10.01).formatted(.currency(code: "GBP").precision(.significantDigits(1 ... 3))) // "£10"

// MARK: - Decimal Separator

Decimal(3_000).formatted(.currency(code: "GBP").decimalSeparator(strategy: .automatic)) // "£3,000.00"
Decimal(3_000).formatted(.currency(code: "GBP").decimalSeparator(strategy: .always)) // "£3,000.00"

// MARK: - Presentation

Decimal(10).formatted(.currency(code: "GBP").presentation(.fullName)) // "10.00 British pounds"
Decimal(10).formatted(.currency(code: "GBP").presentation(.isoCode)) // "GBP 10.00"
Decimal(10).formatted(.currency(code: "GBP").presentation(.narrow)) // "£10.00"
Decimal(10).formatted(.currency(code: "GBP").presentation(.standard)) // "£10.00"

// MARK: Scale

Decimal(10).formatted(.currency(code: "GBP").scale(1)) // "£10.00"
Decimal(10).formatted(.currency(code: "GBP").scale(1.5)) // "£15.00"
Decimal(10).formatted(.currency(code: "GBP").scale(-1.5)) // "-£15.00"
Decimal(10).formatted(.currency(code: "GBP").scale(10)) // "£100.00"

// MARK: - Locale

Decimal(10).formatted(.currency(code: "GBP").presentation(.fullName).locale(Locale(identifier: "fr_FR"))) // "10,00 livres sterling"

// MARK: - Sign

Decimal(7).formatted(.currency(code: "GBP").sign(strategy: .automatic)) // "£7.00"
Decimal(7).formatted(.currency(code: "GBP").sign(strategy: .never)) // "£7.00"
Decimal(7).formatted(.currency(code: "GBP").sign(strategy: .accounting)) // "£7.00"
Decimal(7).formatted(.currency(code: "GBP").sign(strategy: .accountingAlways())) // "+£7.00"
Decimal(7).formatted(.currency(code: "GBP").sign(strategy: .accountingAlways(showZero: true))) // "+£7.00"
Decimal(7).formatted(.currency(code: "GBP").sign(strategy: .accountingAlways(showZero: false))) // "+£7.00"
Decimal(7).formatted(.currency(code: "GBP").sign(strategy: .always())) // "+£7.00"
Decimal(7).formatted(.currency(code: "GBP").sign(strategy: .always(showZero: true))) // "+£7.00"
Decimal(7).formatted(.currency(code: "GBP").sign(strategy: .always(showZero: false))) // "+£7.00"

// MARK: Compositing

Decimal(10).formatted(.currency(code: "GBP").scale(200.0).sign(strategy: .always()).presentation(.fullName)) // "+2,000.00 British pounds"

// MARK: - Attributed String

Decimal(10).formatted(.currency(code: "GBP").scale(200.0).sign(strategy: .always()).presentation(.fullName).attributed)

// MARK: - Initializing

let frenchStyle = IntegerFormatStyle<Int>.Currency(code: "GBP")
    .sign(strategy: .always())
    .presentation(.fullName)
    .locale(Locale(identifier: "fr_FR"))

frenchStyle.format(1_000) // "+1 000,00 livres sterling"
1_000.formatted(frenchStyle) // "+1 000,00 livres sterling"

// MARK: - Parsing

let parsingStyle = Decimal.FormatStyle.Currency(code: "GBP").presentation(.fullName)

try? parsingStyle.parseStrategy.parse("10.00 British pounds") // 10
try? Decimal("10.00 British pounds", strategy: parsingStyle.parseStrategy) // 10
