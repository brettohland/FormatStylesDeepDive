import Foundation

let speedLimit = Measurement(value: 100, unit: UnitSpeed.kilometersPerHour)
let drivingDistance = Measurement(value: 200, unit: UnitLength.kilometers)
let averageBaseballThrow = Measurement(value: 70, unit: UnitLength.feet)
let bodyTemperature = Measurement(value: 98.5, unit: UnitTemperature.fahrenheit)

// MARK: FormatStyle String Output

// .formatted uses the current locale for all string output by default.
// This means that different devices will output different values depending
// on the Locale value set on.

speedLimit.formatted() // "62 mph"
drivingDistance.formatted() // "124 mi"
averageBaseballThrow.formatted() // "70 ft"
bodyTemperature.formatted() // "98°F"

// MARK: Width Property

speedLimit.formatted(.measurement(width: .wide)) // "62 miles per hour"
speedLimit.formatted(.measurement(width: .abbreviated)) // "62 mph"
speedLimit.formatted(.measurement(width: .narrow)) // "62mph"

drivingDistance.formatted(.measurement(width: .wide)) // "124 miles"
drivingDistance.formatted(.measurement(width: .abbreviated)) // "124 mi"
drivingDistance.formatted(.measurement(width: .narrow)) // "124mi"

averageBaseballThrow.formatted(.measurement(width: .wide)) // "70 feet"
averageBaseballThrow.formatted(.measurement(width: .abbreviated)) // "70 ft"
averageBaseballThrow.formatted(.measurement(width: .narrow)) // "70'"

bodyTemperature.formatted(.measurement(width: .wide)) // "98 degrees Fahrenheit"
bodyTemperature.formatted(.measurement(width: .abbreviated)) // "98°F"
bodyTemperature.formatted(.measurement(width: .narrow)) // "98°"

// MARK: - Usage

let usa = Locale(identifier: "en-US")
let canada = Locale(identifier: "en-CA")
let sweden = Locale(identifier: "sv-SE")

// MARK: Custom for UnitEnergy

let recommendedCalories = Measurement(value: 2.0, unit: UnitEnergy.kilowattHours)

recommendedCalories.formatted(.measurement(width: .wide, usage: .general).locale(usa)) // "2 kilowatt-hours"
recommendedCalories.formatted(.measurement(width: .wide, usage: .asProvided).locale(usa)) // "2 kilowatt-hours"
recommendedCalories.formatted(.measurement(width: .wide, usage: .food).locale(usa)) // "1,721 Calories"
recommendedCalories.formatted(.measurement(width: .wide, usage: .workout).locale(usa)) // "1,721 Calories"

recommendedCalories.formatted(.measurement(width: .abbreviated, usage: .general).locale(usa)) // "2 kWh"
recommendedCalories.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(usa)) // "2 kWh"
recommendedCalories.formatted(.measurement(width: .abbreviated, usage: .food).locale(usa)) // "1,721 Cal"
recommendedCalories.formatted(.measurement(width: .abbreviated, usage: .workout).locale(usa)) // "1,721 Cal"

recommendedCalories.formatted(.measurement(width: .narrow, usage: .general).locale(usa)) // "2kWh"
recommendedCalories.formatted(.measurement(width: .narrow, usage: .asProvided).locale(usa)) // "2kWh"
recommendedCalories.formatted(.measurement(width: .narrow, usage: .food).locale(usa)) // "1,721Cal"
recommendedCalories.formatted(.measurement(width: .narrow, usage: .workout).locale(usa)) // "1,721Cal"

recommendedCalories.formatted(.measurement(width: .wide, usage: .general).locale(canada)) // "2 kilowatt-hours"
recommendedCalories.formatted(.measurement(width: .wide, usage: .asProvided).locale(canada)) // "2 kilowatt-hours"
recommendedCalories.formatted(.measurement(width: .wide, usage: .food).locale(canada)) // "1,721 Calories"
recommendedCalories.formatted(.measurement(width: .wide, usage: .workout).locale(canada)) // "1,721 Calories"

