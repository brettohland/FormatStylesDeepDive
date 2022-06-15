import Foundation

let thePast = Calendar(identifier: .gregorian).date(byAdding: .day, value: -14, to: Date())!

thePast.formatted(.relative(presentation: .numeric, unitsStyle: .abbreviated)) // "2 wk. ago"
thePast.formatted(.relative(presentation: .numeric, unitsStyle: .narrow)) // "2 wk. ago"
thePast.formatted(.relative(presentation: .numeric, unitsStyle: .spellOut)) // "two weeks ago"
thePast.formatted(.relative(presentation: .numeric, unitsStyle: .wide)) // "2 weeks ago"
thePast.formatted(.relative(presentation: .named, unitsStyle: .abbreviated)) // "2 wk. ago"
thePast.formatted(.relative(presentation: .named, unitsStyle: .narrow)) // "2 wk. ago"
thePast.formatted(.relative(presentation: .named, unitsStyle: .spellOut)) // "two weeks ago"
thePast.formatted(.relative(presentation: .named, unitsStyle: .wide)) // "2 weeks ago"

// MARK: - Set Locale

let franceLocale = Locale(identifier: "fr_FR")
thePast.formatted(.relative(presentation: .named, unitsStyle: .spellOut).locale(franceLocale)) // "il y a deux semaines"

// MARK: - Custom RelativeFormatStyle

let relativeInFrench = Date.RelativeFormatStyle(
    presentation: .named,
    unitsStyle: .spellOut,
    locale: Locale(identifier: "fr_FR"),
    calendar: Calendar(identifier: .gregorian),
    capitalizationContext: .beginningOfSentence
)

thePast.formatted(relativeInFrench) // "Il y a deux semaines"
relativeInFrench.format(thePast) // "Il y a deux semaines"

