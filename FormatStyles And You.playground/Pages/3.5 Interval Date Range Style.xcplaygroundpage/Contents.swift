import Foundation

// MARK: - Date.IntervalFormatStyle

let range = Date(timeIntervalSince1970: 0) ..< Date(timeIntervalSinceReferenceDate: 2837)

range.formatted(.interval) // "12/31/69, 5:00 PM – 12/31/00, 5:47 PM"

range.formatted(.interval.day()) // "12/31/1969 – 12/31/2000"
range.formatted(.interval.hour()) // "12/31/1969, 5 PM – 12/31/2000, 5 PM"
range.formatted(.interval.hour(.conversationalDefaultDigits(amPM: .abbreviated))) // "12/31/1969, 5 PM – 12/31/2000, 5 PM"
range.formatted(.interval.hour(.conversationalDefaultDigits(amPM: .narrow))) // "12/31/1969, 5 p – 12/31/2000, 5 p"
range.formatted(.interval.hour(.conversationalDefaultDigits(amPM: .omitted))) // "12/31/1969, 5 PM – 12/31/2000, 5 PM"
range.formatted(.interval.hour(.conversationalDefaultDigits(amPM: .wide))) // "12/31/1969, 5 PM – 12/31/2000, 5 PM"
range.formatted(.interval.minute()) // "12/31/1969, 0 – 12/31/2000, 47"
range.formatted(.interval.month(.defaultDigits)) // "12/1969 – 12/2000"
range.formatted(.interval.month(.twoDigits)) // "12/1969 – 12/2000"
range.formatted(.interval.month(.wide)) // "December 1969 – December 2000"
range.formatted(.interval.month(.narrow)) // "D 1969 – D 2000"
range.formatted(.interval.month(.abbreviated)) // "Dec 1969 – Dec 2000"
range.formatted(.interval.second()) // "12/31/1969, 0 – 12/31/2000, 17"
range.formatted(.interval.timeZone()) // "12/31/1969, MST – 12/31/2000, MT"
range.formatted(.interval.timeZone(.exemplarLocation)) // "12/31/1969, Edmonton – 12/31/2000, Edmonton"
range.formatted(.interval.timeZone(.genericLocation)) // "12/31/1969, Edmonton Time – 12/31/2000, Edmonton Time"
range.formatted(.interval.timeZone(.genericName(.long))) // "12/31/1969, Mountain Standard Time – 12/31/2000, Mountain Time"
range.formatted(.interval.timeZone(.genericName(.short))) // "12/31/1969, MST – 12/31/2000, MT"
range.formatted(.interval.timeZone(.identifier(.short))) // "12/31/1969, caedm – 12/31/2000, caedm"
range.formatted(.interval.timeZone(.identifier(.long))) // "12/31/1969, America/Edmonton – 12/31/2000, America/Edmonton"
range.formatted(.interval.timeZone(.iso8601(.short))) // "12/31/1969, -0700 – 12/31/2000, -0700"
range.formatted(.interval.timeZone(.iso8601(.long))) // "12/31/1969, -07:00 – 12/31/2000, -07:00"
range.formatted(.interval.timeZone(.localizedGMT(.short))) // "GMT-7"
range.formatted(.interval.timeZone(.localizedGMT(.long))) // "12/31/1969, GMT-07:00 – 12/31/2000, GMT-07:00"
range.formatted(.interval.timeZone(.specificName(.long))) // "12/31/1969, Mountain Standard Time – 12/31/2000, Mountain Standard Time"
range.formatted(.interval.timeZone(.specificName(.short))) // "12/31/1969, MST – 12/31/2000, MST"
range.formatted(.interval.year()) //"1969 – 2000"

