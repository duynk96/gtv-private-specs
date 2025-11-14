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
        // ❌ Không còn dependencies ngoài
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
                "GTVSdkIosCore"
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
                "GTVSdkIosFull"
            ],
            path: "Sources/GTVSdkIosFullWrapper"
        )
    ]
)
