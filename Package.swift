// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "predictor",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "predictor", targets: ["predictor"]),
        .library(name: "espnpredictor", targets: ["espnpredictor"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Engagecraft-Solutions/gaming-core-ios-espn", exact: "1.0.1"),
        .package(url: "https://github.com/Alamofire/Alamofire", exact: "5.9.1"),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON", exact: "5.0.2"),
        .package(url: "https://github.com/onevcat/Kingfisher", from: "7.11.0"),
    ],
    targets: [
        .target( 
            name: "predictor",
            dependencies: [
                "bpredictor",
                .product(name: "GamesLib", package: "gaming-core-ios-espn"),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "SwiftyJSON", package: "SwiftyJSON"),
                .product(name: "Kingfisher", package: "Kingfisher"),
            ], 
            path: "Sources/predictor",
             resources: [.process("Assets")],
        ),   
        .binaryTarget( 
            name: "bpredictor", 
            path: "predictor.xcframework"
        ),
        .target(
             name: "espnpredictor",
             path: "Sources/predictorespn",
             resources: [
                 .process("Assets")
             ]
         ),
    ],
    swiftLanguageVersions: [.v5]
)
