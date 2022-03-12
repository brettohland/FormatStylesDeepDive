//: [Previous](@previous)

import Foundation


struct ToYen: FormatStyle {
    typealias FormatInput = Int
    typealias FormatOutput = String

    func format(_ value: Int) -> String {
        Decimal(value * 100).formatted(.currency(code: "jpy"))
    }
}

// There has to be a better way
30.formatted(ToYen())

//extension FormatStyle where Self == ToYen {
//    static var toYen: ToYen { .init() }
//}
//
//30.formatted(.toYen)
//
