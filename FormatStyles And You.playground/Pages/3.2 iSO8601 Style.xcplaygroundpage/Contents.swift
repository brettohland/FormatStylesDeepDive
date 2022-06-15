import Foundation

// MARK: - Date.ISO8601FormatStyle

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

twosday.formatted(.iso8601) // "2022-02-22T09:22:22Z"

// MARK: - Setting Locale

let franceLocale = Locale(identifier: "fr_FR")
twosday.formatted(.iso8601.locale(franceLocale)) // "2022-02-22T09:22:22Z"

// MARK: - Customization Options

let isoFormat = Date.ISO8601FormatStyle(
    dateSeparator: .dash,
    dateTimeSeparator: .standard,
    timeSeparator: .colon,
    timeZoneSeparator: .colon,
    includingFractionalSeconds: true,
    timeZone: TimeZone(secondsFromGMT: 0)!
)

isoFormat.format(twosday) // "2022-02-22T09:22:22.000Z"
twosday.formatted(isoFormat) // "2022-02-22T09:22:22.000Z"

let isoStyle = Date.ISO8601FormatStyle(timeZone: TimeZone(secondsFromGMT: 0)!)
    .year()
    .day()
    .month()
    .dateSeparator(.dash)
    .dateTimeSeparator(.standard)
    .timeSeparator(.colon)
    .timeZoneSeparator(.colon)
    .time(includingFractionalSeconds: true)
    .locale(Locale(identifier: "fr_FR"))

isoStyle.format(twosday) // "2022-02-22T09:22:22.000"
twosday.formatted(isoStyle) // "2022-02-22T09:22:22.000"

// MARK: - Parsing

let parsingStyle = Date.ISO8601FormatStyle(timeZone: TimeZone(secondsFromGMT: 0)!)
    .year()
    .day()
    .month()
    .dateSeparator(.dash)
    .dateTimeSeparator(.standard)
    .timeSeparator(.colon)
    .timeZoneSeparator(.colon)
    .time(includingFractionalSeconds: true)

try? parsingStyle.parseStrategy.parse("2022-02-22T09:22:22.000")
try? parsingStyle.parse("2022-02-22T09:22:22.000")
try? Date("2022-02-22T09:22:22.000", strategy: parsingStyle.parseStrategy)