recommendedCalories.formatted(.measurement(width: .abbreviated, usage: .general).locale(canada)) // "2 kWh"
recommendedCalories.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(canada)) // "2 kWh"
recommendedCalories.formatted(.measurement(width: .abbreviated, usage: .food).locale(canada)) // "1,721 Cal"
recommendedCalories.formatted(.measurement(width: .abbreviated, usage: .workout).locale(canada)) // "1,721 Cal"

recommendedCalories.formatted(.measurement(width: .narrow, usage: .general).locale(canada)) // "2kWh"
recommendedCalories.formatted(.measurement(width: .narrow, usage: .asProvided).locale(canada)) // "2kWh"
recommendedCalories.formatted(.measurement(width: .narrow, usage: .food).locale(canada)) // "1,721Cal"
recommendedCalories.formatted(.measurement(width: .narrow, usage: .workout).locale(canada)) // "1,721Cal"

// MARK: Custom for UnitLength

let myHeight = Measurement(value: 190, unit: UnitLength.centimeters)

myHeight.formatted(.measurement(width: .wide, usage: .general).locale(usa)) // "6.2 feet"
myHeight.formatted(.measurement(width: .wide, usage: .asProvided).locale(usa)) // "190 centimeters"
myHeight.formatted(.measurement(width: .wide, usage: .focalLength).locale(usa)) // "1,900 millimeters"
myHeight.formatted(.measurement(width: .wide, usage: .person).locale(usa)) // "75 inches"
myHeight.formatted(.measurement(width: .wide, usage: .snowfall).locale(usa)) // "75 inches"
myHeight.formatted(.measurement(width: .wide, usage: .road).locale(usa)) // "6 feet"
myHeight.formatted(.measurement(width: .wide, usage: .rainfall).locale(usa)) // "75 inches"
myHeight.formatted(.measurement(width: .wide, usage: .personHeight).locale(usa)) // "6 feet, 2.8 inches"

myHeight.formatted(.measurement(width: .abbreviated, usage: .general).locale(usa)) // "6.2 ft"
myHeight.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(usa)) // "190 cm"
myHeight.formatted(.measurement(width: .abbreviated, usage: .focalLength).locale(usa)) // "1,900 mm"
myHeight.formatted(.measurement(width: .abbreviated, usage: .person).locale(usa)) // "75 in"
myHeight.formatted(.measurement(width: .abbreviated, usage: .snowfall).locale(usa)) // "75 in"
myHeight.formatted(.measurement(width: .abbreviated, usage: .road).locale(usa)) // "6 ft"
myHeight.formatted(.measurement(width: .abbreviated, usage: .rainfall).locale(usa)) // "75 in"
myHeight.formatted(.measurement(width: .abbreviated, usage: .personHeight).locale(usa)) // "6 ft, 2.8 in"

myHeight.formatted(.measurement(width: .narrow, usage: .general).locale(usa)) // "6.2'"
myHeight.formatted(.measurement(width: .narrow, usage: .asProvided).locale(usa)) // "190cm"
myHeight.formatted(.measurement(width: .narrow, usage: .focalLength).locale(usa)) // "1,900mm"
myHeight.formatted(.measurement(width: .narrow, usage: .person).locale(usa)) // "75""
myHeight.formatted(.measurement(width: .narrow, usage: .snowfall).locale(usa)) // "75""
myHeight.formatted(.measurement(width: .narrow, usage: .road).locale(usa)) // "6'"
myHeight.formatted(.measurement(width: .narrow, usage: .rainfall).locale(usa)) // "75""
myHeight.formatted(.measurement(width: .narrow, usage: .personHeight).locale(usa)) // "6'2.8""

