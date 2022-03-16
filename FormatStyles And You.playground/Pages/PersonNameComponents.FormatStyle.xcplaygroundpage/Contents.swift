//: [Previous](@previous)

import Foundation

let guest = PersonNameComponents(
    namePrefix: "Dr",
    givenName: "Elizabeth",
    middleName: "Jillian",
    familyName: "Smith",
    nameSuffix: "Esq.",
    nickname: "Liza"
)

guest.formatted()

guest.formatted(.name(style: .abbreviated))
guest.formatted(.name(style: .short))
guest.formatted(.name(style: .medium))
guest.formatted(.name(style: .long))

let franceLocale = Locale(identifier: "fr_FR")

guest.formatted(.name(style: .abbreviated).locale(franceLocale))
guest.formatted(.name(style: .short).locale(franceLocale))
guest.formatted(.name(style: .medium).locale(franceLocale))
guest.formatted(.name(style: .long).locale(franceLocale))

let inFrance = PersonNameComponents.FormatStyle(style: .long, locale: Locale(identifier: "fr_FR"))

inFrance.format(guest)
guest.formatted(inFrance)

//: [Next](@next)
