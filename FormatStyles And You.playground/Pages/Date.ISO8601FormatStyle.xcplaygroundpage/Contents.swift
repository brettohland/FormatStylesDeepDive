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
twosday.formatted(isoFormat)


struct ISO8601Variant: FormatStyle {
    typealias FormatInput = Date
    typealias FormatOutput = String

    static let isoFormat = Date.ISO8601FormatStyle(
        dateSeparator: .dash,
        dateTimeSeparator: .standard,
        timeSeparator: .colon,
        timeZoneSeparator: .colon,
        includingFractionalSeconds: true,
        timeZone: TimeZone(secondsFromGMT: 0)!
    )

    func format(_ value: Date) -> String {
        ISO8601Variant.isoFormat.format(value)
    }
}

extension FormatStyle where Self == ISO8601Variant {
    static var iso8601Variant: ISO8601Variant { .init() }
}

twosday.formatted(.iso8601Variant) // "2022-02-22T09:22:22.000Z"

