// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "GTVSdkIos",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Export wrapper — app host chỉ import wrapper
        .library(name: "GTVSdkIosCore", targets: ["GTVSdkIosCoreWrapper"]),
        .library(name: "GTVSdkIosFull", targets: ["GTVSdkIosFullWrapper"])
    ],
    dependencies: [
        // Firebase SDK, flexible versioning
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", upToNextMajor: "12.3.0"),
        // Uncomment nếu dùng Airbridge
        // .package(url: "https://github.com/airbridge/airbridge-ios-sdk.git", from: "4.8.1"),
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
                "GTVSdkIosCore", // match binary target
                .product(name: "FirebaseMessaging", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
                // .product(name: "Airbridge", package: "airbridge-ios-sdk") // nếu cần
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
                // .product(name: "Airbridge", package: "airbridge-ios-sdk") // nếu cần
            ],
            path: "Sources/GTVSdkIosFullWrapper"
        )
    ]
)

