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

let style = Date.FormatStyle()
    .day()
    .month()
    .year()
    .hour()
    .minute()
    .second()

twosday.formatted(style) // "Feb 22, 2022, 2:22:22 AM"

// Era
twosday.formatted(Date.FormatStyle().era()) // ""
twosday.formatted(Date.FormatStyle().era(.abbreviated)) // ""
twosday.formatted(Date.FormatStyle().era(.narrow)) // ""
twosday.formatted(Date.FormatStyle().era(.wide)) // ""

// Year
twosday.formatted(Date.FormatStyle().year()) // ""
twosday.formatted(Date.FormatStyle().year(.defaultDigits)) // ""
twosday.formatted(Date.FormatStyle().year(.twoDigits)) // ""
twosday.formatted(Date.FormatStyle().year(.extended())) // ""
twosday.formatted(Date.FormatStyle().year(.extended(minimumLength: 5))) // ""
twosday.formatted(Date.FormatStyle().year(.padded(5))) // ""
twosday.formatted(Date.FormatStyle().year(.relatedGregorian())) // ""
twosday.formatted(Date.FormatStyle().year(.relatedGregorian(minimumLength: 5))) // ""

// Quarter
twosday.formatted(Date.FormatStyle().quarter()) // ""
twosday.formatted(Date.FormatStyle().quarter(.twoDigits)) // ""
twosday.formatted(Date.FormatStyle().quarter(.wide)) // ""
twosday.formatted(Date.FormatStyle().quarter(.narrow)) // ""
twosday.formatted(Date.FormatStyle().quarter(.abbreviated)) // ""
twosday.formatted(Date.FormatStyle().quarter(.oneDigit)) // ""

// Month
twosday.formatted(Date.FormatStyle().month()) // ""
twosday.formatted(Date.FormatStyle().month(.defaultDigits)) // ""
twosday.formatted(Date.FormatStyle().month(.abbreviated)) // ""
twosday.formatted(Date.FormatStyle().month(.narrow)) // ""
twosday.formatted(Date.FormatStyle().month(.wide)) // ""
twosday.formatted(Date.FormatStyle().month(.twoDigits)) // ""

// Week
twosday.formatted(Date.FormatStyle().week()) // ""
twosday.formatted(Date.FormatStyle().week(.defaultDigits)) // ""
twosday.formatted(Date.FormatStyle().week(.twoDigits)) // ""
twosday.formatted(Date.FormatStyle().week(.weekOfMonth)) // ""

// Day
twosday.formatted(Date.FormatStyle().day()) // 22 // ""
twosday.formatted(Date.FormatStyle().day(.defaultDigits)) // 22 // ""
twosday.formatted(Date.FormatStyle().day(.ordinalOfDayInMonth)) // 4 // ""
twosday.formatted(Date.FormatStyle().day(.twoDigits)) // 22 // ""
twosday.formatted(Date.FormatStyle().day(.julianModified())) // "2459633" // ""
twosday.formatted(Date.FormatStyle().day(.julianModified(minimumLength: 8))) // "02459633" // ""

// Day of Year
twosday.formatted(Date.FormatStyle().dayOfYear()) // ""
twosday.formatted(Date.FormatStyle().dayOfYear(.defaultDigits)) // ""
twosday.formatted(Date.FormatStyle().dayOfYear(.twoDigits)) // ""
twosday.formatted(Date.FormatStyle().dayOfYear(.threeDigits)) // ""

// Weekday
twosday.formatted(Date.FormatStyle().weekday()) // ""
twosday.formatted(Date.FormatStyle().weekday(.wide)) // ""
twosday.formatted(Date.FormatStyle().weekday(.narrow)) // ""
twosday.formatted(Date.FormatStyle().weekday(.abbreviated)) // ""
twosday.formatted(Date.FormatStyle().weekday(.short)) // ""
twosday.formatted(Date.FormatStyle().weekday(.twoDigits)) // ""
twosday.formatted(Date.FormatStyle().weekday(.oneDigit)) // ""

