import Foundation

// MARK: - Date.VerbatimFormatStyle

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

twosday.formatted(verbatim.attributed)

// MARK: Customization Options

// MARK: - Apple's Documentation

/*
 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.Era {

     /// Abbreviated Era name. For example, "AD", "Reiwa", "令和".
     public static var abbreviated: Date.FormatStyle.Symbol.Era { get }

     /// Wide era name. For example, "Anno Domini", "Reiwa", "令和".
     public static var wide: Date.FormatStyle.Symbol.Era { get }

     /// Narrow era name.
     /// For example, For example, "A", "R", "R".
     public static var narrow: Date.FormatStyle.Symbol.Era { get }
 }

 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.Year {

     /// Minimum number of digits that shows the full year.
     /// For example, `2`, `20`, `201`, `2017`, `20173`.
     public static var defaultDigits: Date.FormatStyle.Symbol.Year { get }

     /// Two low-order digits.
     /// Padded or truncated if necessary. For example, `02`, `20`, `01`, `17`, `73`.
     public static var twoDigits: Date.FormatStyle.Symbol.Year { get }

     /// Three or more digits.
     /// Padded if necessary. For example, `002`, `020`, `201`, `2017`, `20173`.
     public static func padded(_ length: Int) -> Date.FormatStyle.Symbol.Year

     /// Related Gregorian year.
     /// For non-Gregorian calendars, this corresponds to the extended Gregorian year in which the calendar’s year begins. Related Gregorian years are often displayed, for example, when formatting dates in the Japanese calendar — e.g. "2012(平成24)年1月15日" — or in the Chinese calendar — e.g. "2012壬辰年腊月初四".
     public static func relatedGregorian(minimumLength: Int = 1) -> Date.FormatStyle.Symbol.Year

     /// Extended year.
     /// This is a single number designating the year of this calendar system, encompassing all supra-year fields. For example, for the Julian calendar system, year numbers are positive, with an era of BCE or CE. An extended year value for the Julian calendar system assigns positive values to CE years and negative values to BCE years, with 1 BCE being year 0.
     public static func extended(minimumLength: Int = 1) -> Date.FormatStyle.Symbol.Year
 }

 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.YearForWeekOfYear {

     /// Minimum number of digits that shows the full year in "Week of Year"-based calendars.
     /// For example, `2`, `20`, `201`, `2017`, `20173`.
     public static var defaultDigits: Date.FormatStyle.Symbol.YearForWeekOfYear { get }

     /// Two low-order digits.  Padded or truncated if necessary.
     /// For example, `02`, `20`, `01`, `17`, `73`.
     public static var twoDigits: Date.FormatStyle.Symbol.YearForWeekOfYear { get }

     /// Three or more digits. Padded if necessary.
     /// For example, `002`, `020`, `201`, `2017`, `20173`.
     public static func padded(_ length: Int) -> Date.FormatStyle.Symbol.YearForWeekOfYear
 }

 /// Cyclic year symbols.
 ///
 /// Calendars such as the Chinese lunar calendar (and related calendars) and the Hindu calendars use 60-year cycles of year names. If the calendar does not provide cyclic year name data, or if the year value to be formatted is out of the range of years for which cyclic name data is provided, then numeric formatting is used (behaves like `Year`).
 ///
 /// Currently the data only provides abbreviated names, which will be used for all requested name widths.
 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.CyclicYear {

     /// Abbreviated cyclic year name.
     /// For example, "甲子".
     public static var abbreviated: Date.FormatStyle.Symbol.CyclicYear { get }

     /// Wide cyclic year name.
     /// For example, "甲子".
     public static var wide: Date.FormatStyle.Symbol.CyclicYear { get }

     /// Narrow cyclic year name.
     /// For example, "甲子".
     public static var narrow: Date.FormatStyle.Symbol.CyclicYear { get }
 }

 /// Quarter symbols.
 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.Quarter {

     /// Numeric: one digit quarter. For example `2`.
     public static var oneDigit: Date.FormatStyle.Symbol.Quarter { get }

     /// Numeric: two digits with zero padding. For example `02`.
     public static var twoDigits: Date.FormatStyle.Symbol.Quarter { get }

     /// Abbreviated quarter. For example `Q2`.
     public static var abbreviated: Date.FormatStyle.Symbol.Quarter { get }

     /// The quarter spelled out in full, for example `2nd quarter`.
     public static var wide: Date.FormatStyle.Symbol.Quarter { get }

     /// Narrow quarter. For example `2`.
     public static var narrow: Date.FormatStyle.Symbol.Quarter { get }
 }

 /// Month symbols.
 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.Month {

     /// Minimum number of digits that shows the numeric month. Intended to be used in conjunction with `Day.defaultDigits`.
     /// For example, `9`, `12`.
     public static var defaultDigits: Date.FormatStyle.Symbol.Month { get }

     /// 2 digits, zero pad if needed. For example, `09`, `12`.
     public static var twoDigits: Date.FormatStyle.Symbol.Month { get }

     /// Abbreviated month name. For example, "Sep".
     public static var abbreviated: Date.FormatStyle.Symbol.Month { get }

     /// Wide month name. For example, "September".
     public static var wide: Date.FormatStyle.Symbol.Month { get }

     /// Narrow month name. For example, "S".
     public static var narrow: Date.FormatStyle.Symbol.Month { get }
 }

 /// Week symbols. Use with `YearForWeekOfYear` for the year field instead of `Year`.
 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.Week {

     /// Numeric week of year. For example, `8`, `27`.
     public static var defaultDigits: Date.FormatStyle.Symbol.Week { get }

     /// Two-digit numeric week of year, zero padded as necessary. For example, `08`, `27`.
     public static var twoDigits: Date.FormatStyle.Symbol.Week { get }

     /// One-digit numeric week of month, starting from 1. For example, `1`.
     public static var weekOfMonth: Date.FormatStyle.Symbol.Week { get }
 }

 /// Day symbols.
 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.Day {

     /// Minimum number of digits that shows the full numeric day of month. For example, `1`, `18`.
     public static var defaultDigits: Date.FormatStyle.Symbol.Day { get }

     /// Two-digit, zero-padded if necessary. For example, `01`, `18`.
     public static var twoDigits: Date.FormatStyle.Symbol.Day { get }

     /// Ordinal of day in month.
     /// For example, the 2nd Wed in July would yield `2`.
     public static var ordinalOfDayInMonth: Date.FormatStyle.Symbol.Day { get }

     /// The field length specifies the minimum number of digits, with zero-padding as necessary.
     /// This is different from the conventional Julian day number in two regards. First, it demarcates days at local zone midnight, rather than noon GMT. Second, it is a local number; that is, it depends on the local time zone. It can be thought of as a single number that encompasses all the date-related fields.
     /// For example, `2451334`.
     public static func julianModified(minimumLength: Int = 1) -> Date.FormatStyle.Symbol.Day
 }

 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.DayOfYear {

     /// Minimum number of digits that shows the full numeric day of year. For example, `7`, `33`, `345`.
     public static var defaultDigits: Date.FormatStyle.Symbol.DayOfYear { get }

     /// Two-digit day of year, with zero-padding as necessary. For example, `07`, `33`, `345`.
     public static var twoDigits: Date.FormatStyle.Symbol.DayOfYear { get }

     /// Three-digit day of year, with zero-padding as necessary. For example, `007`, `033`, `345`.
     public static var threeDigits: Date.FormatStyle.Symbol.DayOfYear { get }
 }

 /// Week day name symbols.
 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.Weekday {

     /// Abbreviated day of week name. For example, "Tue".
     public static var abbreviated: Date.FormatStyle.Symbol.Weekday { get }

     /// Wide day of week name. For example, "Tuesday".
     public static var wide: Date.FormatStyle.Symbol.Weekday { get }

     /// Narrow day of week name. For example, "T".
     public static var narrow: Date.FormatStyle.Symbol.Weekday { get }

     /// Short day of week name. For example, "Tu".
     public static var short: Date.FormatStyle.Symbol.Weekday { get }

     /// Local day of week number/name. The value depends on the local starting day of the week.
     public static var oneDigit: Date.FormatStyle.Symbol.Weekday { get }

     /// Local day of week number/name, format style; two digits, zero-padded if necessary.
     public static var twoDigits: Date.FormatStyle.Symbol.Weekday { get }
 }

 /// The time period (for example, "a.m." or "p.m."). May be upper or lower case depending on the locale and other options.
 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.DayPeriod {

     public enum Width {

         case abbreviated

         case wide

         case narrow

         /// Returns a Boolean value indicating whether two values are equal.
         ///
         /// Equality is the inverse of inequality. For any values `a` and `b`,
         /// `a == b` implies that `a != b` is `false`.
         ///
         /// - Parameters:
         ///   - lhs: A value to compare.
         ///   - rhs: Another value to compare.
         public static func == (a: Date.FormatStyle.Symbol.DayPeriod.Width, b: Date.FormatStyle.Symbol.DayPeriod.Width) -> Bool

         /// Hashes the essential components of this value by feeding them into the
         /// given hasher.
         ///
         /// Implement this method to conform to the `Hashable` protocol. The
         /// components used for hashing must be the same as the components compared
         /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
         /// with each of these components.
         ///
         /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
         ///   compile-time error in the future.
         ///
         /// - Parameter hasher: The hasher to use when combining the components
         ///   of this instance.
         public func hash(into hasher: inout Hasher)

         /// The hash value.
         ///
         /// Hash values are not guaranteed to be equal across different executions of
         /// your program. Do not save hash values to use during a future execution.
         ///
         /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
         ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
         public var hashValue: Int { get }
     }

     /// Standard day period. For example,
     /// Abbreviated: `12 am.`
     /// Wide: `12 am`
     /// Narrow: `12a`.
     public static func standard(_ width: Date.FormatStyle.Symbol.DayPeriod.Width) -> Date.FormatStyle.Symbol.DayPeriod

     /// Day period including designations for noon and midnight. For example,
     /// Abbreviated: `mid`
     /// Wide: `midnight`
     /// Narrow: `md`.
     public static func with12s(_ width: Date.FormatStyle.Symbol.DayPeriod.Width) -> Date.FormatStyle.Symbol.DayPeriod

     /// Conversational day period. For example,
     /// Abbreviated: `at night`, `nachm.`, `ip.`
     /// Wide: `at night`, `nachmittags`, `iltapäivällä`.
     /// Narrow: `at night`, `nachm.`, `iltap`.
     public static func conversational(_ width: Date.FormatStyle.Symbol.DayPeriod.Width) -> Date.FormatStyle.Symbol.DayPeriod
 }

 /// Hour symbols.
 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.Hour {

     public struct AMPMStyle : Codable, Hashable {

         /// Hides the day period marker (AM/PM).
         /// For example, `8` (for 8 in the morning), `1` (for 1 in the afternoon) if used with `defaultDigits`.
         /// Or `08`, `01` if used with `twoDigits`.
         public static let omitted: Date.FormatStyle.Symbol.Hour.AMPMStyle

         /// Narrow day period if the locale prefers using day period with hour.
         /// For example, `8`, `8a`, `13`, `1p` if used with `defaultDigits`.
         /// Or `08`, `08a`, `13`, `01p` if used with `twoDigits`.
         public static let narrow: Date.FormatStyle.Symbol.Hour.AMPMStyle

         /// Abbreviated day period if the locale prefers using day period with hour.
         /// For example, `8`, `8 AM`, `13`, `1 PM` if used with `defaultDigits`.
         /// Or `08`, `08 AM`, `13`, `01 PM` if used with `twoDigits`.
         public static let abbreviated: Date.FormatStyle.Symbol.Hour.AMPMStyle

         /// Wide day period if the locale prefers using day period with hour.
         /// For example, `8`, `8 A.M.`, `13`, `1 P.M.` if used with `defaultDigits`.
         /// Or, `08`, `08 A.M.`, `13`, `01 P.M.` if used with `twoDigits`.
         public static let wide: Date.FormatStyle.Symbol.Hour.AMPMStyle

         /// Hashes the essential components of this value by feeding them into the
         /// given hasher.
         ///
         /// Implement this method to conform to the `Hashable` protocol. The
         /// components used for hashing must be the same as the components compared
         /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
         /// with each of these components.
         ///
         /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
         ///   compile-time error in the future.
         ///
         /// - Parameter hasher: The hasher to use when combining the components
         ///   of this instance.
         public func hash(into hasher: inout Hasher)

         /// Returns a Boolean value indicating whether two values are equal.
         ///
         /// Equality is the inverse of inequality. For any values `a` and `b`,
         /// `a == b` implies that `a != b` is `false`.
         ///
         /// - Parameters:
         ///   - lhs: A value to compare.
         ///   - rhs: Another value to compare.
         public static func == (a: Date.FormatStyle.Symbol.Hour.AMPMStyle, b: Date.FormatStyle.Symbol.Hour.AMPMStyle) -> Bool

         /// Encodes this value into the given encoder.
         ///
         /// If the value fails to encode anything, `encoder` will encode an empty
         /// keyed container in its place.
         ///
         /// This function throws an error if any values are invalid for the given
         /// encoder's format.
         ///
         /// - Parameter encoder: The encoder to write data to.
         public func encode(to encoder: Encoder) throws

         /// The hash value.
         ///
         /// Hash values are not guaranteed to be equal across different executions of
         /// your program. Do not save hash values to use during a future execution.
         ///
         /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
         ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
         public var hashValue: Int { get }

         /// Creates a new instance by decoding from the given decoder.
         ///
         /// This initializer throws an error if reading from the decoder fails, or
         /// if the data read is corrupted or otherwise invalid.
         ///
         /// - Parameter decoder: The decoder to read data from.
         public init(from decoder: Decoder) throws
     }

     /// The preferred numeric hour format for the locale with minimum digits. Whether the period symbol (AM/PM) will be shown depends on the locale.
     public static func defaultDigits(amPM: Date.FormatStyle.Symbol.Hour.AMPMStyle) -> Date.FormatStyle.Symbol.Hour

     /// The preferred two-digit hour format for the locale, zero padded if necessary. Whether the period symbol (AM/PM) will be shown depends on the locale.
     public static func twoDigits(amPM: Date.FormatStyle.Symbol.Hour.AMPMStyle) -> Date.FormatStyle.Symbol.Hour

     /// Behaves like `defaultDigits`: the preferred numeric hour format for the locale with minimum digits. May also use conversational period formats.
     public static func conversationalDefaultDigits(amPM: Date.FormatStyle.Symbol.Hour.AMPMStyle) -> Date.FormatStyle.Symbol.Hour

     /// Behaves like `twoDigits`: two-digit hour format for the locale, zero padded if necessary. May also use conversational period formats.
     public static func conversationalTwoDigits(amPM: Date.FormatStyle.Symbol.Hour.AMPMStyle) -> Date.FormatStyle.Symbol.Hour

     @available(*, deprecated, renamed: "defaultDigits(amPM:)")
     public static var defaultDigitsNoAMPM: Date.FormatStyle.Symbol.Hour { get }

     @available(*, deprecated, renamed: "twoDigits(amPM:)")
     public static var twoDigitsNoAMPM: Date.FormatStyle.Symbol.Hour { get }
 }

 /// Minute symbols.
 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.Minute {

     /// Minimum digits to show the numeric minute. Truncated, not rounded. For example, `8`, `59`.
     public static var defaultDigits: Date.FormatStyle.Symbol.Minute { get }

     /// Two-digit numeric, zero padded if needed. For example, `08`, `59`.
     public static var twoDigits: Date.FormatStyle.Symbol.Minute { get }
 }

 /// Second symbols.
 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.Second {

     /// Minimum digits to show the numeric second. Truncated, not rounded. For example, `8`, `12`.
     public static var defaultDigits: Date.FormatStyle.Symbol.Second { get }

     /// Two digits numeric, zero padded if needed, not rounded. For example, `08`, `12`.
     public static var twoDigits: Date.FormatStyle.Symbol.Second { get }
 }

 /// Fractions of a second  symbols.
 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.SecondFraction {

     /// Fractional second (numeric).
     /// Truncates, like other numeric time fields, but in this case to the number of digits specified by the associated `Int`.
     /// For example, specifying `4` for seconds value `12.34567` yields `12.3456`.
     public static func fractional(_ val: Int) -> Date.FormatStyle.Symbol.SecondFraction

     /// Milliseconds in day (numeric).
     /// The associated `Int` specifies the minimum number of digits, with zero-padding as necessary. The maximum number of digits is 9.
     /// This field behaves exactly like a composite of all time-related fields, not including the zone fields. As such, it also reflects discontinuities of those fields on DST transition days. On a day of DST onset, it will jump forward. On a day of DST cessation, it will jump backward. This reflects the fact that is must be combined with the offset field to obtain a unique local time value.
     public static func milliseconds(_ val: Int) -> Date.FormatStyle.Symbol.SecondFraction
 }

 /// Time zone symbols.
 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.TimeZone {

     public enum Width {

         case short

         case long

         /// Returns a Boolean value indicating whether two values are equal.
         ///
         /// Equality is the inverse of inequality. For any values `a` and `b`,
         /// `a == b` implies that `a != b` is `false`.
         ///
         /// - Parameters:
         ///   - lhs: A value to compare.
         ///   - rhs: Another value to compare.
         public static func == (a: Date.FormatStyle.Symbol.TimeZone.Width, b: Date.FormatStyle.Symbol.TimeZone.Width) -> Bool

         /// Hashes the essential components of this value by feeding them into the
         /// given hasher.
         ///
         /// Implement this method to conform to the `Hashable` protocol. The
         /// components used for hashing must be the same as the components compared
         /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
         /// with each of these components.
         ///
         /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
         ///   compile-time error in the future.
         ///
         /// - Parameter hasher: The hasher to use when combining the components
         ///   of this instance.
         public func hash(into hasher: inout Hasher)

         /// The hash value.
         ///
         /// Hash values are not guaranteed to be equal across different executions of
         /// your program. Do not save hash values to use during a future execution.
         ///
         /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
         ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
         public var hashValue: Int { get }
     }

     /// Specific non-location format. Falls back to `shortLocalizedGMT` if unavailable. For example,
     /// short: "PDT"
     /// long: "Pacific Daylight Time".
     public static func specificName(_ width: Date.FormatStyle.Symbol.TimeZone.Width) -> Date.FormatStyle.Symbol.TimeZone

     /// Generic non-location format. Falls back to `genericLocation` if unavailable. For example,
     /// short: "PT". Fallback again to `localizedGMT(.short)` if `genericLocation(.short)` is unavaiable.
     /// long: "Pacific Time"
     public static func genericName(_ width: Date.FormatStyle.Symbol.TimeZone.Width) -> Date.FormatStyle.Symbol.TimeZone

     /// The ISO8601 format with hours, minutes and optional seconds fields. For example,
     /// short: "-0800"
     /// long: "-08:00" or "-07:52:58".
     public static func iso8601(_ width: Date.FormatStyle.Symbol.TimeZone.Width) -> Date.FormatStyle.Symbol.TimeZone

     /// Short localized GMT format. For example,
     /// short: "GMT-8"
     /// long: "GMT-8:00"
     public static func localizedGMT(_ width: Date.FormatStyle.Symbol.TimeZone.Width) -> Date.FormatStyle.Symbol.TimeZone

     /// The time zone ID. For example,
     /// short: "uslax"
     /// long: "America/Los_Angeles".
     public static func identifier(_ width: Date.FormatStyle.Symbol.TimeZone.Width) -> Date.FormatStyle.Symbol.TimeZone

     /// The exemplar city (location) for the time zone. The localized exemplar city name for the special zone or unknown is used as the fallback if it is unavailable.
     /// For example, "Los Angeles".
     public static var exemplarLocation: Date.FormatStyle.Symbol.TimeZone { get }

     /// The generic location format. Falls back to `longLocalizedGMT` if unavailable. Recommends for presenting possible time zone choices for user selection.
     /// For example, "Los Angeles Time".
     public static var genericLocation: Date.FormatStyle.Symbol.TimeZone { get }
 }

 /// Standalone quarter symbols.
 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.StandaloneQuarter {

     /// Standalone one-digit numeric quarter. For example `2`.
     public static var oneDigit: Date.FormatStyle.Symbol.StandaloneQuarter { get }

     /// Two-digit standalone numeric quarter with zero padding if necessary, for example `02`.
     public static var twoDigits: Date.FormatStyle.Symbol.StandaloneQuarter { get }

     /// Standalone abbreviated quarter. For example `Q2`.
     public static var abbreviated: Date.FormatStyle.Symbol.StandaloneQuarter { get }

     /// Standalone wide quarter. For example "2nd quarter".
     public static var wide: Date.FormatStyle.Symbol.StandaloneQuarter { get }

     /// Standalone narrow quarter. For example "2".
     public static var narrow: Date.FormatStyle.Symbol.StandaloneQuarter { get }
 }

 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.StandaloneMonth {

     /// Stand-alone minimum digits numeric month. Number/name (intended to be used without `Day`).
     /// For example, `9`, `12`.
     public static var defaultDigits: Date.FormatStyle.Symbol.StandaloneMonth { get }

     /// Stand-alone two-digit numeric month.
     /// Two digits, zero pad if needed. For example, `09`, `12`.
     public static var twoDigits: Date.FormatStyle.Symbol.StandaloneMonth { get }

     /// Stand-alone abbreviated month.
     /// For example, "Sep".
     public static var abbreviated: Date.FormatStyle.Symbol.StandaloneMonth { get }

     /// Stand-alone wide month.
     /// For example, "September".
     public static var wide: Date.FormatStyle.Symbol.StandaloneMonth { get }

     /// Stand-alone narrow month.
     /// For example, "S".
     public static var narrow: Date.FormatStyle.Symbol.StandaloneMonth { get }
 }

 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.StandaloneWeekday {

     /// Standalone local day of week number/name.
     public static var oneDigit: Date.FormatStyle.Symbol.StandaloneWeekday { get }

     /// Standalone local day of week number/name.
     /// For example, "Tue".
     public static var abbreviated: Date.FormatStyle.Symbol.StandaloneWeekday { get }

     /// Standalone wide local day of week number/name.
     /// For example, "Tuesday".
     public static var wide: Date.FormatStyle.Symbol.StandaloneWeekday { get }

     /// Standalone narrow local day of week number/name.
     /// For example, "T".
     public static var narrow: Date.FormatStyle.Symbol.StandaloneWeekday { get }

     /// Standalone short local day of week number/name.
     /// For example, "Tu".
     public static var short: Date.FormatStyle.Symbol.StandaloneWeekday { get }
 }

 /// Hour symbols that does not take users' preferences into account, and is displayed as-is.
 @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
 extension Date.FormatStyle.Symbol.VerbatimHour {

     public struct HourCycle : Codable, Hashable {

         /// The hour ranges from 0 to 11 in a 12-hour clock. Ranges from 0 to 23 in a 24-hour clock.
         public static let zeroBased: Date.FormatStyle.Symbol.VerbatimHour.HourCycle

         /// The hour ranges from 1 to 12 in the 12-hour clock. Ranges from 1 to 24 in a 24-hour clock.
         public static let oneBased: Date.FormatStyle.Symbol.VerbatimHour.HourCycle

         /// Hashes the essential components of this value by feeding them into the
         /// given hasher.
         ///
         /// Implement this method to conform to the `Hashable` protocol. The
         /// components used for hashing must be the same as the components compared
         /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
         /// with each of these components.
         ///
         /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
         ///   compile-time error in the future.
         ///
         /// - Parameter hasher: The hasher to use when combining the components
         ///   of this instance.
         public func hash(into hasher: inout Hasher)

         /// Returns a Boolean value indicating whether two values are equal.
         ///
         /// Equality is the inverse of inequality. For any values `a` and `b`,
         /// `a == b` implies that `a != b` is `false`.
         ///
         /// - Parameters:
         ///   - lhs: A value to compare.
         ///   - rhs: Another value to compare.
         public static func == (a: Date.FormatStyle.Symbol.VerbatimHour.HourCycle, b: Date.FormatStyle.Symbol.VerbatimHour.HourCycle) -> Bool

         /// Encodes this value into the given encoder.
         ///
         /// If the value fails to encode anything, `encoder` will encode an empty
         /// keyed container in its place.
         ///
         /// This function throws an error if any values are invalid for the given
         /// encoder's format.
         ///
         /// - Parameter encoder: The encoder to write data to.
         public func encode(to encoder: Encoder) throws

         /// The hash value.
         ///
         /// Hash values are not guaranteed to be equal across different executions of
         /// your program. Do not save hash values to use during a future execution.
         ///
         /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
         ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
         public var hashValue: Int { get }

         /// Creates a new instance by decoding from the given decoder.
         ///
         /// This initializer throws an error if reading from the decoder fails, or
         /// if the data read is corrupted or otherwise invalid.
         ///
         /// - Parameter decoder: The decoder to read data from.
         public init(from decoder: Decoder) throws
     }

     public struct Clock : Codable, Hashable {

         /// In a 12-hour clock system, the 24-hour day is divided into two periods, a.m. and p.m, and each period consists of 12 hours.
         /// - Note: Does not include the period marker (AM/PM). Specify a `PeriodSymbol` if that's desired.
         public static let twelveHour: Date.FormatStyle.Symbol.VerbatimHour.Clock

         /// In a 24-hour clock system, the day runs from midnight to midnight, dividing into 24 hours.
         /// - Note: If using `twentyFourHour` together with `PeriodSymbol`, the period is ignored.
         public static let twentyFourHour: Date.FormatStyle.Symbol.VerbatimHour.Clock

         /// Hashes the essential components of this value by feeding them into the
         /// given hasher.
         ///
         /// Implement this method to conform to the `Hashable` protocol. The
         /// components used for hashing must be the same as the components compared
         /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
         /// with each of these components.
         ///
         /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
         ///   compile-time error in the future.
         ///
         /// - Parameter hasher: The hasher to use when combining the components
         ///   of this instance.
         public func hash(into hasher: inout Hasher)

         /// Returns a Boolean value indicating whether two values are equal.
         ///
         /// Equality is the inverse of inequality. For any values `a` and `b`,
         /// `a == b` implies that `a != b` is `false`.
         ///
         /// - Parameters:
         ///   - lhs: A value to compare.
         ///   - rhs: Another value to compare.
         public static func == (a: Date.FormatStyle.Symbol.VerbatimHour.Clock, b: Date.FormatStyle.Symbol.VerbatimHour.Clock) -> Bool

         /// Encodes this value into the given encoder.
         ///
         /// If the value fails to encode anything, `encoder` will encode an empty
         /// keyed container in its place.
         ///
         /// This function throws an error if any values are invalid for the given
         /// encoder's format.
         ///
         /// - Parameter encoder: The encoder to write data to.
         public func encode(to encoder: Encoder) throws

         /// The hash value.
         ///
         /// Hash values are not guaranteed to be equal across different executions of
         /// your program. Do not save hash values to use during a future execution.
         ///
         /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
         ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
         public var hashValue: Int { get }

         /// Creates a new instance by decoding from the given decoder.
         ///
         /// This initializer throws an error if reading from the decoder fails, or
         /// if the data read is corrupted or otherwise invalid.
         ///
         /// - Parameter decoder: The decoder to read data from.
         public init(from decoder: Decoder) throws
     }

     /// Minimum digits to show the numeric hour. For example, `1`, `12`.
     /// Or `23` if using the `twentyFourHour` clock.
     /// - Note: This format does not take user's locale preferences into account. Consider using `defaultDigits` if applicable.
     public static func defaultDigits(clock: Date.FormatStyle.Symbol.VerbatimHour.Clock, hourCycle: Date.FormatStyle.Symbol.VerbatimHour.HourCycle) -> Date.FormatStyle.Symbol.VerbatimHour

     /// Numeric two-digit hour, zero padded if necessary.
     /// For example, `01`, `12`.
     /// Or `23` if using the `twentyFourHour` clock.
     /// - Note: This format does not take user's locale preferences into account. Consider using `defaultDigits` if applicable.
     public static func twoDigits(clock: Date.FormatStyle.Symbol.VerbatimHour.Clock, hourCycle: Date.FormatStyle.Symbol.VerbatimHour.HourCycle) -> Date.FormatStyle.Symbol.VerbatimHour
 }
 */

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
    timeZone: TimeZone.current,
    calendar: .current
)

