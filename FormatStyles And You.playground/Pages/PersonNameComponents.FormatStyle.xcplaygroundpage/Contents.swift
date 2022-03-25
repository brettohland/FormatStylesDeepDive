import Foundation

let guest = PersonNameComponents(
    namePrefix: "Dr",
    givenName: "Elizabeth",
    middleName: "Jillian",
    familyName: "Smith",
    nameSuffix: "Esq.",
    nickname: "Liza"
)

guest.formatted() // "Elizabeth Smith"

guest.formatted(.name(style: .abbreviated)) // "ES"
guest.formatted(.name(style: .short))       // "Liza"
guest.formatted(.name(style: .medium))      // "Elizabeth Smith"
guest.formatted(.name(style: .long))        // "Dr Elizabeth Jillian Smith Esq."

let chinaLocale = Locale(identifier: "zh_CN")

guest.formatted(.name(style: .abbreviated).locale(chinaLocale))    // "SE"
guest.formatted(.name(style: .short).locale(chinaLocale))          // "Liza"
guest.formatted(.name(style: .medium).locale(chinaLocale))         // "Smith Elizabeth"
guest.formatted(.name(style: .long).locale(chinaLocale))           // "Dr Smith Elizabeth Jillian Esq."

let inFrance = PersonNameComponents.FormatStyle(style: .long, locale: Locale(identifier: "fr_FR"))

inFrance.format(guest)
guest.formatted(inFrance)


