import Foundation

// MARK: - Rounded

Double(1.9999999).formatted(.percent.rounded()) // "199.99999%"
Decimal(1.9999999).formatted(.percent.rounded()) // "199.99999%"
Float(1.9999999).formatted(.percent.rounded()) // "199.999998%"
Int(1.9999999).formatted(.percent.rounded()) // 1%

Float(0.26575467567788).formatted(.percent.rounded(rule: .awayFromZero)) // "26.575467%"
Float(0.00900999876871).formatted(.percent.rounded(rule: .awayFromZero)) // "0.901%"
Float(5.01).formatted(.percent.rounded(rule: .awayFromZero, increment: 1)) // "502%"
Float(5.01).formatted(.percent.rounded(rule: .awayFromZero, increment: 10)) // "510%"
Float(0.01).formatted(.percent.rounded(rule: .down)) // "0.999999%"
Float(0.01).formatted(.percent.rounded(rule: .toNearestOrAwayFromZero)) // "1%"
Float(0.01).formatted(.percent.rounded(rule: .towardZero)) // "0.999999%"
Float(0.01).formatted(.percent.rounded(rule: .up)) // "1%"
Float(5.01).formatted(.percent.rounded(rule: .down, increment: 1)) // "501%"
Float(5.01).formatted(.percent.rounded(rule: .toNearestOrAwayFromZero, increment: 1)) // "501%"
Float(5.01).formatted(.percent.rounded(rule: .towardZero, increment: 1)) // "501%"
Float(5.01).formatted(.percent.rounded(rule: .up, increment: 1)) // "502%"

Double(0.26575467567788).formatted(.percent.rounded(rule: .awayFromZero)) // "26.575468%"
Double(0.00900999876871).formatted(.percent.rounded(rule: .awayFromZero)) // "0.901%"
Double(5.01).formatted(.percent.rounded(rule: .awayFromZero, increment: 1)) // "501%"
Double(5.01).formatted(.percent.rounded(rule: .awayFromZero, increment: 10)) // "510%"
Double(0.01).formatted(.percent.rounded(rule: .down)) // "1%"
Double(0.01).formatted(.percent.rounded(rule: .toNearestOrAwayFromZero)) // "1%"
Double(0.01).formatted(.percent.rounded(rule: .towardZero)) // "1%"
Double(0.01).formatted(.percent.rounded(rule: .up)) // "1%"
Double(5.01).formatted(.percent.rounded(rule: .down, increment: 1)) // "501%"
Double(5.01).formatted(.percent.rounded(rule: .toNearestOrAwayFromZero, increment: 1)) // "501%"
Double(5.01).formatted(.percent.rounded(rule: .towardZero, increment: 1)) // "501%"
Double(5.01).formatted(.percent.rounded(rule: .up, increment: 1)) // "501%"

Decimal(0.26575467567788).formatted(.percent.rounded(rule: .awayFromZero)) // "26.575468%"
Decimal(0.00900999876871).formatted(.percent.rounded(rule: .awayFromZero)) // "0.901%"
Decimal(5.01).formatted(.percent.rounded(rule: .awayFromZero, increment: 1)) // "501%"
Decimal(5.01).formatted(.percent.rounded(rule: .awayFromZero, increment: 10)) // "510%"
Decimal(0.01).formatted(.percent.rounded(rule: .down)) // "1%"
Decimal(0.01).formatted(.percent.rounded(rule: .toNearestOrAwayFromZero)) // "1%"
Decimal(0.01).formatted(.percent.rounded(rule: .towardZero)) // "1%"
Decimal(0.01).formatted(.percent.rounded(rule: .up)) // "1%"
Decimal(5.01).formatted(.percent.rounded(rule: .down, increment: 1)) // "500%"
Decimal(5.01).formatted(.percent.rounded(rule: .toNearestOrAwayFromZero, increment: 1)) // "501%"
Decimal(5.01).formatted(.percent.rounded(rule: .towardZero, increment: 1)) // "500%"
Decimal(5.01).formatted(.percent.rounded(rule: .up, increment: 1)) // "501%"

// MARK: - Sign

Float(1.90).formatted(.percent.sign(strategy: .never)) // "189.999998%"
Float(-1.90).formatted(.percent.sign(strategy: .never)) // "189.999998%"
Float(1.90).formatted(.percent.sign(strategy: .automatic)) // "189.999998%"
Float(1.90).formatted(.percent.sign(strategy: .always())) // "+189.999998%"
Float(0).formatted(.percent.sign(strategy: .always(includingZero: true))) // "+0%"
Float(0).formatted(.percent.sign(strategy: .always(includingZero: false))) // "0%"

// MARK: - Decimal Separator

