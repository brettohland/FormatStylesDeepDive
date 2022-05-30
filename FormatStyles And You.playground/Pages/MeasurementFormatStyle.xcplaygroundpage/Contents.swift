import Foundation

// MARK: - Measurement.FormatStyle

let gForce = Measurement(value: 1.0, unit: UnitAcceleration.gravity)

gForce.formatted(.measurement(width: .wide)) // "1 g-force"
gForce.formatted(.measurement(width: .narrow)) // "1G"
gForce.formatted(.measurement(width: .abbreviated)) // "1 G"

let franceLocale = Locale(identifier: "fr_FR")

gForce.formatted(.measurement(width: .wide).locale(franceLocale)) // "1 fois l’accélération de pesanteur terrestre"
gForce.formatted(.measurement(width: .narrow).locale(franceLocale)) // "1G"
gForce.formatted(.measurement(width: .abbreviated).locale(franceLocale)) // "1 force g"

// MARK: - Customizing

let inFrench = Measurement<UnitAcceleration>.FormatStyle(
    width: .wide,
    locale: Locale(identifier: "fr_FR"),
    usage: .general
)

inFrench.format(gForce) // "1 fois l’accélération de pesanteur terrestre"
gForce.formatted(inFrench) // "1 fois l’accélération de pesanteur terrestre"

// MARK: - Custom Measurement FormatStyle

struct InFrench: FormatStyle {
    typealias FormatInput = Measurement<UnitAcceleration>
    typealias FormatOutput = String

    static let formatter = Measurement<UnitAcceleration>.FormatStyle(
        width: .wide,
        locale: Locale(identifier: "fr_FR"),
        usage: .general
    )

    func format(_ value: Measurement<UnitAcceleration>) -> String {
        InFrench.formatter.format(value)
    }
}

extension FormatStyle where Self == InFrench {
    static var inFrench: InFrench { .init() }
}

gForce.formatted(.inFrench) // "1 fois l’accélération de pesanteur terrestre"

// MARK: - Output Attributed Strings

gForce.formatted(.measurement(width: .wide).attributed)
gForce.formatted(.measurement(width: .narrow).attributed)
gForce.formatted(.measurement(width: .abbreviated).attributed)
