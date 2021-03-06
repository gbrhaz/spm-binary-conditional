// swift-tools-version:5.4.0
import PackageDescription

let package = Package(
    name: "spm-binary-conditional",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "iOSOnlyFramework", targets: ["iOSOnlyFramework"])
    ],
    targets: [
        .binaryTarget(
            name: "GoogleCast",
            path: "GoogleCast.xcframework"
        ),
        .target(
            name: "iOSOnlyFramework",
            dependencies: [
                .target(name: "GoogleCast", condition: .when(platforms: [.iOS])),
//                .target(name: "iOSOnlySourceDependency", condition: .when(platforms: [.iOS]))
            ],
            path: "Sources/iOSOnlyFramework"
        ),
        .target(
            name: "iOSOnlySourceDependency",
            path: "Sources/iOSOnlySourceDependency"
        )
    ]
)
