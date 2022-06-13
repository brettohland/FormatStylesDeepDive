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
guest.formatted(.name(style: .short)) // "Liza"
guest.formatted(.name(style: .medium)) // "Elizabeth Smith"
guest.formatted(.name(style: .long)) // "Dr Elizabeth Jillian Smith Esq."

let chinaLocale = Locale(identifier: "zh_CN")

guest.formatted(.name(style: .abbreviated).locale(chinaLocale)) // "SE"
guest.formatted(.name(style: .short).locale(chinaLocale)) // "Liza"
guest.formatted(.name(style: .medium).locale(chinaLocale)) // "Smith Elizabeth"
guest.formatted(.name(style: .long).locale(chinaLocale)) // "Dr Smith Elizabeth Jillian Esq."

// Parsing

let parsingStyle = PersonNameComponents.FormatStyle(style: .long)

// namePrefix: Dr givenName: Elizabeth middleName: Jillian familyName: Smith nameSuffix: Esq.
try? parsingStyle.parseStrategy.parse("Dr Elizabeth Jillian Smith Esq.")
try? PersonNameComponents("Dr Elizabeth Jillian Smith Esq.", strategy: parsingStyle.parseStrategy)
try? PersonNameComponents("Dr Elizabeth Jillian Smith Esq.")
