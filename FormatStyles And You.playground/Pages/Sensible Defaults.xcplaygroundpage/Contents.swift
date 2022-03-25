import Foundation

// Dates
Date(timeIntervalSinceReferenceDate: 0).formatted() // "12/31/2000, 5:00 PM"

// Measurements
Measurement(value: 20, unit: UnitDuration.minutes).formatted()     // "20 min"
Measurement(value: 300, unit: UnitLength.miles).formatted()        // "300 mi"
Measurement(value: 10, unit: UnitMass.kilograms).formatted()       // "22 lb"
Measurement(value: 100, unit: UnitTemperature.celsius).formatted() // "212°F"

// Numbers
32.formatted()               // "32"
Decimal(20.0).formatted()    // "20"
Float(10.0).formatted()      // "10"
Int(2).formatted()           // "2"
Double(100.0003).formatted() // "100.0003"

// Names
PersonNameComponents(givenName: "Johnny", familyName: "Appleseed").formatted() // "Johnny Appleseed"

// Lists
["Alba", "Bruce", "Carol", "Billson"].formatted() // "Alba, Bruce, Carol, and Billson"

// TimeInterval
let referenceDay = Date(timeIntervalSinceReferenceDate: 0)
(referenceDay ..< referenceDay.addingTimeInterval(200)).formatted() // "12/31/00, 5:00 – 5:03 PM"


