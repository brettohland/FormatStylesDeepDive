//: [Previous](@previous)

import Foundation

// MARK: - Rounded

Double(1.9999999).formatted(.number.rounded())  // "2"
Decimal(1.9999999).formatted(.number.rounded()) // "2"
Float(1.9999999).formatted(.number.rounded())   // "2"
Int(1.9999999).formatted(.number.rounded())     // "1"

Float(0.26575467567788).formatted(.number.rounded(rule: .awayFromZero))              // "0.265755"
Float(0.00900999876871).formatted(.number.rounded(rule: .awayFromZero))              // "0.00901"
Float(5.01).formatted(.number.rounded(rule: .awayFromZero, increment: 1))            // "6"
Float(5.01).formatted(.number.rounded(rule: .awayFromZero, increment: 10))           // "10"
Float(0.01).formatted(.number.rounded(rule: .down))                                  // "0.009999"
Float(0.01).formatted(.number.rounded(rule: .toNearestOrAwayFromZero))               // "0.01"
Float(0.01).formatted(.number.rounded(rule: .towardZero))                            // "0.009999"
Float(0.01).formatted(.number.rounded(rule: .up))                                    // "0.01"
Float(5.01).formatted(.number.rounded(rule: .down, increment: 1))                    // "5"
Float(5.01).formatted(.number.rounded(rule: .toNearestOrAwayFromZero, increment: 1)) // "5"
Float(5.01).formatted(.number.rounded(rule: .towardZero, increment: 1))              // "5"
Float(5.01).formatted(.number.rounded(rule: .up, increment: 1))                      // "5"

Double(0.26575467567788).formatted(.number.rounded(rule: .awayFromZero))              // "0.265755"
Double(0.00900999876871).formatted(.number.rounded(rule: .awayFromZero))              // "0.00901"
Double(5.01).formatted(.number.rounded(rule: .awayFromZero, increment: 1))            // "6"
Double(5.01).formatted(.number.rounded(rule: .awayFromZero, increment: 10))           // "10"
Double(0.01).formatted(.number.rounded(rule: .down))                                  // "0.01"
Double(0.01).formatted(.number.rounded(rule: .toNearestOrAwayFromZero))               // "0.01"
Double(0.01).formatted(.number.rounded(rule: .towardZero))                            // "0.01"
Double(0.01).formatted(.number.rounded(rule: .up))                                    // "0.01"
Double(5.01).formatted(.number.rounded(rule: .down, increment: 1))                    // "5"
Double(5.01).formatted(.number.rounded(rule: .toNearestOrAwayFromZero, increment: 1)) // "5"
Double(5.01).formatted(.number.rounded(rule: .towardZero, increment: 1))              // "5"
Double(5.01).formatted(.number.rounded(rule: .up, increment: 1))                      // "5"

Decimal(0.26575467567788).formatted(.number.rounded(rule: .awayFromZero))              // "0.265755"
Decimal(0.00900999876871).formatted(.number.rounded(rule: .awayFromZero))              // "0.00901"
Decimal(5.01).formatted(.number.rounded(rule: .awayFromZero, increment: 1))            // "6"
Decimal(5.01).formatted(.number.rounded(rule: .awayFromZero, increment: 10))           // "10"
Decimal(0.01).formatted(.number.rounded(rule: .down))                                  // "0.01"
Decimal(0.01).formatted(.number.rounded(rule: .toNearestOrAwayFromZero))               // "0.01"
Decimal(0.01).formatted(.number.rounded(rule: .towardZero))                            // "0.01"
Decimal(0.01).formatted(.number.rounded(rule: .up))                                    // "0.01"
Decimal(5.01).formatted(.number.rounded(rule: .down, increment: 1))                    // "5"
Decimal(5.01).formatted(.number.rounded(rule: .toNearestOrAwayFromZero, increment: 1)) // "5"
Decimal(5.01).formatted(.number.rounded(rule: .towardZero, increment: 1))              // "5"
Decimal(5.01).formatted(.number.rounded(rule: .up, increment: 1))                      // "5"

// MARK: - Sign

Float(1.90).formatted(.number.sign(strategy: .never))                     // "1.9"
Float(-1.90).formatted(.number.sign(strategy: .never))                    // "1.9"
Float(1.90).formatted(.number.sign(strategy: .automatic))                 // "1.9"
Float(1.90).formatted(.number.sign(strategy: .always()))                  // "+1.9"
Float(0).formatted(.number.sign(strategy: .always(includingZero: true)))  // "+0"
Float(0).formatted(.number.sign(strategy: .always(includingZero: false))) // "0"

// MARK: - Decimal Separator

Float(10).formatted(.number.decimalSeparator(strategy: .automatic)) // "10"
Float(10).formatted(.number.decimalSeparator(strategy: .always))    // "10."

// MARK: - Grouping

Float(1000).formatted(.number.grouping(.automatic)) // "1,000"
Float(1000).formatted(.number.grouping(.never))     // "1000"

// MARK: - Grouping with Locale

Float(1000).formatted(.number.grouping(.automatic).locale(Locale(identifier: "fr_FR"))) // "1 000"
Float(1000).formatted(.number.grouping(.never).locale(Locale(identifier: "fr_FR")))     // "1000"

// MARK: - Significant Digits

Decimal(10.1).formatted(.number.precision(.significantDigits(1))) // "10"
Decimal(10.1).formatted(.number.precision(.significantDigits(2))) // "10"
Decimal(10.1).formatted(.number.precision(.significantDigits(3))) // "10.1"
Decimal(10.1).formatted(.number.precision(.significantDigits(4))) // "10.10"
Decimal(10.1).formatted(.number.precision(.significantDigits(5))) // "10.100"

Decimal(1).formatted(.number.precision(.significantDigits(1 ... 3)))     // "1"
Decimal(10).formatted(.number.precision(.significantDigits(1 ... 3)))    // "10"
Decimal(10.1).formatted(.number.precision(.significantDigits(1 ... 3)))  // "10.1"
Decimal(10.01).formatted(.number.precision(.significantDigits(1 ... 3))) // "10"

// MARK: - Notation

Float(1_000).formatted(.number.notation(.automatic))   // "1,000"
Float(1_000).formatted(.number.notation(.compactName)) // "1K"
Float(1_000).formatted(.number.notation(.scientific))  // "1E3"

// MARK: - Notation with Locale

Float(1_000).formatted(.number.notation(.automatic).locale(Locale(identifier: "fr_FR")))   // "1 000"
Float(1_000).formatted(.number.notation(.compactName).locale(Locale(identifier: "fr_FR"))) // "1 k"
Float(1_000).formatted(.number.notation(.scientific).locale(Locale(identifier: "fr_FR")))  // "1E3"

// MARK: - Scale

Float(10).formatted(.number.scale(1.0))  // "10"
Float(10).formatted(.number.scale(1.5))  // "15"
Float(10).formatted(.number.scale(2.0))  // "20"
Float(10).formatted(.number.scale(-2.0)) // "-20"

// MARK: - Compositing

Float(10).formatted(.number.scale(200.0).notation(.compactName).grouping(.automatic)) // "2K"

//: [Next](@next)
