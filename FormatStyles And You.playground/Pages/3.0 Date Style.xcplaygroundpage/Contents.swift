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

// Order when method chaining doesn't matter to final display

twosday.formatted(
    Date.FormatStyle().year().month().day().hour().minute().second()
) // "Feb 22, 2022, 2:22:22 AM"

twosday.formatted(
    Date.FormatStyle().second().minute().hour().day().month().year()
) // "Feb 22, 2022, 2:22:22 AM"

twosday.formatted(
    .dateTime.year().month().day().hour().minute().second()
) // "Feb 22, 2022, 2:22:22 AM"
twosday.formatted(
    .dateTime.second().minute().hour().day().month().year()
) // "Feb 22, 2022, 2:22:22 AM"

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

twosday.formatted(Date.FormatStyle().day()) // "22"
twosday.formatted(Date.FormatStyle().dayOfYear()) // "53"
twosday.formatted(Date.FormatStyle().era()) // "AD"
twosday.formatted(Date.FormatStyle().hour()) // "2 AM"
twosday.formatted(Date.FormatStyle().minute()) // "22"
twosday.formatted(Date.FormatStyle().month()) // "Feb"
twosday.formatted(Date.FormatStyle().quarter()) // "Q1"
twosday.formatted(Date.FormatStyle().second()) // "22"
twosday.formatted(Date.FormatStyle().secondFraction(.fractional(2))) // "00"
twosday.formatted(Date.FormatStyle().secondFraction(.milliseconds(1))) // "8542000"
twosday.formatted(Date.FormatStyle().timeZone()) // "MST"
twosday.formatted(Date.FormatStyle().week()) // "9"
twosday.formatted(Date.FormatStyle().weekday()) // "Tue"
twosday.formatted(Date.FormatStyle().year()) // "2022"

// Era
twosday.formatted(.dateTime.era(.abbreviated)) // "AD"
twosday.formatted(.dateTime.era(.narrow)) // "A"
twosday.formatted(.dateTime.era(.wide)) // "Anno Domini"

twosday.formatted(Date.FormatStyle().era(.abbreviated)) // "AD"
twosday.formatted(Date.FormatStyle().era(.narrow)) // "A"
twosday.formatted(Date.FormatStyle().era(.wide)) // "Anno Domini"

// Year
twosday.formatted(.dateTime.year(.twoDigits)) // "22"
twosday.formatted(.dateTime.year(.defaultDigits)) // "2022"
twosday.formatted(.dateTime.year(.extended())) // "22"
twosday.formatted(.dateTime.year(.extended(minimumLength: 2))) // "2022"
twosday.formatted(.dateTime.year(.padded(10))) // "0000002022"
twosday.formatted(.dateTime.year(.relatedGregorian())) // "2022"
twosday.formatted(.dateTime.year(.relatedGregorian(minimumLength: 2))) // "22"

twosday.formatted(Date.FormatStyle().year(.twoDigits)) // "22"
twosday.formatted(Date.FormatStyle().year(.defaultDigits)) // "2022"
twosday.formatted(Date.FormatStyle().year(.extended())) // "22"
twosday.formatted(Date.FormatStyle().year(.extended(minimumLength: 2))) // "2022"
twosday.formatted(Date.FormatStyle().year(.padded(10))) // "0000002022"
twosday.formatted(Date.FormatStyle().year(.relatedGregorian())) // "2022"
twosday.formatted(Date.FormatStyle().year(.relatedGregorian(minimumLength: 2))) // "22"

// Quarter
twosday.formatted(.dateTime.quarter(.narrow)) // "1"
twosday.formatted(.dateTime.quarter(.abbreviated)) // "Q1"
twosday.formatted(.dateTime.quarter(.wide)) // "1st quarter"
twosday.formatted(.dateTime.quarter(.twoDigits)) // "01"
twosday.formatted(.dateTime.quarter(.oneDigit)) // "1"

twosday.formatted(Date.FormatStyle().quarter(.narrow)) // "1"
twosday.formatted(Date.FormatStyle().quarter(.abbreviated)) // "Q1"
twosday.formatted(Date.FormatStyle().quarter(.wide)) // "1st quarter"
twosday.formatted(Date.FormatStyle().quarter(.twoDigits)) // "01"
twosday.formatted(Date.FormatStyle().quarter(.oneDigit)) // "1"

