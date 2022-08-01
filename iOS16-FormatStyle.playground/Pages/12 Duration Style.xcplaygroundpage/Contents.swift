import Foundation

// MARK: - Duration.TimeFormatStyle

Duration.seconds(1_000).formatted() // "0:16:40"

Duration.seconds(1_000).formatted(.time(pattern: .hourMinute)) // "0:17"
Duration.seconds(1_000).formatted(.time(pattern: .hourMinuteSecond)) // "0:16:40"
Duration.seconds(1_000).formatted(.time(pattern: .minuteSecond)) // "16:40"

Duration.TimeFormatStyle(pattern: .hourMinute).format(Duration.seconds(1_000)) // "0:17"
Duration.TimeFormatStyle(pattern: .hourMinuteSecond).format(Duration.seconds(1_000)) // "0:16:40"
Duration.TimeFormatStyle(pattern: .minuteSecond).format(Duration.seconds(1_000)) // "16:40"

Duration.seconds(1_000).formatted(.time(pattern: .hourMinute(padHourToLength: 3, roundSeconds: .awayFromZero))) // "000:17"
Duration.seconds(1_000).formatted(.time(pattern: .hourMinute(padHourToLength: 1, roundSeconds: .down))) // "000:16"
Duration.seconds(1_000)
    .formatted(.time(pattern: .hourMinute(padHourToLength: 1, roundSeconds: .toNearestOrAwayFromZero))) // "0:17"
Duration.seconds(1_000).formatted(.time(pattern: .hourMinute(padHourToLength: 1, roundSeconds: .toNearestOrEven))) // "0:17"
Duration.seconds(1_000).formatted(.time(pattern: .hourMinute(padHourToLength: 1, roundSeconds: .towardZero))) // "0:16"
Duration.seconds(1_000).formatted(.time(pattern: .hourMinute(padHourToLength: 1, roundSeconds: .up))) // "0:17"

Duration.seconds(1_000).formatted(
    .time(
        pattern: .hourMinuteSecond(
            padHourToLength: 3,
            fractionalSecondsLength: 3,
            roundFractionalSeconds: .awayFromZero
        )
    )
) // "000:16:40.000"

Duration.seconds(1_000).formatted(
    .time(
        pattern: .minuteSecond(
            padMinuteToLength: 3,
            fractionalSecondsLength: 3,
            roundFractionalSeconds: .awayFromZero
        )
    )
) // "016:40.000"

// MARK: Setting the Locale

Duration.seconds(1_000).formatted(.time(pattern: .hourMinute).locale(Locale(identifier: "fr_FR"))) // "0:17"

let frenchTimeFormatStyle = Duration.TimeFormatStyle(pattern: .minuteSecond, locale: Locale(identifier: "fr_FR"))

frenchTimeFormatStyle.format(Duration.seconds(1_000)) // "16:40"

// MARK: Attributed String Output

Duration.seconds(1_000).formatted(.time(pattern: .hourMinuteSecond).attributed)

// MARK: - Duration.UnitsFormatStyle

Duration.seconds(100).formatted(.units()) // "1 min, 40 sec"
Duration.UnitsFormatStyle(allowedUnits: [.hours, .minutes, .seconds], width: .abbreviated)
    .format(.seconds(100)) // "1 min, 40 sec"

// MARK: allowed

Duration.milliseconds(500).formatted(.units(allowed: [.nanoseconds])) // "500,000,000 ns"
Duration.milliseconds(500).formatted(.units(allowed: [.microseconds])) // "500,000 μs"
Duration.milliseconds(500).formatted(.units(allowed: [.milliseconds])) // "500 ms"
Duration.milliseconds(500).formatted(.units(allowed: [.seconds])) // "0 sec"
Duration.milliseconds(500).formatted(.units(allowed: [.minutes])) // "0 min"
Duration.milliseconds(500).formatted(.units(allowed: [.hours])) // "0 hr"
Duration.milliseconds(500).formatted(.units(allowed: [.days])) // "0 days"
Duration.milliseconds(500).formatted(.units(allowed: [.weeks])) // "0 wks"