// Hour
twosday.formatted(Date.FormatStyle().hour()) // ""
twosday.formatted(Date.FormatStyle().hour(.twoDigits(amPM: .wide))) // ""
twosday.formatted(Date.FormatStyle().hour(.twoDigits(amPM: .narrow))) // ""
twosday.formatted(Date.FormatStyle().hour(.twoDigits(amPM: .omitted))) // ""
twosday.formatted(Date.FormatStyle().hour(.twoDigits(amPM: .abbreviated))) // ""
twosday.formatted(Date.FormatStyle().hour(.defaultDigits(amPM: .wide))) // ""
twosday.formatted(Date.FormatStyle().hour(.defaultDigits(amPM: .narrow))) // ""
twosday.formatted(Date.FormatStyle().hour(.defaultDigits(amPM: .omitted))) // ""
twosday.formatted(Date.FormatStyle().hour(.defaultDigits(amPM: .abbreviated))) // ""
twosday.formatted(Date.FormatStyle().hour(.conversationalDefaultDigits(amPM: .wide))) // ""
twosday.formatted(Date.FormatStyle().hour(.conversationalDefaultDigits(amPM: .narrow))) // ""
twosday.formatted(Date.FormatStyle().hour(.conversationalDefaultDigits(amPM: .omitted))) // ""
twosday.formatted(Date.FormatStyle().hour(.conversationalDefaultDigits(amPM: .abbreviated))) // ""
twosday.formatted(Date.FormatStyle().hour(.conversationalTwoDigits(amPM: .wide))) // ""
twosday.formatted(Date.FormatStyle().hour(.conversationalTwoDigits(amPM: .narrow))) // ""
twosday.formatted(Date.FormatStyle().hour(.conversationalTwoDigits(amPM: .omitted))) // ""
twosday.formatted(Date.FormatStyle().hour(.conversationalTwoDigits(amPM: .abbreviated))) // ""

// Minute
twosday.formatted(Date.FormatStyle().minute()) // ""
twosday.formatted(Date.FormatStyle().minute(.defaultDigits)) // ""
twosday.formatted(Date.FormatStyle().minute(.twoDigits)) // ""

// Second
twosday.formatted(Date.FormatStyle().second()) // ""
twosday.formatted(Date.FormatStyle().second(.twoDigits)) // ""
twosday.formatted(Date.FormatStyle().second(.defaultDigits)) // ""

// Fractional Second
twosday.formatted(Date.FormatStyle().secondFraction(.fractional(10))) // ""
twosday.formatted(Date.FormatStyle().secondFraction(.milliseconds(10))) // ""

// Time Zone
twosday.formatted(Date.FormatStyle().timeZone()) // ""
twosday.formatted(Date.FormatStyle().timeZone(.exemplarLocation)) // ""
twosday.formatted(Date.FormatStyle().timeZone(.genericLocation)) // ""
twosday.formatted(Date.FormatStyle().timeZone(.genericName(.short))) // ""
twosday.formatted(Date.FormatStyle().timeZone(.genericName(.long))) // ""
twosday.formatted(Date.FormatStyle().timeZone(.identifier(.short))) // ""
twosday.formatted(Date.FormatStyle().timeZone(.identifier(.long))) // ""
twosday.formatted(Date.FormatStyle().timeZone(.iso8601(.short))) // ""
twosday.formatted(Date.FormatStyle().timeZone(.iso8601(.long))) // ""
twosday.formatted(Date.FormatStyle().timeZone(.localizedGMT(.short))) // ""
twosday.formatted(Date.FormatStyle().timeZone(.localizedGMT(.long))) // ""
twosday.formatted(Date.FormatStyle().timeZone(.specificName(.short))) // ""
twosday.formatted(Date.FormatStyle().timeZone(.specificName(.long))) // ""

// Locale
twosday.formatted(Date.FormatStyle().locale(Locale(identifier: "fr_FR"))) // ""

// Attributed String Output
twosday.formatted(Date.FormatStyle().attributed) // ""

// Parsing
let dateString = "Feb 22, 2022, 2:22:22 AM"

let dateStyle = Date.FormatStyle()
    .day()
    .month()
    .year()
    .hour()
    .minute()
    .second()

try? dateStyle.parse(dateString)
try? Date(dateString, strategy: dateStyle.parseStrategy)