Float(10).formatted(.percent.decimalSeparator(strategy: .automatic)) // "1,000%"
Float(10).formatted(.percent.decimalSeparator(strategy: .always)) // "1,000.%"

// MARK: - Grouping

Float(1_000).formatted(.percent.grouping(.automatic)) // "100,000%"
Float(1_000).formatted(.percent.grouping(.never)) // "100000%"

// MARK: - Precision

Decimal(10.1).formatted(.percent.precision(.significantDigits(1))) // "1,000%"
Decimal(10.1).formatted(.percent.precision(.significantDigits(2))) // "1,000%"
Decimal(10.1).formatted(.percent.precision(.significantDigits(3))) // "1,010%"
Decimal(10.1).formatted(.percent.precision(.significantDigits(4))) // "1,010%"
Decimal(10.1).formatted(.percent.precision(.significantDigits(5))) // "1,010.0%"

Decimal(1).formatted(.percent.precision(.significantDigits(1...3))) // "100%"
Decimal(10).formatted(.percent.precision(.significantDigits(1...3))) // "1,000%"
Decimal(10.1).formatted(.percent.precision(.significantDigits(1...3))) // "1,010%"
Decimal(10.01).formatted(.percent.precision(.significantDigits(1...3))) // "1,000%"

Decimal(0.0001).formatted(.percent.precision(.fractionLength(1))) // 0.0%
Decimal(0.0001).formatted(.percent.precision(.fractionLength(2))) // 0.001%
Decimal(0.0001).formatted(.percent.precision(.fractionLength(3))) // 0.010%

Decimal(0.0001).formatted(.percent.precision(.fractionLength(0...1))) // 0%
Decimal(0.0001).formatted(.percent.precision(.fractionLength(0...2))) // 0.01%
Decimal(0.0001).formatted(.percent.precision(.fractionLength(0...3))) // 0.01%
Decimal(0.0001).formatted(.percent.precision(.fractionLength(0...4))) // 0.01%

Decimal(10.111).formatted(.percent.precision(.integerLength(1))) // 1.1%
Decimal(10.111).formatted(.percent.precision(.integerLength(2))) // 11.1%

Decimal(10.111).formatted(.percent.precision(.integerLength(0...1))) // 1.1%
Decimal(10.111).formatted(.percent.precision(.integerLength(0...2))) // 11.1%
Decimal(10.111).formatted(.percent.precision(.integerLength(0...3))) // 11.1%

Decimal(10.111).formatted(.percent.precision(.integerAndFractionLength(integer: 1, fraction: 1))) // 1.1%
Decimal(10.111).formatted(.percent.precision(.integerAndFractionLength(integer: 2, fraction: 1))) // 11.1%
Decimal(10.111).formatted(.percent.precision(.integerAndFractionLength(integer: 2, fraction: 2))) // 11.10%
Decimal(10.111).formatted(.percent.precision(.integerAndFractionLength(integer: 2, fraction: 3))) // 11.100%

// MARK: - Notation

Float(1_000).formatted(.percent.notation(.automatic)) // "100,000%"
Float(1_000).formatted(.percent.notation(.compactName)) // "100K%"
Float(1_000).formatted(.percent.notation(.scientific)) // "1E5%"

// MARK: - Scale

Float(10).formatted(.percent.scale(1.0)) // "10%"
Float(10).formatted(.percent.scale(1.5)) // "15%"
Float(10).formatted(.percent.scale(2.0)) // "20%"
Float(10).formatted(.percent.scale(-2.0)) // "-20%"

// MARK: Compositing

Float(10).formatted(.percent.scale(200.0).notation(.compactName).grouping(.automatic)) // "2K%"

// MARK: - Locale

Float(1_000).formatted(.percent.grouping(.automatic).locale(Locale(identifier: "fr_FR"))) // "100 000 %"
Float(1_000).formatted(.percent.grouping(.never).locale(Locale(identifier: "fr_FR"))) // "100000 %"

Float(1_000).formatted(.percent.notation(.automatic).locale(Locale(identifier: "fr_FR"))) // "100 000 %"
Float(1_000).formatted(.percent.notation(.compactName).locale(Locale(identifier: "fr_FR"))) // "100 k %"
Float(1_000).formatted(.percent.notation(.scientific).locale(Locale(identifier: "fr_FR"))) // "1E5 %"

// MARK: - Attributed String Output

Float(10).formatted(.percent.scale(200.0).notation(.compactName).grouping(.automatic).attributed)

// MARK: - Initializing

let frenchStyle = FloatingPointFormatStyle<Double>.Percent()
    .notation(.compactName)
    .locale(Locale(identifier: "fr_FR"))

frenchStyle.format(0.1) // "10 %"
0.1.formatted(frenchStyle) // "10 %"
