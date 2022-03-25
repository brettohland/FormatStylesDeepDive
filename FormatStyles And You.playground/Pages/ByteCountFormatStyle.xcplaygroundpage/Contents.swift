import Foundation

let terabyte: Int64 = 1_000_000_000_000

terabyte.formatted(.byteCount(style: .binary))  // "931.32 GB"
terabyte.formatted(.byteCount(style: .decimal)) // "1 TB"
terabyte.formatted(.byteCount(style: .file))    // "1 TB"
terabyte.formatted(.byteCount(style: .memory))  // "931.32 GB"

terabyte.formatted(.byteCount(style: .file, allowedUnits: .bytes)) // "1,000,000,000,000 bytes"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .kb))    // "1,000,000,000 kB"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .mb))    // "1,000,000 MB"

Int64(0).formatted(.byteCount(style: .file, allowedUnits: .mb, spellsOutZero: true))   // "Zero bytes"
Int64(0).formatted(.byteCount(style: .file, allowedUnits: .mb, spellsOutZero: false))  // "0 MB"

terabyte.formatted(.byteCount(style: .file, allowedUnits: .mb, includesActualByteCount: true))  // "1,000,000 MB (1,000,000,000,000 bytes)"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .mb, includesActualByteCount: false)) // "1,000,000 MB"

terabyte.formatted(.byteCount(style: .file, allowedUnits: .all, spellsOutZero: true, includesActualByteCount: true)) // "1 TB (1,000,000,000,000 bytes)"

// Customizing

let franceLocale = Locale(identifier: "fr_FR")

terabyte.formatted(.byteCount(style: .binary).locale(franceLocale)) // "931,32 Go"
terabyte.formatted(.byteCount(style: .decimal).locale(franceLocale)) // "1To"
terabyte.formatted(.byteCount(style: .file).locale(franceLocale)) // "1To"
terabyte.formatted(.byteCount(style: .memory).locale(franceLocale)) // "931,32 Go"

let inFrench = ByteCountFormatStyle(
    style: .memory,
    allowedUnits: .all,
    spellsOutZero: false,
    includesActualByteCount: true,
    locale: Locale(identifier: "fr_FR")
)

inFrench.format(terabyte) // "931,32 Go (1 000 000 000 000 octets)"
terabyte.formatted(inFrench) // "931,32 Go (1 000 000 000 000 octets)"

// MARK: - AttributedString Output

terabyte.formatted(.byteCount(style: .binary).attributed)


