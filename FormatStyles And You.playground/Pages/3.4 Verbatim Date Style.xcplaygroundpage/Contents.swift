import Foundation

// MARK: - Date.VerbatimFormatStyle

let twosdayDateComponents = DateComponents(
    year: 2022,
    month: 2,
    day: 22,
    hour: 22,
    minute: 22,
    second: 22,
    nanosecond: 22
)
let twosday = Calendar(identifier: .gregorian).date(from: twosdayDateComponents)!

let verbatim = Date.VerbatimFormatStyle(
    format: "Today is Twoesday \(month: .defaultDigits) \(day: .defaultDigits) \(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .twoDigits)",
    timeZone: TimeZone.current,
    calendar: .current
)

verbatim.format(twosday) // "Today is 02:22 otherwise known as "Twosday""

twosday.formatted(
    .verbatim(
        "Today is \(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .twoDigits) otherwise known as \"Twosday\"",
        locale: Locale(identifier: "zh_CN"),
        timeZone: .current,
        calendar: .current
    )
) // "Today is 02:22 otherwise known as "Twosday""

twosday.formatted(verbatim.attributed)

// Note: These are grouped due to the fact that outputting everything in one string causes the output to be an empty string

let groupOne = Date.FormatString("""
Cyclic Year
.abbreviated: \(cyclicYear: .abbreviated)
.narrow: \(cyclicYear: .narrow)
.wide: \(cyclicYear: .wide)

Day
.defaultDigits: \(day: .defaultDigits)
.julianModified: \(day: .julianModified())x
.julianModified(minimumLength: 2): \(day: .julianModified(minimumLength: 2))
.ordinalOfDayInMonth: \(day: .ordinalOfDayInMonth)
.twoDigits: \(day: .twoDigits)

Day of Year
.defaultDigits: \(dayOfYear: .defaultDigits)
.threeDigits: \(dayOfYear: .threeDigits)
.twoDigits: \(dayOfYear: .twoDigits)

Day Period
.conversational(.abbreviated)): \(dayPeriod: .conversational(.abbreviated))
.conversational(.narrow)): \(dayPeriod: .conversational(.narrow))
.conversational(.wide)): \(dayPeriod: .conversational(.wide))
.standard(.abbreviated)): \(dayPeriod: .standard(.abbreviated))
.standard(.narrow)): \(dayPeriod: .standard(.narrow))
.standard(.wide)): \(dayPeriod: .standard(.wide))
.with12s(.abbreviated)): \(dayPeriod: .with12s(.abbreviated))
.with12s(.narrow)): \(dayPeriod: .with12s(.narrow))
.with12s(.wide)): \(dayPeriod: .with12s(.wide))

Era
.abbreviated: \(era: .abbreviated)
.narrow: \(era: .narrow)
.wide: \(era: .wide)

Hour
.defaultDigits(clock: .twelveHour, hourCycle: .oneBased)): \(hour: .defaultDigits(clock: .twelveHour, hourCycle: .oneBased))
.defaultDigits(clock: .twelveHour, hourCycle: .zeroBased)): \(hour: .defaultDigits(clock: .twelveHour, hourCycle: .zeroBased))
.defaultDigits(clock: .twentyFourHour, hourCycle: .oneBased)): \(hour: .defaultDigits(clock: .twentyFourHour, hourCycle: .oneBased))
.defaultDigits(clock: .twentyFourHour, hourCycle: .zeroBased)): \(hour: .defaultDigits(clock: .twentyFourHour, hourCycle: .zeroBased))

Minute
.defaultDigits: \(minute: .defaultDigits)
.twoDigits: \(minute: .twoDigits)

Month
.abbreviated: \(month: .abbreviated)
.defaultDigits: \(month: .defaultDigits)
.narrow: \(month: .narrow)
.twoDigits: \(month: .twoDigits)
.wide: \(month: .wide)
""")

let groupTwo = Date.FormatString("""
Second
.defaultDigits: \(second: .defaultDigits)
.twoDigits: \(second: .twoDigits)

Second Fraction
.fractional(10)): \(secondFraction: .fractional(10))
.milliseconds(10)): \(secondFraction: .milliseconds(10))

Standalone Month
.abbreviated: \(standaloneMonth: .abbreviated)
.defaultDigits: \(standaloneMonth: .defaultDigits)
.narrow: \(standaloneMonth: .narrow)
.twoDigits: \(standaloneMonth: .twoDigits)
.wide: \(standaloneMonth: .wide)
""")