let verbatimGroupTwo = Date.VerbatimFormatStyle(
    format: groupTwo,
    timeZone: TimeZone.current,
    calendar: .current
)

let verbatimGroupThree = Date.VerbatimFormatStyle(
    format: groupThree,
    timeZone: TimeZone.current,
    calendar: .current
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
 .conversational(.abbreviated)): AM
 .conversational(.narrow)): AM
 .conversational(.wide)): AM
 .standard(.abbreviated)): AM
 .standard(.narrow)): AM
 .standard(.wide)): AM
 .with12s(.abbreviated)): AM
 .with12s(.narrow)): AM
 .with12s(.wide)): AM

 Era
 .abbreviated: CE
 .narrow: CE
 .wide: CE

 Hour
 .defaultDigits(clock: .twelveHour, hourCycle: .oneBased)): 2
 .defaultDigits(clock: .twelveHour, hourCycle: .zeroBased)): 2
 .defaultDigits(clock: .twentyFourHour, hourCycle: .oneBased)): 2
 .defaultDigits(clock: .twentyFourHour, hourCycle: .zeroBased)): 2

 Minute
 .defaultDigits: 22
 .twoDigits: 22

 Month
 .abbreviated: M02
 .defaultDigits: 2
 .narrow: 2
 .twoDigits: 02
 .wide: M02
 Second
 .defaultDigits: 22
 .twoDigits: 22

 Second Fraction
 .fractional(10)): 000000000
 .milliseconds(10)): 008542000

 Standalone Month
 .abbreviated: M02
 .defaultDigits: 2
 .narrow: 2
 .twoDigits: 02
 .wide: M02
 Standalone Quarter
 .abbreviated: Q1
 .narrow: 1
 .oneDigit: 1
 .twoDigits: 01
 .wide: Q1

 Standalone Weekday
 .abbreviated: Tue
 .narrow: T
 .oneDigit: 3
 .short: Tue
 .wide: Tue

 Time Zone
 .exemplarLocation: Edmonton
 .genericLocation: Edmonton
 .identifier(.long)): America/Edmonton
 .identifier(.short)): caedm
 .iso8601(.long)): -07:00
 .iso8601(.short)): -0700
 .localizedGMT(.long)): GMT-07:00
 .localizedGMT(.short)): GMT-7
 .specificName(.long)): GMT-07:00
 .specificName(.short)): GMT-7

 Week
 .defaultDigits: 9
 .twoDigits: 09
 .weekOfMonth: 4

 Weekday
 .abbreviated: Tue
 .narrow: T
 .oneDigit: 3
 .short: Tue
 .twoDigits: 03
 .wide: Tue

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