Date.IntervalFormatStyle().day().format(range) // "12/31/1969 – 12/31/2000"
Date.IntervalFormatStyle().hour().format(range) // "12/31/1969, 5 PM – 12/31/2000, 5 PM"
Date.IntervalFormatStyle().hour(.conversationalDefaultDigits(amPM: .abbreviated)).format(range) // "12/31/1969, 5 PM – 12/31/2000, 5 PM"
Date.IntervalFormatStyle().hour(.conversationalDefaultDigits(amPM: .narrow)).format(range) // "12/31/1969, 5 p – 12/31/2000, 5 p"
Date.IntervalFormatStyle().hour(.conversationalDefaultDigits(amPM: .omitted)).format(range) // "12/31/1969, 5 PM – 12/31/2000, 5 PM"
Date.IntervalFormatStyle().hour(.conversationalDefaultDigits(amPM: .wide)).format(range) // "12/31/1969, 5 PM – 12/31/2000, 5 PM"
Date.IntervalFormatStyle().minute().format(range) // "12/31/1969, 0 – 12/31/2000, 47"
Date.IntervalFormatStyle().month(.defaultDigits).format(range) // "12/1969 – 12/2000"
Date.IntervalFormatStyle().month(.twoDigits).format(range) // "12/1969 – 12/2000"
Date.IntervalFormatStyle().month(.wide).format(range) // "December 1969 – December 2000"
Date.IntervalFormatStyle().month(.narrow).format(range) // "D 1969 – D 2000"
Date.IntervalFormatStyle().month(.abbreviated).format(range) // "Dec 1969 – Dec 2000"
Date.IntervalFormatStyle().second().format(range) // "12/31/1969, 0 – 12/31/2000, 17"
Date.IntervalFormatStyle().timeZone().format(range) // "12/31/1969, MST – 12/31/2000, MT"
Date.IntervalFormatStyle().timeZone(.exemplarLocation).format(range) // "12/31/1969, Edmonton – 12/31/2000, Edmonton"
Date.IntervalFormatStyle().timeZone(.genericLocation).format(range) // "12/31/1969, Edmonton Time – 12/31/2000, Edmonton Time"
Date.IntervalFormatStyle().timeZone(.genericName(.long)).format(range) // "12/31/1969, Mountain Standard Time – 12/31/2000, Mountain Time"
Date.IntervalFormatStyle().timeZone(.genericName(.short)).format(range) // "12/31/1969, MST – 12/31/2000, MT"
Date.IntervalFormatStyle().timeZone(.identifier(.short)).format(range) // "12/31/1969, caedm – 12/31/2000, caedm"
Date.IntervalFormatStyle().timeZone(.identifier(.long)).format(range) // "12/31/1969, America/Edmonton – 12/31/2000, America/Edmonton"
Date.IntervalFormatStyle().timeZone(.iso8601(.short)).format(range) // "12/31/1969, -0700 – 12/31/2000, -0700"
Date.IntervalFormatStyle().timeZone(.iso8601(.long)).format(range) // "12/31/1969, -07:00 – 12/31/2000, -07:00"
Date.IntervalFormatStyle().timeZone(.localizedGMT(.short)).format(range) // "GMT-7"
Date.IntervalFormatStyle().timeZone(.localizedGMT(.long)).format(range) // "12/31/1969, GMT-07:00 – 12/31/2000, GMT-07:00"
Date.IntervalFormatStyle().timeZone(.specificName(.long)).format(range) // "12/31/1969, Mountain Standard Time – 12/31/2000, Mountain Standard Time"
Date.IntervalFormatStyle().timeZone(.specificName(.short)).format(range) // "12/31/1969, MST – 12/31/2000, MST"
Date.IntervalFormatStyle().year().format(range) //"1969 – 2000"

// MARK: - Setting Locale

let franceLocale = Locale(identifier: "fr_FR")
range.formatted(.interval.locale(franceLocale)) // "31/12/1969 à 17:00 – 31/12/2000 à 17:47"
range.formatted(.interval.timeZone(.genericName(.long)).locale(franceLocale)) // "31/12/1969 à heure normale des Rocheuses – 31/12/2000 à heure des Rocheuses"

Date.IntervalFormatStyle().locale(franceLocale).format(range) // "31/12/1969 à 17:00 – 31/12/2000 à 17:47"
Date.IntervalFormatStyle().timeZone(.genericName(.long)).locale(franceLocale).format(range) // "31/12/1969 à heure normale des Rocheuses – 31/12/2000 à heure des Rocheuses"

// MARK: - Initializing

let interval = Date.IntervalFormatStyle(
    date: .abbreviated,
    time: .shortened,
    locale: Locale(identifier: "en_US"),
    calendar: Calendar(identifier: .gregorian),
    timeZone: TimeZone(secondsFromGMT: 0)!
)

interval.format(range) // "Jan 1, 1970, 12:00 AM – Jan 1, 2001, 12:47 AM"
range.formatted(interval) // "Jan 1, 1970, 12:00 AM – Jan 1, 2001, 12:47 AM"

