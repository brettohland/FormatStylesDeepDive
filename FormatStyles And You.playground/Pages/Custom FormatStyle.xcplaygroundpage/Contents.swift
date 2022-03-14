//: [Previous](@previous)

import Foundation

struct ToYen: FormatStyle {
    typealias FormatInput = Int
    typealias FormatOutput = String

    func format(_ value: Int) -> String {
        Decimal(value * 100).formatted(.currency(code: "jpy"))
    }
}

30.formatted(ToYen()) // "¥3,000"

extension FormatStyle where Self == ToYen {
    static var toYen: ToYen { .init() }
}

30.formatted(.toYen) // "¥3,000"