myHeight.formatted(.measurement(width: .wide, usage: .general).locale(canada)) // "1.9 metres"
myHeight.formatted(.measurement(width: .wide, usage: .asProvided).locale(canada)) // "190 centimetres"
myHeight.formatted(.measurement(width: .wide, usage: .focalLength).locale(canada)) // "1,900 millimetres"
myHeight.formatted(.measurement(width: .wide, usage: .person).locale(canada)) // "75 inches"
myHeight.formatted(.measurement(width: .wide, usage: .snowfall).locale(canada)) // "190 centimetres"
myHeight.formatted(.measurement(width: .wide, usage: .road).locale(canada)) // "2 metres"
myHeight.formatted(.measurement(width: .wide, usage: .rainfall).locale(canada)) // "1,900 millimetres"
myHeight.formatted(.measurement(width: .wide, usage: .personHeight).locale(canada)) // "6 feet, 2.8 inches"

myHeight.formatted(.measurement(width: .abbreviated, usage: .general).locale(canada)) // "1.9m"
myHeight.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(canada)) // "190 cm"
myHeight.formatted(.measurement(width: .abbreviated, usage: .focalLength).locale(canada)) // "1,900 mm"
myHeight.formatted(.measurement(width: .abbreviated, usage: .person).locale(canada)) // "75 in"
myHeight.formatted(.measurement(width: .abbreviated, usage: .snowfall).locale(canada)) // "190 in"
myHeight.formatted(.measurement(width: .abbreviated, usage: .road).locale(canada)) // "2 m"
myHeight.formatted(.measurement(width: .abbreviated, usage: .rainfall).locale(canada)) // "1,900 mm"
myHeight.formatted(.measurement(width: .abbreviated, usage: .personHeight).locale(canada)) // "6 ft, 2.8 in"

myHeight.formatted(.measurement(width: .narrow, usage: .general).locale(canada)) // "1.9m"
myHeight.formatted(.measurement(width: .narrow, usage: .asProvided).locale(canada)) // "190cm"
myHeight.formatted(.measurement(width: .narrow, usage: .focalLength).locale(canada)) // "1,900mm"
myHeight.formatted(.measurement(width: .narrow, usage: .person).locale(canada)) // "75""
myHeight.formatted(.measurement(width: .narrow, usage: .snowfall).locale(canada)) // "190cm"
myHeight.formatted(.measurement(width: .narrow, usage: .road).locale(canada)) // "2m"
myHeight.formatted(.measurement(width: .narrow, usage: .rainfall).locale(canada)) // "1,900mm"
myHeight.formatted(.measurement(width: .narrow, usage: .personHeight).locale(canada)) // "6'2.8""

// MARK: Custom for UnitMass

let averageWeight = Measurement(value: 197.9, unit: UnitMass.pounds)

averageWeight.formatted(.measurement(width: .wide, usage: .general).locale(usa)) // "198 pounds"
averageWeight.formatted(.measurement(width: .wide, usage: .asProvided).locale(usa)) // "197.9 pounds"
averageWeight.formatted(.measurement(width: .wide, usage: .personWeight).locale(usa)) // "198 pounds"

averageWeight.formatted(.measurement(width: .abbreviated, usage: .general).locale(usa)) // "198 lb"
averageWeight.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(usa)) // "197.9 lb"
averageWeight.formatted(.measurement(width: .abbreviated, usage: .personWeight).locale(usa)) // "198 lb"

averageWeight.formatted(.measurement(width: .narrow, usage: .general).locale(usa)) // "198#"
averageWeight.formatted(.measurement(width: .narrow, usage: .asProvided).locale(usa)) // "197.9#"
averageWeight.formatted(.measurement(width: .narrow, usage: .personWeight).locale(usa)) // "198#"

averageWeight.formatted(.measurement(width: .wide, usage: .general).locale(canada)) // "90 kilograms"
averageWeight.formatted(.measurement(width: .wide, usage: .asProvided).locale(canada)) // "197.9 pounds"
averageWeight.formatted(.measurement(width: .wide, usage: .personWeight).locale(canada)) // "90 kilograms"

