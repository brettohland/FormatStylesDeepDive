import Foundation

let appleURL = URL(string: "https://apple.com")!
appleURL.formatted() // "https://apple.com"
appleURL.formatted(.url) // "https://apple.com"
appleURL.formatted(.url.locale(Locale(identifier: "fr_FR"))) // "https://apple.com"

var httpComponents = URLComponents(url: appleURL, resolvingAgainstBaseURL: false)!
httpComponents.scheme = "https"
httpComponents.user = "jAppleseed"
httpComponents.password = "Test1234"
httpComponents.host = "apple.com"
httpComponents.port = 80
httpComponents.path = "/macbook-pro"
httpComponents.query = "get-free"
httpComponents.fragment = "someFragmentOfSomething"

let complexURL = httpComponents.url!
let everythingStyle = URL.FormatStyle(
    scheme: .always,
    user: .always,
    password: .always,
    host: .always,
    port: .always,
    path: .always,
    query: .always,
    fragment: .always
)

everythingStyle
    .format(complexURL) // "https://jAppleseed:Test1234@apple.com:80/macbook-pro?get-free#someFragmentOfSomething"

let omitStyle = URL.FormatStyle(
    scheme: .omitIfHTTPFamily,
    user: .omitIfHTTPFamily,
    password: .omitIfHTTPFamily,
    host: .omitIfHTTPFamily,
    port: .omitIfHTTPFamily,
    path: .omitIfHTTPFamily,
    query: .omitIfHTTPFamily,
    fragment: .omitIfHTTPFamily
)

var httpsComponent = httpComponents
httpsComponent.scheme = "https"
let httpsURL = httpsComponent.url!

var ftpComponents = httpComponents
ftpComponents.scheme = "ftp"
let ftpURL = ftpComponents.url!

omitStyle.format(complexURL) // ""
omitStyle.format(httpsURL) // ""
omitStyle.format(ftpURL) // "ftp://jAppleseed@apple.com:80/macbook-pro?get-free#someFragmentOfSomething"

let localhostURL = URL(string: "https://localhost:80/macbook-pro")!

let displayWhen = URL.FormatStyle(
    scheme: .always,
    user: .never,
    password: .never,
    host: .displayWhen(.host, matches: ["localhost"]),
    port: .always,
    path: .always,
    query: .never,
    fragment: .never
)

displayWhen.format(complexURL) // "https://:80/macbook-pro"
displayWhen.format(localhostURL) // "https://localhost:80/macbook-pro"

let omitWhen = URL.FormatStyle(
    scheme: .always,
    user: .never,
    password: .never,
    host: .omitWhen(.host, matches: ["localhost"]),
    port: .always,
    path: .always,
    query: .never,
    fragment: .never
)

omitWhen.format(complexURL) // "https://apple.com:80/macbook-pro"
omitWhen.format(localhostURL) // "https://:80/macbook-pro"

let omitSpecificWhen = URL.FormatStyle(
    scheme: .always,
    user: .never,
    password: .never,
    host: .omitSpecificSubdomains(["secret"], includeMultiLevelSubdomains: false),
    port: .always,
    path: .always,
    query: .never,
    fragment: .never
)

var secretAppleURL = URL(string: "https://secret.apple.com/macbook-pro")!

omitSpecificWhen.format(complexURL) // "https://apple.com:80/macbook-pro"
omitSpecificWhen.format(secretAppleURL) // "https://apple.com/macbook-pro"

let omitSpecificWhenWhere = URL.FormatStyle(
    scheme: .always,
    user: .never,
    password: .never,
    host: .omitSpecificSubdomains(["secret"], includeMultiLevelSubdomains: false, when: .user, matches: ["jAppleseed"]),
    port: .always,
    path: .always,
    query: .never,
    fragment: .never
)

let complexSecretURL =
    URL(string: "https://jAppleseed:Test1234@secret.apple.com:80/macbook-pro?get-free#someFragmentOfSomething")!

omitSpecificWhenWhere.format(complexSecretURL) // "https://apple.com:80/macbook-pro"
omitSpecificWhenWhere.format(secretAppleURL) // "https://secret.apple.com/macbook-pro"

let parsedURL = URL(string: "https://jAppleseed:Test1234@apple.com:80/macbook-pro?get-free#someFragmentOfSomething")

do {
    try URL.FormatStyle.Strategy(port: .defaultValue(80)).parse("http://www.apple.com") // http://www.apple.com:80
    try URL.FormatStyle.Strategy(port: .optional).parse("http://www.apple.com") // http://www.apple.com
    try? URL.FormatStyle.Strategy(port: .required).parse("http://www.apple.com") // nil

    // This returns a valid URL
    try URL.FormatStyle.Strategy()
        .scheme(.required)
        .user(.required)
        .password(.required)
        .host(.required)
        .port(.required)
        .path(.required)
        .query(.required)
        .fragment(.required)
        .parse("https://jAppleseed:Test1234@apple.com:80/macbook-pro?get-free#someFragmentOfSomething")

    // This throws an error
    try URL.FormatStyle.Strategy()
        .scheme(.required)
        .user(.required)
        .password(.required)
        .host(.required)
        .port(.required)
        .path(.required)
        .query(.required)
        .fragment(.required)
        .parse("https://jAppleseed:Test1234@apple.com/macbook-pro?get-free#someFragmentOfSomething")

} catch {
    print(error)
}
