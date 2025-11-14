// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "GTVSdkIos",
    platforms: [.iOS(.v15)],
    products: [
        // Export wrapper — app host chỉ import wrapper
        .library(name: "GTVSdkIosCore", targets: ["GTVSdkIosCoreWrapper"]),
        .library(name: "GTVSdkIosFull", targets: ["GTVSdkIosFullWrapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", exact: "12.3.0"),
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
                .product(name: "FirebaseMessaging", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
                .product(name: "Airbridge", package: "airbridge-ios-sdk")
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
                .product(name: "FirebaseMessaging", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                .product(name: "Airbridge", package: "airbridge-ios-sdk")
            ],
            path: "Sources/GTVSdkIosFullWrapper"
        )
    ]
)

