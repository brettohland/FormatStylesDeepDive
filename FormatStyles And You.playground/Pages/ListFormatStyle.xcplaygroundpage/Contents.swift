//: [Previous](@previous)

import Foundation

let letters = ["a", "b", "c", "d"]

// MARK: - ListFormatStyle

letters.formatted()

letters.formatted(.list(type: .and)) // "a, b, c, and d"
letters.formatted(.list(type: .or))  // "a, b, c, or d"

letters.formatted(.list(type: .and, width: .narrow))   // "a, b, c, d"
letters.formatted(.list(type: .and, width: .standard)) // "a, b, c, and d"
letters.formatted(.list(type: .and, width: .short))    // "a, b, c, & d"

letters.formatted(.list(type: .or, width: .narrow))   // "a, b, c, or d"
letters.formatted(.list(type: .or, width: .standard)) // "a, b, c, or d"
letters.formatted(.list(type: .or, width: .short))    // "a, b, c, or d"

// MARK: Set Locale

let franceLocale = Locale(identifier: "fr_FR")

letters.formatted(.list(type: .and).locale(franceLocale)) // "a, b, c, et d"
letters.formatted(.list(type: .or).locale(franceLocale))  // "a, b, c, ou d"

letters.formatted(.list(type: .and, width: .narrow).locale(franceLocale))   // "a, b, c, d"
letters.formatted(.list(type: .and, width: .standard).locale(franceLocale)) // "a, b, c, et d"
letters.formatted(.list(type: .and, width: .short).locale(franceLocale))    // "a, b, c, et d"

letters.formatted(.list(type: .or, width: .narrow).locale(franceLocale))   // "a, b, c, ou d"
letters.formatted(.list(type: .or, width: .standard).locale(franceLocale)) // "a, b, c, ou d"
letters.formatted(.list(type: .or, width: .short).locale(franceLocale))    // "a, b, c, ou d"

let importantDates = [
    Date(timeIntervalSinceReferenceDate: 0),
    Date(timeIntervalSince1970: 0)
]

let yearOnlyFormat = Date.FormatStyle.dateTime.year()

importantDates.formatted(.list(memberStyle: yearOnlyFormat, type: .and)) // "2000 and 1969"
importantDates.formatted(.list(memberStyle: yearOnlyFormat, type: .or))  // "2000 or 1969"

importantDates.formatted(.list(memberStyle: yearOnlyFormat, type: .and, width: .standard)) // "2000 and 1969"
importantDates.formatted(.list(memberStyle: yearOnlyFormat, type: .and, width: .narrow))   // "2000, 1969"
importantDates.formatted(.list(memberStyle: yearOnlyFormat, type: .and, width: .short))    // "2000 & 1969"

importantDates.formatted(.list(memberStyle: yearOnlyFormat, type: .or, width: .standard)) // "2000 or 1969"
importantDates.formatted(.list(memberStyle: yearOnlyFormat, type: .or, width: .narrow))   // "2000 or 1969"
importantDates.formatted(.list(memberStyle: yearOnlyFormat, type: .or, width: .short))    // "2000 or 1969"

let yearStyle = ListFormatStyle<Date.FormatStyle, Array<Date>>.init(memberStyle: .dateTime.year())
importantDates.formatted(yearStyle)

//: [Next](@next)
