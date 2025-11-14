// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "GTVPrivateSpecs",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "GTVSdkIosCore", targets: ["GTVSdkIosCoreWrapper"]),
        .library(name: "GTVSdkIosFull", targets: ["GTVSdkIosFullWrapper"])
    ],
    dependencies: [
       .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "12.3.0"),
       .package(url: "https://github.com/airbridge/airbridge-ios-sdk.git", from: "4.8.1"),
       .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "12.11.0")
    ],
    targets: [
        // MARK: Core Binary
        .binaryTarget(
            name: "GTVSdkIosCore",
            path: "GTVSdkIos.xcframework"
        ),

        // MARK: Core Wrapper
        .target(
            name: "GTVSdkIosCoreWrapper",
            dependencies: [
                "GTVSdkIosCore",
                .product(name: "FirebaseMessaging",  package: "firebase-ios-sdk"),
                .product(name: "FirebaseAnalytics",  package: "firebase-ios-sdk"),
                .product(name: "Airbridge", package: "Airbridge")
            ],
            path: "Sources/GTVSdkIosCoreWrapper"
        ),

        // MARK: Full Binary
        .binaryTarget(
            name: "GTVSdkIosFull",
            path: "FrameworkFull/GTVSdkIos.xcframework"
        ),

        // MARK: Full Wrapper
        .target(
            name: "GTVSdkIosFullWrapper",
            dependencies: [
                "GTVSdkIosFull",
            ],
            path: "Sources/GTVSdkIosFullWrapper"
        )
    ]
)

