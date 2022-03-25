import Foundation

// MARK: - Setup

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

// MARK: - The Basics

twosday.formatted() // "2/22/2022, 2:22 AM"

// MARK: - DateStyle

twosday.formatted(date: .abbreviated, time: .omitted) // "Feb 22, 2022"
twosday.formatted(date: .complete, time: .omitted) // "Tuesday, February 22, 2022"
twosday.formatted(date: .long, time: .omitted) // "February 22, 2022"
twosday.formatted(date: .numeric, time: .omitted) // "2/22/2022"

// MARK: - TimeStyle

twosday.formatted(date: .omitted, time: .complete) // "2:22:22 AM MST"
twosday.formatted(date: .omitted, time: .shortened) // "2:22 AM"
twosday.formatted(date: .omitted, time: .standard) // "2:22:22 AM"

// MARK: - DateStyle & TimeStyle

twosday.formatted(date: .abbreviated, time: .complete) // "Feb 22, 2022, 2:22:22 AM MST"
twosday.formatted(date: .abbreviated, time: .shortened) // "Feb 22, 2022, 2:22 AM"
twosday.formatted(date: .abbreviated, time: .standard) // "Feb 22, 2022, 2:22:22 AM"
twosday.formatted(date: .complete, time: .complete) // "Tuesday, February 22, 2022, 2:22:22 AM MST"
twosday.formatted(date: .complete, time: .shortened) // "Tuesday, February 22, 2022, 2:22 AM"
twosday.formatted(date: .complete, time: .standard) // "Tuesday, February 22, 2022, 2:22:22 AM"
twosday.formatted(date: .long, time: .complete) // "February 22, 2022, 2:22:22 AM MST"
twosday.formatted(date: .long, time: .shortened) // "February 22, 2022, 2:22 AM"
twosday.formatted(date: .long, time: .standard) // "February 22, 2022, 2:22:22 AM"
twosday.formatted(date: .numeric, time: .complete) // "2/22/2022, 2:22:22 AM MST"
twosday.formatted(date: .numeric, time: .shortened) // "2/22/2022, 2:22 AM"
twosday.formatted(date: .numeric, time: .standard) // "2/22/2022, 2:22:22 AM"

// MARK: - Custom Date.FormatStyle

let frenchHebrew = Date.FormatStyle(
    date: .complete,
    time: .complete,
    locale: Locale(identifier: "fr_FR"),
    calendar: Calendar(identifier: .hebrew),
    timeZone: TimeZone(secondsFromGMT: 0)!,
    capitalizationContext: .standalone
)

twosday.formatted(frenchHebrew) // "Mardi 22 février 2022 ap. J.-C. 9:22:22 UTC"
frenchHebrew.format(twosday) // "Mardi 22 février 2022 ap. J.-C. 9:22:22 UTC"

// MARK: - Custom Date.FormatStyle wrapped in custom FormatStyle extension

struct FrenchHebrewStyle: FormatStyle {
    typealias FormatInput = Date
    typealias FormatOutput = String

    static let frenchHebrew = Date.FormatStyle(
        date: .complete,
        time: .complete,
        locale: Locale(identifier: "fr_FR"),
        calendar: Calendar(identifier: .hebrew),
        timeZone: TimeZone(secondsFromGMT: 0)!,
        capitalizationContext: .standalone
    )

    func format(_ value: Date) -> String {
        FrenchHebrewStyle.frenchHebrew.format(value)
    }
}

extension FormatStyle where Self == FrenchHebrewStyle {
    static var frenchHebrew: FrenchHebrewStyle { .init() }
}

twosday.formatted(.frenchHebrew) // "Mardi 22 février 2022 ap. J.-C. 9:22:22 UTC"
