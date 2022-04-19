# LoginServiceKit
[![Actions Status](https://github.com/dimitarnestorov/LoginServiceKit/workflows/CI/badge.svg)](https://github.com/dimitarnestorov/LoginServiceKit/actions)
[![License: Apache-2.0](https://img.shields.io/github/license/dimitarnestorov/LoginServiceKit.svg)](https://github.com/dimitarnestorov/LoginServiceKit/blob/master/LICENSE)

Easily manage login items in macOS.

## Installation

Add the following to your `dependencies` in `Package.swift`:

```swift
.package(url: "https://github.com/dimitarnestorov/LoginServiceKit", .upToNextMajor(from: "v1.1.0")),
```

## Usage

#### Check if login item exists
```objc
BOOL loginItemExists = LoginServiceKit.loginItemExists;
```

#### Add login item 
```objc
[LoginServiceKit addLoginItem];
```

#### Remove login item
```objc
[LoginServiceKit removeLoginItem];
```

## About Deprecated APIs
LoginServiceKit uses an API that has been deprecated since macOS 10.11 El Capitan. However, there is no API migration destination that meets the current specifications.

See this [issue](https://github.com/Clipy/LoginServiceKit/issues/10) for more details.