// Month
twosday.formatted(.dateTime.month(.defaultDigits)) // "2"
twosday.formatted(.dateTime.month(.twoDigits)) // "02"
twosday.formatted(.dateTime.month(.wide)) // "February"
twosday.formatted(.dateTime.month(.abbreviated)) // "Feb"
twosday.formatted(.dateTime.month(.narrow)) // "F"

twosday.formatted(Date.FormatStyle().month(.defaultDigits)) // "2"
twosday.formatted(Date.FormatStyle().month(.twoDigits)) // "02"
twosday.formatted(Date.FormatStyle().month(.wide)) // "February"
twosday.formatted(Date.FormatStyle().month(.abbreviated)) // "Feb"
twosday.formatted(Date.FormatStyle().month(.narrow)) // "F"

// Week
twosday.formatted(.dateTime.week(.defaultDigits)) // "9"
twosday.formatted(.dateTime.week(.twoDigits)) // "09"
twosday.formatted(.dateTime.week(.weekOfMonth)) // "9"

twosday.formatted(Date.FormatStyle().week(.defaultDigits)) // "9"
twosday.formatted(Date.FormatStyle().week(.twoDigits)) // "09"
twosday.formatted(Date.FormatStyle().week(.weekOfMonth)) // "9"

// Day
twosday.formatted(.dateTime.day(.twoDigits)) // "22"
twosday.formatted(.dateTime.day(.ordinalOfDayInMonth)) // "4"
twosday.formatted(.dateTime.day(.defaultDigits)) // "22"
twosday.formatted(.dateTime.day(.julianModified())) // "2459633"
twosday.formatted(.dateTime.day(.julianModified(minimumLength: 8))) // "02459633"

twosday.formatted(Date.FormatStyle().day(.twoDigits)) // "22"
twosday.formatted(Date.FormatStyle().day(.ordinalOfDayInMonth)) // "4"
twosday.formatted(Date.FormatStyle().day(.defaultDigits)) // "22"
twosday.formatted(Date.FormatStyle().day(.julianModified())) // "2459633"
twosday.formatted(Date.FormatStyle().day(.julianModified(minimumLength: 8))) // "02459633"

// Day of Year
twosday.formatted(.dateTime.dayOfYear(.defaultDigits)) // "53"
twosday.formatted(.dateTime.dayOfYear(.threeDigits)) // "053"
twosday.formatted(.dateTime.dayOfYear(.twoDigits)) // "53"

twosday.formatted(Date.FormatStyle().dayOfYear(.defaultDigits)) // "53"
twosday.formatted(Date.FormatStyle().dayOfYear(.threeDigits)) // "053"
twosday.formatted(Date.FormatStyle().dayOfYear(.twoDigits)) // "53"

// Weekday
twosday.formatted(.dateTime.weekday(.abbreviated)) // "Tue"
twosday.formatted(.dateTime.weekday(.twoDigits)) // "3"
twosday.formatted(.dateTime.weekday(.short)) // "Tu"
twosday.formatted(.dateTime.weekday(.oneDigit)) // "3"
twosday.formatted(.dateTime.weekday(.wide)) // "Tuesday"
twosday.formatted(.dateTime.weekday(.narrow)) // "T"

twosday.formatted(Date.FormatStyle().weekday(.abbreviated)) // "Tue"
twosday.formatted(Date.FormatStyle().weekday(.twoDigits)) // "3"
twosday.formatted(Date.FormatStyle().weekday(.short)) // "Tu"
twosday.formatted(Date.FormatStyle().weekday(.oneDigit)) // "3"
twosday.formatted(Date.FormatStyle().weekday(.wide)) // "Tuesday"
twosday.formatted(Date.FormatStyle().weekday(.narrow)) // "T"

// Hour
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

