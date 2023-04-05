// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "MoonPhaseForStarPhotography",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "MoonPhaseForStarPhotography",
            targets: ["AppModule"],
            bundleIdentifier: "com.kwansiknam.MoonPhaseForStarPhotography",
            teamIdentifier: "Q535Z3S7Z3",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .bicycle),
            accentColor: .presetColor(.yellow),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait
            ],
            appCategory: .weather
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)