import SwiftUI
import UIKit

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

// MARK: - Components

twosday.formatted(.dateTime.day()) // "22"
twosday.formatted(.dateTime.dayOfYear()) // "53"
twosday.formatted(.dateTime.era()) // "AD"
twosday.formatted(.dateTime.hour()) // "2 AM"
twosday.formatted(.dateTime.minute()) // "22"
twosday.formatted(.dateTime.month()) // "Feb"
twosday.formatted(.dateTime.quarter()) // "Q1"
twosday.formatted(.dateTime.second()) // "22"
twosday.formatted(.dateTime.timeZone()) // "MST"
twosday.formatted(.dateTime.week()) // "9"
twosday.formatted(.dateTime.weekday()) // "Tue"
twosday.formatted(.dateTime.year()) // "2022"

// MARK: - Compositing

twosday.formatted(.dateTime.year().month().day().hour().minute().second()) // "Feb 22, 2022, 2:22:22 AM"
twosday.formatted(.dateTime.second().minute().hour().day().month().year()) // "Feb 22, 2022, 2:22:22 AM"

// MARK: - Formatting Individual Components

twosday.formatted(.dateTime.day(.twoDigits)) // "22"
twosday.formatted(.dateTime.day(.ordinalOfDayInMonth)) // "4"
twosday.formatted(.dateTime.day(.defaultDigits)) // "22"

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

// MARK: - Custom FormatStyle

/// Returns the date in the most useless way ever
struct ReversedDateFormat: FormatStyle {
    typealias FormatInput = Date
    typealias FormatOutput = String

    func format(_ value: Date) -> String {
        "\(value.formatted(.dateTime.second())):" +
            "\(value.formatted(.dateTime.minute())):" +
            "\(value.formatted(.dateTime.hour())) " +
            "\(value.formatted(.dateTime.day())) " +
            "\(value.formatted(.dateTime.month())) " +
            "\(value.formatted(.dateTime.year())) "
    }
}

extension FormatStyle where Self == ReversedDateFormat {
    static var reversedDate: ReversedDateFormat { .init() }
}

twosday.formatted(.reversedDate) // "22:22:2 AM 22 Feb 2022"