twosday.formatted(Date.FormatStyle().hour(.conversationalDefaultDigits(amPM: .wide))) // "2 AM"
twosday.formatted(Date.FormatStyle().hour(.conversationalDefaultDigits(amPM: .narrow))) // "2 a"
twosday.formatted(Date.FormatStyle().hour(.conversationalDefaultDigits(amPM: .abbreviated))) // "2 AM"
twosday.formatted(Date.FormatStyle().hour(.conversationalDefaultDigits(amPM: .omitted))) // "02"
twosday.formatted(Date.FormatStyle().hour(.conversationalTwoDigits(amPM: .wide))) // "02 AM"
twosday.formatted(Date.FormatStyle().hour(.conversationalTwoDigits(amPM: .narrow))) // "02 a"
twosday.formatted(Date.FormatStyle().hour(.conversationalTwoDigits(amPM: .abbreviated))) // "02 AM"
twosday.formatted(Date.FormatStyle().hour(.conversationalTwoDigits(amPM: .omitted))) // "02"
twosday.formatted(Date.FormatStyle().hour(.defaultDigits(amPM: .wide))) // "2 AM"
twosday.formatted(Date.FormatStyle().hour(.defaultDigits(amPM: .narrow))) // "2 a"
twosday.formatted(Date.FormatStyle().hour(.defaultDigits(amPM: .abbreviated))) // "2 AM"
twosday.formatted(Date.FormatStyle().hour(.defaultDigits(amPM: .omitted))) // "02"
twosday.formatted(Date.FormatStyle().hour(.twoDigits(amPM: .wide))) // "02 AM"
twosday.formatted(Date.FormatStyle().hour(.twoDigits(amPM: .narrow))) // "02 a"
twosday.formatted(Date.FormatStyle().hour(.twoDigits(amPM: .abbreviated))) // "02 AM"
twosday.formatted(Date.FormatStyle().hour(.twoDigits(amPM: .omitted))) // "02"

// Minute
twosday.formatted(.dateTime.minute(.twoDigits)) // "22"
twosday.formatted(.dateTime.minute(.defaultDigits)) // "22"

twosday.formatted(Date.FormatStyle().minute(.twoDigits)) // "22"
twosday.formatted(Date.FormatStyle().minute(.defaultDigits)) // "22"

// Second
twosday.formatted(.dateTime.second(.twoDigits)) // "22"
twosday.formatted(.dateTime.second(.defaultDigits)) // "22"

twosday.formatted(Date.FormatStyle().second(.twoDigits)) // "22"
twosday.formatted(Date.FormatStyle().second(.defaultDigits)) // "22"

// Fractional Second
twosday.formatted(Date.FormatStyle().secondFraction(.fractional(2))) // "00"
twosday.formatted(Date.FormatStyle().secondFraction(.milliseconds(1))) // "8542000"

twosday.formatted(.dateTime.secondFraction(.fractional(2))) // "00"
twosday.formatted(.dateTime.secondFraction(.milliseconds(1))) // "8542000"

// Time Zone
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
twosday.formatted(.dateTime.timeZone(.localizedGMT(.short))) // "GMT-7"
twosday.formatted(.dateTime.timeZone(.localizedGMT(.long))) // "GMT-07:00"

twosday.formatted(Date.FormatStyle().timeZone(.exemplarLocation)) // "Edmonton"
twosday.formatted(Date.FormatStyle().timeZone(.genericLocation)) // "Edmonton Time"
twosday.formatted(Date.FormatStyle().timeZone(.genericName(.long))) // "Mountain Time"
twosday.formatted(Date.FormatStyle().timeZone(.genericName(.short))) // "MT"
twosday.formatted(Date.FormatStyle().timeZone(.identifier(.short))) // "caedm"
twosday.formatted(Date.FormatStyle().timeZone(.identifier(.long))) // "America/Edmonton"
twosday.formatted(Date.FormatStyle().timeZone(.iso8601(.long))) // "-07:00"
twosday.formatted(Date.FormatStyle().timeZone(.iso8601(.short))) // "-07:00"
twosday.formatted(Date.FormatStyle().timeZone(.specificName(.short))) // "MST"
twosday.formatted(Date.FormatStyle().timeZone(.specificName(.long))) // "Mountain Standard Time"
twosday.formatted(Date.FormatStyle().timeZone(.localizedGMT(.short))) // "GMT-7"
twosday.formatted(Date.FormatStyle().timeZone(.localizedGMT(.long))) // "GMT-07:00"

// Locale
twosday.formatted(.dateTime.locale(Locale(identifier: "fr_FR"))) // "22/02/2022 à 2:22"
twosday.formatted(Date.FormatStyle().locale(Locale(identifier: "fr_FR"))) // "22/02/2022 à 2:22"

// Attributed String Output
twosday.formatted(.dateTime.attributed)
twosday.formatted(Date.FormatStyle().attributed)

// MARK: - Parsing
let dateString = "Feb 22, 2022, 2:22:22 AM"

let dateStyle = Date.FormatStyle()
    .day()
    .month()
    .year()
    .hour()
    .minute()
    .second()

try? dateStyle.parse(dateString) // Feb 22, 2022 at 2:22 AM
try? Date(dateString, strategy: dateStyle.parseStrategy) // Feb 22, 2022 at 2:22 AM
