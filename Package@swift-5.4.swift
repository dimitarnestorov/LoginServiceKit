// swift-tools-version: 5.4

import PackageDescription

let package = Package(
	name: "LoginServiceKit",
	platforms: [
        .macOS("10.6")
	],
    products: [
        .library(
            name: "LoginServiceKit",
            targets: ["LoginServiceKit"]
        ),
    ],
	targets: [
		.target(
			name: "LoginServiceKit",
			path: "Sources",
			publicHeadersPath: "."
		),
        .executableTarget(
            name: "Example",
            dependencies: ["LoginServiceKit"],
            path: "Example",
            resources: [
                .process("Main.xib"),
            ]
        ),
		.testTarget(
			name: "LoginServiceKitTests",
			dependencies: ["LoginServiceKit"],
			path: "Tests"
		),
	]
)
