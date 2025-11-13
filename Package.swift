// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "GTVSdkIos",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Tương đương 'Core' subspec
        .library(
            name: "GTVSdkIosCore",
            targets: ["GTVSdkIosCore"]
        ),
        // Tương đương 'Full' subspec
        .library(
            name: "GTVSdkIosFull",
            targets: ["GTVSdkIosFull"]
        ),
    ],
    targets: [
        // MARK: - Core Target
        .binaryTarget(
            name: "GTVSdkIosCore",
            path: "GTVSdkIos.xcframework"
        ),
        // MARK: - Full Target
        .binaryTarget(
            name: "GTVSdkIosFull",
            path: "FrameworkFull/GTVSdkIos.xcframework"
        )
    ]
)
