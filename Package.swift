// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "GTVSdkIos",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // App host chỉ import wrapper
        .library(
            name: "GTVSdkIosCore",
            targets: ["GTVSdkIosCoreWrapper"]
        ),
        .library(
            name: "GTVSdkIosFull",
            targets: ["GTVSdkIosFullWrapper"]
        )
    ],
    dependencies: [
        // Firebase: bắt buộc dùng version range chuẩn SwiftPM
        .package(
            url: "https://github.com/firebase/firebase-ios-sdk.git",
            from: "12.3.0"
        )
        // Nếu cần thêm Airbridge sau này, có thể mở:
        // .package(url: "https://github.com/airbridge/airbridge-ios-sdk.git", from: "4.8.1"),
    ],
    targets: [

        // MARK: - Core Binary
        .binaryTarget(
            name: "GTVSdkIosCore",
            path: "GTVSdkIos.xcframework"
        ),

        // MARK: - Core Wrapper
        .target(
            name: "GTVSdkIosCoreWrapper",
            dependencies: [
                "GTVSdkIosCore",
                .product(name: "FirebaseMessaging", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk")
                // .product(name: "Airbridge", package: "airbridge-ios-sdk")
            ],
            path: "Sources/GTVSdkIosCoreWrapper"
        ),

        // MARK: - Full Binary
        .binaryTarget(
            name: "GTVSdkIosFull",
            path: "FrameworkFull/GTVSdkIos.xcframework"
        ),

        // MARK: - Full Wrapper
        .target(
            name: "GTVSdkIosFullWrapper",
            dependencies: [
                "GTVSdkIosFull",
                .product(name: "FirebaseMessaging", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk")
                // .product(name: "Airbridge", package: "airbridge-ios-sdk")
            ],
            path: "Sources/GTVSdkIosFullWrapper"
        )
    ]
)