averageWeight.formatted(.measurement(width: .abbreviated, usage: .general).locale(canada)) // "90 kg"
averageWeight.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(canada)) // "197.9 lb"
averageWeight.formatted(.measurement(width: .abbreviated, usage: .personWeight).locale(canada)) // "90 kg"

averageWeight.formatted(.measurement(width: .narrow, usage: .general).locale(canada)) // "90kg"
averageWeight.formatted(.measurement(width: .narrow, usage: .asProvided).locale(canada)) // "197.9lb"
averageWeight.formatted(.measurement(width: .narrow, usage: .personWeight).locale(canada)) // "90kg"

// MARK: Custom for UnitTemperature

let aNiceDay = Measurement(value: 25.0, unit: UnitTemperature.celsius)

aNiceDay.formatted(.measurement(width: .wide, usage: .general).locale(usa)) // "77 degrees Fahrenheit"
aNiceDay.formatted(.measurement(width: .wide, usage: .asProvided).locale(usa)) // "25 degrees Celsius"
aNiceDay.formatted(.measurement(width: .wide, usage: .person).locale(usa)) // "77 degrees Fahrenheit"
aNiceDay.formatted(.measurement(width: .wide, usage: .weather).locale(usa)) // "77 degrees Fahrenheit"

aNiceDay.formatted(.measurement(width: .abbreviated, usage: .general).locale(usa)) // "77°F"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(usa)) // "25°C"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .person).locale(usa)) // "77°F"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .weather).locale(usa)) // "77°F"

aNiceDay.formatted(.measurement(width: .narrow, usage: .general).locale(usa)) // "77°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .asProvided).locale(usa)) // "25°C"
aNiceDay.formatted(.measurement(width: .narrow, usage: .person).locale(usa)) // "77°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .weather).locale(usa)) // "77°"

aNiceDay.formatted(.measurement(width: .wide, usage: .general, hidesScaleName: true).locale(usa)) // "77 degrees Fahrenheit"
aNiceDay.formatted(.measurement(width: .wide, usage: .asProvided, hidesScaleName: true).locale(usa)) // "25 degrees"
aNiceDay .formatted(.measurement(width: .wide, usage: .person, hidesScaleName: true).locale(usa)) // "77 degrees Fahrenheit"
aNiceDay .formatted(.measurement(width: .wide, usage: .weather, hidesScaleName: true).locale(usa)) // "77 degrees Fahrenheit"

aNiceDay.formatted(.measurement(width: .abbreviated, usage: .general, hidesScaleName: true).locale(usa)) // "77°F"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .asProvided, hidesScaleName: true).locale(usa)) // "25°"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .person, hidesScaleName: true).locale(usa)) // "77°F"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .weather, hidesScaleName: true).locale(usa)) // "77°F"

aNiceDay.formatted(.measurement(width: .narrow, usage: .general, hidesScaleName: true).locale(usa)) // "77°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .asProvided, hidesScaleName: true).locale(usa)) // "25°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .person, hidesScaleName: true).locale(usa)) // "77°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .weather, hidesScaleName: true).locale(usa)) // "77°"

aNiceDay.formatted(.measurement(width: .wide, usage: .general).locale(canada)) // "25 degrees Celsius"
aNiceDay.formatted(.measurement(width: .wide, usage: .asProvided).locale(canada)) // "25 degrees Celsius"
aNiceDay.formatted(.measurement(width: .wide, usage: .person).locale(canada)) // "25 degrees Celsius"
aNiceDay.formatted(.measurement(width: .wide, usage: .weather).locale(canada)) // "25 degrees Celsius"

aNiceDay.formatted(.measurement(width: .abbreviated, usage: .general).locale(canada)) // "25°C"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(canada)) // "25°C"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .person).locale(canada)) // "25°C"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .weather).locale(canada)) // "25°C"

aNiceDay.formatted(.measurement(width: .narrow, usage: .general).locale(canada)) // "25°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .asProvided).locale(canada)) // "25°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .person).locale(canada)) // "25°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .weather).locale(canada)) // "25°"

