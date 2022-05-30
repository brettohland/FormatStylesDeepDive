import Foundation

// MARK: - Date.IntervalFormatStyle

let range = Date(timeIntervalSince1970: 0) ..< Date(timeIntervalSinceReferenceDate: 2837)

range.formatted(.interval) // "12/31/69, 5:00 PM – 12/31/00, 5:47 PM"

// MARK: - Setting Locale

let franceLocale = Locale(identifier: "fr_FR")
range.formatted(.interval.locale(franceLocale)) // "31/12/1969 à 17:00 – 31/12/2000 à 17:47"

// MARK: - Custom Date.IntervalFormatStyle

let interval = Date.IntervalFormatStyle(
    date: .abbreviated,
    time: .shortened,
    locale: Locale(identifier: "en_US"),
    calendar: Calendar(identifier: .gregorian),
    timeZone: TimeZone(secondsFromGMT: 0)!
)

interval.format(range) // "Jan 1, 1970, 12:00 AM – Jan 1, 2001, 12:47 AM"
range.formatted(interval) // "Jan 1, 1970, 12:00 AM – Jan 1, 2001, 12:47 AM"

struct NarrowIntervalStyle: FormatStyle {
    typealias FormatInput = Range<Date>
    typealias FormatOutput = String

    static let interval = Date.IntervalFormatStyle(
        date: .abbreviated,
        time: .shortened,
        locale: Locale(identifier: "en_US"),
        calendar: Calendar(identifier: .gregorian),
        timeZone: TimeZone(secondsFromGMT: 0)!
    )

    func format(_ value: Range<Date>) -> String {
        NarrowIntervalStyle.interval.format(value)
    }
}

extension FormatStyle where Self == NarrowIntervalStyle {
    static var narrowInterval: NarrowIntervalStyle { .init() }
}

range.formatted(.narrowInterval)
