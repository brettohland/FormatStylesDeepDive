//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

let twosdayDateComponents = DateComponents(
    year: 2022,
    month: 2,
    day: 22,
    hour: 2,
    minute: 22,
    second: 22,
    nanosecond: 22
)
let twosday = Calendar(identifier: .gregorian).date(from: twosdayDateComponents)!

twosday.formatted(
    .verbatim(
        "\(hour: .defaultDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .defaultDigits):\(minute: .defaultDigits) \(dayPeriod: .standard(.wide))",
        locale: Locale(identifier: "zh_CN"),
        timeZone: .current,
        calendar: .current
    )
) // "2:22:22 上午"

