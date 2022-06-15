import Foundation

// MARK: - Date.ComponentsFormatStyle

let testRange = Date(timeIntervalSince1970: 0) ..< Date(timeIntervalSinceReferenceDate: 0)

testRange.formatted(.components(style: .abbreviated, fields: [.day])) // "11,323 days"
testRange.formatted(.components(style: .narrow, fields: [.day])) // "11,323days"
testRange.formatted(.components(style: .wide, fields: [.day])) // "11,323 days"
testRange.formatted(.components(style: .spellOut, fields: [.day])) // "eleven thousand three hundred twenty-three days"
testRange.formatted(.components(style: .condensedAbbreviated, fields: [.day])) // "11,323d"
testRange.formatted(.components(style: .condensedAbbreviated, fields: [.day, .month, .year, .hour, .second, .week])) // "31y"

testRange.formatted(.components(style: .abbreviated, fields: [.year])
    .calendar(Calendar(identifier: .coptic))) // "31 yrs"

let twosdayDateComponents = DateComponents(
    year: 2022,
    month: 2,
    day: 22,
    hour: 2,
    minute: 22,
    second: 22,
    nanosecond: 22
)

let appleReferenceDay = Date(timeIntervalSinceReferenceDate: 0)
let twosday = Calendar(identifier: .gregorian).date(from: twosdayDateComponents)!
let secondRange = appleReferenceDay ..< twosday

// "21 yrs, 1 mth, 3 wks, 9 hr, 1,342 sec"
secondRange.formatted(.components(style: .abbreviated, fields: [.day, .month, .year, .hour, .second, .week]))

// "21yrs 1mth 3wks 9hr 1,342sec"
secondRange.formatted(.components(style: .narrow, fields: [.day, .month, .year, .hour, .second, .week]))

// "21 years, 1 month, 3 weeks, 9 hours, 1,342 seconds"
secondRange.formatted(.components(style: .wide, fields: [.day, .month, .year, .hour, .second, .week]))

// "twenty-one years, one month, three weeks, nine hours, one thousand three hundred forty-two seconds"
secondRange.formatted(.components(style: .spellOut, fields: [.day, .month, .year, .hour, .second, .week]))

// "21y 1mo 3w 9h 1,342s"
secondRange.formatted(.components(style: .condensedAbbreviated, fields: [.day, .month, .year, .hour, .second, .week]))

// MARK: - Setting Locale

let franceLocale = Locale(identifier: "fr_FR")
// "vingt-et-un ans, un mois, trois semaines, neuf heures et mille trois cent quarante-deux secondes"
secondRange.formatted(.components(style: .spellOut, fields: [.day, .month, .year, .hour, .second, .week]).locale(franceLocale))

// MARK: - Custom Date.ComponentsFormatStyle

let componentsFormat = Date.ComponentsFormatStyle(
    style: .wide,
    locale: Locale(identifier: "fr_FR"),
    calendar: Calendar(identifier: .gregorian),
    fields: [
        .day,
        .month,
        .year,
        .hour,
        .second,
        .week,
    ]
)

componentsFormat.format(secondRange) // "21 ans, 1 mois, 3 semaines, 9 heures et 1 342 secondes"
secondRange.formatted(componentsFormat) // "21 ans, 1 mois, 3 semaines, 9 heures et 1 342 secondes"

struct InFrench: FormatStyle {
    typealias FormatInput = Range<Date>
    typealias FormatOutput = String

    static let componentsFormat = Date.ComponentsFormatStyle(
        style: .wide,
        locale: Locale(identifier: "fr_FR"),
        calendar: Calendar(identifier: .gregorian),
        fields: [
            .day,
            .month,
            .year,
            .hour,
            .second,
            .week,
        ]
    )

    func format(_ value: Range<Date>) -> String {
        InFrench.componentsFormat.format(value)
    }
}

extension FormatStyle where Self == InFrench {
    static var inFrench: InFrench { .init() }
}

secondRange.formatted(.inFrench) // "21 ans, 1 mois, 3 semaines, 9 heures et 1 342 secondes"
