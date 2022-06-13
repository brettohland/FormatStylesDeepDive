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

// MARK: - Date.FormatStyle.dateTime styles

twosday.formatted(.dateTime.day()) // "22"
twosday.formatted(.dateTime.dayOfYear()) // "53"
twosday.formatted(.dateTime.era()) // "AD"
twosday.formatted(.dateTime.hour()) // "2 AM"
twosday.formatted(.dateTime.minute()) // "22"
twosday.formatted(.dateTime.month()) // "Feb"
twosday.formatted(.dateTime.quarter()) // "Q1"
twosday.formatted(.dateTime.second()) // "22"
twosday.formatted(.dateTime.secondFraction(.fractional(2))) // "00"
twosday.formatted(.dateTime.secondFraction(.milliseconds(1))) // "8542000"
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

twosday.formatted(.dateTime.dayOfYear(.defaultDigits)) // "53"
twosday.formatted(.dateTime.dayOfYear(.threeDigits)) // "053"
twosday.formatted(.dateTime.dayOfYear(.twoDigits)) // "53"

twosday.formatted(.dateTime.era(.abbreviated)) // "AD"
twosday.formatted(.dateTime.era(.narrow)) // "A"
twosday.formatted(.dateTime.era(.wide)) // "Anno Domini"

twosday.formatted(.dateTime.hour(.conversationalDefaultDigits(amPM: .wide))) // "2 AM"
twosday.formatted(.dateTime.hour(.conversationalDefaultDigits(amPM: .narrow))) // "2 a"
twosday.formatted(.dateTime.hour(.conversationalDefaultDigits(amPM: .abbreviated))) // "2 AM"
twosday.formatted(.dateTime.hour(.conversationalDefaultDigits(amPM: .omitted))) // "02"
twosday.formatted(.dateTime.hour(.conversationalTwoDigits(amPM: .wide))) // "02 AM"
twosday.formatted(.dateTime.hour(.conversationalTwoDigits(amPM: .narrow))) // "02 a"
twosday.formatted(.dateTime.hour(.conversationalTwoDigits(amPM: .abbreviated))) // "02 AM"
twosday.formatted(.dateTime.hour(.conversationalTwoDigits(amPM: .omitted))) // "02"
twosday.formatted(.dateTime.hour(.defaultDigits(amPM: .wide))) // "2 AM"
twosday.formatted(.dateTime.hour(.defaultDigits(amPM: .narrow))) // "2 a"
twosday.formatted(.dateTime.hour(.defaultDigits(amPM: .abbreviated))) // "2 AM"
twosday.formatted(.dateTime.hour(.defaultDigits(amPM: .omitted))) // "02"
twosday.formatted(.dateTime.hour(.twoDigits(amPM: .wide))) // "02 AM"
twosday.formatted(.dateTime.hour(.twoDigits(amPM: .narrow))) // "02 a"
twosday.formatted(.dateTime.hour(.twoDigits(amPM: .abbreviated))) // "02 AM"
twosday.formatted(.dateTime.hour(.twoDigits(amPM: .omitted))) // "02"

twosday.formatted(.dateTime.minute(.twoDigits)) // "22"
twosday.formatted(.dateTime.minute(.defaultDigits)) // "22"

twosday.formatted(.dateTime.month(.defaultDigits)) // "2"
twosday.formatted(.dateTime.month(.twoDigits)) // "02"
twosday.formatted(.dateTime.month(.wide)) // "February"
twosday.formatted(.dateTime.month(.abbreviated)) // "Feb"
twosday.formatted(.dateTime.month(.narrow)) // "F"

twosday.formatted(.dateTime.quarter(.narrow)) // "1"
twosday.formatted(.dateTime.quarter(.abbreviated)) // "Q1"
twosday.formatted(.dateTime.quarter(.wide)) // "1st quarter"
twosday.formatted(.dateTime.quarter(.twoDigits)) // "01"
twosday.formatted(.dateTime.quarter(.oneDigit)) // "1"

twosday.formatted(.dateTime.second(.twoDigits)) // "22"
twosday.formatted(.dateTime.second(.defaultDigits)) // "22"

twosday.formatted(.dateTime.secondFraction(.fractional(2))) // "00"
twosday.formatted(.dateTime.secondFraction(.milliseconds(1))) // "8542000"

twosday.formatted(.dateTime.timeZone(.exemplarLocation)) // "Edmonton"
twosday.formatted(.dateTime.timeZone(.genericLocation)) // "Edmonton Time"
twosday.formatted(.dateTime.timeZone(.genericName(.long))) // "Mountain Time"
twosday.formatted(.dateTime.timeZone(.genericName(.short))) // "MT"
twosday.formatted(.dateTime.timeZone(.identifier(.short))) // "caedm"
twosday.formatted(.dateTime.timeZone(.identifier(.long))) // "America/Edmonton"
twosday.formatted(.dateTime.timeZone(.iso8601(.long))) // "-07:00"
twosday.formatted(.dateTime.timeZone(.iso8601(.short))) // "-07:00"
twosday.formatted(.dateTime.timeZone(.specificName(.short))) // "MST"
twosday.formatted(.dateTime.timeZone(.specificName(.long))) // "Mountain Standard Time"

twosday.formatted(.dateTime.week(.defaultDigits)) // "9"
twosday.formatted(.dateTime.week(.twoDigits)) // "09"
twosday.formatted(.dateTime.week(.weekOfMonth)) // "9"

twosday.formatted(.dateTime.weekday(.abbreviated)) // "Tue"
twosday.formatted(.dateTime.weekday(.twoDigits)) // "3"
twosday.formatted(.dateTime.weekday(.short)) // "Tu"
twosday.formatted(.dateTime.weekday(.oneDigit)) // "3"
twosday.formatted(.dateTime.weekday(.wide)) // "Tuesday"
twosday.formatted(.dateTime.weekday(.narrow)) // "T"

twosday.formatted(.dateTime.year(.twoDigits)) // "22"
twosday.formatted(.dateTime.year(.defaultDigits)) // "2022"
twosday.formatted(.dateTime.year(.extended())) // "22"
twosday.formatted(.dateTime.year(.extended(minimumLength: 2))) // "2022"
twosday.formatted(.dateTime.year(.padded(10))) // "0000002022"
twosday.formatted(.dateTime.year(.relatedGregorian())) // "2022"
twosday.formatted(.dateTime.year(.relatedGregorian(minimumLength: 2))) // "22"

// MARK: - Setting Locale

let franceLocale = Locale(identifier: "fr_FR")
twosday.formatted(.dateTime.year().month().day().hour().minute().second().locale(franceLocale)) // "22 févr. 2022 à 02:22:22"

// MARK: - Attributed String Output

twosday.formatted(.dateTime.hour().minute().attributed)

// MARK: - Initializing

let frenchStyle = Date.FormatStyle()
    .year(.twoDigits)
    .month(.twoDigits)
    .weekday(.wide)
    .day(.twoDigits)
    .hour(.twoDigits(amPM: .wide))
    .locale(Locale(identifier: "fr_FR"))

twosday.formatted(frenchStyle) // "mardi 22/02/22 à 02 h"
frenchStyle.format(twosday) // "mardi 22/02/22 à 02 h"