Duration.seconds(1_000_000.00_123).formatted(
    .units(
        allowed: [
            .nanoseconds,
            .milliseconds,
            .milliseconds,
            .seconds,
            .minutes,
            .hours,
            .days,
            .weeks,
        ]
    )
) // "1 wk, 4 days, 13 hr, 46 min, 40 sec, 1 ms, 230,000 ns"

Duration.seconds(1).formatted(
    .units(
        allowed: [
            .nanoseconds,
            .milliseconds,
            .milliseconds,
            .seconds,
            .minutes,
            .hours,
            .days,
            .weeks,
        ]
    )
) // "1 sec"

// MARK: width

Duration.seconds(100).formatted(.units(width: .abbreviated)) // "1 min, 40 sec"
Duration.seconds(100).formatted(.units(width: .condensedAbbreviated)) // "1 min,40 sec"
Duration.seconds(100).formatted(.units(width: .narrow)) // "1m 40s"
Duration.seconds(100).formatted(.units(width: .wide)) // "1 minute, 40 seconds"

// MARK: maximumUnitCount

Duration.seconds(10_000).formatted(.units(maximumUnitCount: 1)) // "3 hr"
Duration.seconds(10_000).formatted(.units(maximumUnitCount: 2)) // "2 hr, 47 min"
Duration.seconds(10_000).formatted(.units(maximumUnitCount: 3)) // "2 hr, 46 min, 40 sec"

// MARK: zeroValueUnits

Duration.seconds(100).formatted(.units(zeroValueUnits: .hide)) // "1 min, 40 sec"
Duration.seconds(100).formatted(.units(zeroValueUnits: .show(length: 1))) // "0 hr, 1 min, 40 sec"
Duration.seconds(100).formatted(.units(zeroValueUnits: .show(length: 3))) // "000 hr, 001 min, 040 sec"

// MARK: valueLength

Duration.seconds(1_000).formatted(.units(valueLength: 1)) // "16 min, 40 sec"
Duration.seconds(1_000).formatted(.units(valueLength: 3)) // "016 min, 040 sec"

// MARK: valueLengthLimits

Duration.seconds(10_000).formatted(.units(valueLengthLimits: 1...)) // This is a bug (Feedback FB10607619)
Duration.seconds(10_000).formatted(.units(valueLengthLimits: ...3)) // "2 hr, 46 min, 40 sec"
Duration.seconds(100).formatted(.units(valueLengthLimits: 2 ... 3)) // "01 min, 40 sec"

// MARK: fractionalPart

Duration.seconds(10.0_023).formatted(.units(fractionalPart: .hide)) // "10 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .hide(rounded: .up))) // "11 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .hide(rounded: .towardZero))) // "10 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .hide(rounded: .toNearestOrEven))) // "10 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .hide(rounded: .toNearestOrAwayFromZero))) // "10 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .hide(rounded: .down))) // "10 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .hide(rounded: .awayFromZero))) // "11 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 0))) // "10 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 5))) // "10.00230 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 3, rounded: .up))) // "10.003 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 3, rounded: .towardZero))) // "10.002 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 3, rounded: .toNearestOrEven))) // "10.002 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 3, rounded: .toNearestOrAwayFromZero))) // "10.002 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 3, rounded: .down))) // "10.002 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 3, rounded: .awayFromZero))) // "10.003 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 3, increment: 1))) // "10.000 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 3, increment: 0.001))) // "10.002 sec"

// MARK: Locale

Duration.seconds(100).formatted(.units().locale(Locale(identifier: "fr_FR"))) // "1 min et 40 s"

// MARK: Attributed String Output

Duration.seconds(100).formatted(.units().attributed)
