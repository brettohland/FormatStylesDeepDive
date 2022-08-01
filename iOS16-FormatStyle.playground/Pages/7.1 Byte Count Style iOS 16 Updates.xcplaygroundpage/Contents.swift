import Foundation

// MARK: - Int64

let terabyte: Int64 = 1_000_000_000_000

var integerByteCountStyle = ByteCountFormatStyle()
integerByteCountStyle.style = .file
integerByteCountStyle.allowedUnits = [.gb, .tb]
integerByteCountStyle.includesActualByteCount = true

integerByteCountStyle.format(terabyte) // "1 TB (1,000,000,000,000 bytes)"
terabyte.formatted(integerByteCountStyle) // "1 TB (1,000,000,000,000 bytes)"

terabyte.formatted(.byteCount(style: .binary)) // "931.32 GB"
terabyte.formatted(.byteCount(style: .decimal)) // "1 TB"
terabyte.formatted(.byteCount(style: .file)) // "1 TB"
terabyte.formatted(.byteCount(style: .memory)) // "931.32 GB"

terabyte.formatted(.byteCount(style: .file, allowedUnits: .bytes)) // "1,000,000,000,000 bytes"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .bytes)) // "1,000,000,000,000 bytes"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .kb)) // "976,562,500 kB"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .mb)) // "953,674.3 MB"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .gb)) // "931.32 GB"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .tb)) // "0.91 TB"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .pb)) // "0 PB"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .zb)) // "0 PB"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .ybOrHigher)) // 0 PB

Int64(1_000).formatted(.byteCount(style: .file, allowedUnits: [.kb, .mb])) // "1 kB"
Int64(1_000_000).formatted(.byteCount(style: .file, allowedUnits: [.kb, .mb])) // "1 MB"

Int64.zero.formatted(.byteCount(style: .file, spellsOutZero: true)) // "Zero kB"
Int64.zero.formatted(.byteCount(style: .file, spellsOutZero: false)) // "0 bytes"

Int64(1_000).formatted(.byteCount(style: .file, includesActualByteCount: true)) // "1 kB (1,000 bytes)"

let franceLocale = Locale(identifier: "fr_FR")

terabyte.formatted(.byteCount(style: .binary).locale(franceLocale)) // "931,32 Go"
terabyte.formatted(.byteCount(style: .decimal).locale(franceLocale)) // "1To"
terabyte.formatted(.byteCount(style: .file).locale(franceLocale)) // "1To"
terabyte.formatted(.byteCount(style: .memory).locale(franceLocale)) // "931,32 Go"

terabyte.formatted(.byteCount(style: .binary).attributed)

// MARK: - Measurement

let terabyteMeasurement = Measurement(value: 1, unit: UnitInformationStorage.terabytes)

terabyteMeasurement.formatted(.byteCount(style: .binary)) // "931.32 GB"
terabyteMeasurement.formatted(.byteCount(style: .decimal)) // "1 TB"
terabyteMeasurement.formatted(.byteCount(style: .file)) // "1 TB"
terabyteMeasurement.formatted(.byteCount(style: .memory)) // "931.32 GB"

terabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: .bytes)) // "1,000,000,000,000 bytes"
terabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: .bytes)) // "1,000,000,000,000 bytes"
terabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: .kb)) // "976,562,500 kB"
terabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: .mb)) // "953,674.3 MB"
terabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: .gb)) // "931.32 GB"
terabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: .tb)) // "0.91 TB"
terabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: .pb)) // "0 PB"
terabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: .zb)) // "0 PB"
terabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: .ybOrHigher)) // 0 PB

let kilobyteMeasurement = Measurement(value: 1, unit: UnitInformationStorage.kilobytes)
let megabyteMeasurement = Measurement(value: 1, unit: UnitInformationStorage.megabytes)

kilobyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: [.kb, .mb])) // "1 kB"
megabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: [.kb, .mb])) // "1 MB"

let zeroMeasurement = Measurement(value: 0, unit: UnitInformationStorage.bytes)

zeroMeasurement.formatted(.byteCount(style: .file, spellsOutZero: true)) // "Zero kB"
zeroMeasurement.formatted(.byteCount(style: .file, spellsOutZero: false)) // "0 bytes"

megabyteMeasurement.formatted(.byteCount(style: .file, includesActualByteCount: true)) // "1 MB (1,000,000 bytes)"

terabyteMeasurement.formatted(.byteCount(style: .binary).locale(franceLocale)) // "931,32 Go"
terabyteMeasurement.formatted(.byteCount(style: .decimal).locale(franceLocale)) // "1To"
terabyteMeasurement.formatted(.byteCount(style: .file).locale(franceLocale)) // "1To"
terabyteMeasurement.formatted(.byteCount(style: .memory).locale(franceLocale)) // "931,32 Go"

terabyteMeasurement.formatted(.byteCount(style: .binary).attributed)