aNiceDay .formatted(.measurement(width: .wide, usage: .general, hidesScaleName: true).locale(canada)) // "25 degrees Celsius"
aNiceDay.formatted(.measurement(width: .wide, usage: .asProvided, hidesScaleName: true).locale(canada)) // "25 degrees"
aNiceDay .formatted(.measurement(width: .wide, usage: .person, hidesScaleName: true).locale(canada)) // "25 degrees Celsius"
aNiceDay .formatted(.measurement(width: .wide, usage: .weather, hidesScaleName: true).locale(canada)) // "25 degrees Celsius"

aNiceDay.formatted(.measurement(width: .abbreviated, usage: .general, hidesScaleName: true).locale(canada)) // "25°C"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .asProvided, hidesScaleName: true).locale(canada)) // "25°"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .person, hidesScaleName: true).locale(canada)) // "25°C"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .weather, hidesScaleName: true).locale(canada)) // "25°C"

aNiceDay.formatted(.measurement(width: .narrow, usage: .general, hidesScaleName: true).locale(canada)) // "25°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .asProvided, hidesScaleName: true).locale(canada)) // "25°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .person, hidesScaleName: true).locale(canada)) // "25°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .weather, hidesScaleName: true).locale(canada)) // "25°"

// MARK: Custom for UnitVolume

let onePint = Measurement(value: 1, unit: UnitVolume.pints)

onePint.formatted(.measurement(width: .wide, usage: .general).locale(usa)) // "31 cubic inches"
onePint.formatted(.measurement(width: .wide, usage: .asProvided).locale(usa)) // "1 metric pint"
onePint.formatted(.measurement(width: .wide, usage: .liquid).locale(usa)) // "1.1 pints"

onePint.formatted(.measurement(width: .abbreviated, usage: .general).locale(usa)) // "31 in³"
onePint.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(usa)) // "1 mpt"
onePint.formatted(.measurement(width: .abbreviated, usage: .liquid).locale(usa)) // "1.1 pt"

onePint.formatted(.measurement(width: .narrow, usage: .general).locale(usa)) // "31in³"
onePint.formatted(.measurement(width: .narrow, usage: .asProvided).locale(usa)) // "1mpt"
onePint.formatted(.measurement(width: .narrow, usage: .liquid).locale(usa)) // "1.1pt"

onePint.formatted(.measurement(width: .wide, usage: .general).locale(canada)) // "500 cubic centimetres"
onePint.formatted(.measurement(width: .wide, usage: .asProvided).locale(canada)) // "1 metric pint"
onePint.formatted(.measurement(width: .wide, usage: .liquid).locale(canada)) // "500 millilitres"

onePint.formatted(.measurement(width: .abbreviated, usage: .general).locale(canada)) // "500/cu cm"
onePint.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(canada)) // "1 mpt"
onePint.formatted(.measurement(width: .abbreviated, usage: .liquid).locale(canada)) // "500 mL"

onePint.formatted(.measurement(width: .narrow, usage: .general).locale(canada)) // "500cm³"
onePint.formatted(.measurement(width: .narrow, usage: .asProvided).locale(canada)) // "1mpt"
onePint.formatted(.measurement(width: .narrow, usage: .liquid).locale(canada)) // "500mL"

// MARK: - NumberFormatStyle

// See Number Style for more options.

// "6 feet, 3 inches"
myHeight.formatted(
    .measurement(
        width: .wide,
        usage: .personHeight,
        numberFormatStyle: .number.precision(.fractionLength(0))
    )
    .locale(usa)
)

// "6 ft, 3 in"
myHeight.formatted(
    .measurement(
        width: .abbreviated,
        usage: .personHeight,
        numberFormatStyle: .number.precision(.fractionLength(0))
    )
    .locale(usa)
)

// "6′ 3″"
myHeight.formatted(
    .measurement(
        width: .narrow,
        usage: .personHeight,
        numberFormatStyle: .number.precision(.fractionLength(0))
    )
    .locale(usa)
)
