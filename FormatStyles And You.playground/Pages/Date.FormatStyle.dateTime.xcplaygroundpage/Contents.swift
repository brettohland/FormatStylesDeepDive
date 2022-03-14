//: [Previous](@previous)

import Foundation

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

let verbatim = Date.VerbatimFormatStyle(
    format: "\(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .twoDigits)",
    timeZone: TimeZone.current,
    calendar: .current
)
verbatim.format(twosday) // "02:22"

// MARK: - Date.FormatStyle.dateTime styles

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

// MARK: - Customizing individual units

twosday.formatted(.dateTime.day(.twoDigits)) // "22"
twosday.formatted(.dateTime.day(.ordinalOfDayInMonth)) // "4"
twosday.formatted(.dateTime.day(.defaultDigits)) // "22"

// MARK: - Setting Locale

let franceLocale = Locale(identifier: "fr_FR")
twosday.formatted(.dateTime.year().month().day().hour().minute().second().locale(franceLocale)) // "22 févr. 2022 à 02:22:22"

//: [Next](@next)