let groupThree = Date.FormatString("""
Standalone Quarter
.abbreviated: \(standaloneQuarter: .abbreviated)
.narrow: \(standaloneQuarter: .narrow)
.oneDigit: \(standaloneQuarter: .oneDigit)
.twoDigits: \(standaloneQuarter: .twoDigits)
.wide: \(standaloneQuarter: .wide)

Standalone Weekday
.abbreviated: \(standaloneWeekday: .abbreviated)
.narrow: \(standaloneWeekday: .narrow)
.oneDigit: \(standaloneWeekday: .oneDigit)
.short: \(standaloneWeekday: .short)
.wide: \(standaloneWeekday: .wide)

Time Zone
.exemplarLocation: \(timeZone: .exemplarLocation)
.genericLocation: \(timeZone: .genericLocation)
.identifier(.long)): \(timeZone: .identifier(.long))
.identifier(.short)): \(timeZone: .identifier(.short))
.iso8601(.long)): \(timeZone: .iso8601(.long))
.iso8601(.short)): \(timeZone: .iso8601(.short))
.localizedGMT(.long)): \(timeZone: .localizedGMT(.long))
.localizedGMT(.short)): \(timeZone: .localizedGMT(.short))
.specificName(.long)): \(timeZone: .specificName(.long))
.specificName(.short)): \(timeZone: .specificName(.short))

Week
.defaultDigits: \(week: .defaultDigits)
.twoDigits: \(week: .twoDigits)
.weekOfMonth: \(week: .weekOfMonth)

Weekday
.abbreviated: \(weekday: .abbreviated)
.narrow: \(weekday: .narrow)
.oneDigit: \(weekday: .oneDigit)
.short: \(weekday: .short)
.twoDigits: \(weekday: .twoDigits)
.wide: \(weekday: .wide)

Year
.defaultDigits: \(year: .defaultDigits)
.extended()): \(year: .extended())
.extended(minimumLength: 4)): \(year: .extended(minimumLength: 4))
.padded(10)): \(year: .padded(10))
.relatedGregorian()): \(year: .relatedGregorian())
.relatedGregorian(minimumLength: 4)): \(year: .relatedGregorian(minimumLength: 4))
.twoDigits: \(year: .twoDigits)

Year For Week of Year
.defaultDigits: \(yearForWeekOfYear: .defaultDigits)
.padded(4)): \(yearForWeekOfYear: .padded(4))
.twoDigits): \(yearForWeekOfYear: .twoDigits)
""")

let verbatimGroupOne = Date.VerbatimFormatStyle(
    format: groupOne,
    locale: Locale(identifier: "en_US"),
    timeZone: TimeZone(abbreviation: "PDT")!,
    calendar: Calendar(identifier: .gregorian)
)

let verbatimGroupTwo = Date.VerbatimFormatStyle(
    format: groupTwo,
    locale: Locale(identifier: "en_US"),
    timeZone: TimeZone(abbreviation: "PDT")!,
    calendar: Calendar(identifier: .gregorian)
)

let verbatimGroupThree = Date.VerbatimFormatStyle(
    format: groupThree,
    locale: Locale(identifier: "en_US"),
    timeZone: TimeZone(abbreviation: "PDT")!,
    calendar: Calendar(identifier: .gregorian)
)

print(verbatimGroupOne.format(twosday))
print(verbatimGroupTwo.format(twosday))
print(verbatimGroupThree.format(twosday))

/* OUTPUT

 Cyclic Year
 .abbreviated: 2022
 .narrow: 02022
 .wide: 2022

 Day
 .defaultDigits: 22
 .julianModified: 2459633x
 .julianModified(minimumLength: 2): 2459633
 .ordinalOfDayInMonth: 4
 .twoDigits: 22

 Day of Year
 .defaultDigits: 53
 .threeDigits: 053
 .twoDigits: 53

 Day Period
 .conversational(.abbreviated)): at night
 .conversational(.narrow)): at night
 .conversational(.wide)): at night
 .standard(.abbreviated)): AM
 .standard(.narrow)): a
 .standard(.wide)): AM
 .with12s(.abbreviated)): AM
 .with12s(.narrow)): a
 .with12s(.wide)): AM

 Era
 .abbreviated: AD
 .narrow: A
 .wide: Anno Domini

 Hour
 .defaultDigits(clock: .twelveHour, hourCycle: .oneBased)): 1
 .defaultDigits(clock: .twelveHour, hourCycle: .zeroBased)): 1
 .defaultDigits(clock: .twentyFourHour, hourCycle: .oneBased)): 1
 .defaultDigits(clock: .twentyFourHour, hourCycle: .zeroBased)): 1

 Minute
 .defaultDigits: 22
 .twoDigits: 22

 Month
 .abbreviated: Feb
 .defaultDigits: 2
 .narrow: F
 .twoDigits: 02
 .wide: February
 Second
 .defaultDigits: 22
 .twoDigits: 22

 Second Fraction
 .fractional(10)): 000000000
 .milliseconds(10)): 004942000

 Standalone Month
 .abbreviated: Feb
 .defaultDigits: 2
 .narrow: F
 .twoDigits: 02
 .wide: February
 Standalone Quarter
 .abbreviated: Q1
 .narrow: 1
 .oneDigit: 1
 .twoDigits: 01
 .wide: 1st quarter

 Standalone Weekday
 .abbreviated: Tue
 .narrow: T
 .oneDigit: 3
 .short: Tu
 .wide: Tuesday

 Time Zone
 .exemplarLocation: Los Angeles
 .genericLocation: Los Angeles Time
 .identifier(.long)): America/Los_Angeles
 .identifier(.short)): uslax
 .iso8601(.long)): -08:00
 .iso8601(.short)): -0800
 .localizedGMT(.long)): GMT-08:00
 .localizedGMT(.short)): GMT-8
 .specificName(.long)): Pacific Standard Time
 .specificName(.short)): PST

 Week
 .defaultDigits: 9
 .twoDigits: 09
 .weekOfMonth: 4

 Weekday
 .abbreviated: Tue
 .narrow: T
 .oneDigit: 3
 .short: Tu
 .twoDigits: 03
 .wide: Tuesday

 Year
 .defaultDigits: 2022
 .extended()): 2022
 .extended(minimumLength: 4)): 2022
 .padded(10)): 0000002022
 .relatedGregorian()): 2022
 .relatedGregorian(minimumLength: 4)): 2022
 .twoDigits: 22

 Year For Week of Year
 .defaultDigits: 2022
 .padded(4)): 2022
 .twoDigits): 22

 */
