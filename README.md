# DNLoginServiceKit
[![Actions Status](https://github.com/dimitarnestorov/DNLoginServiceKit/workflows/CI/badge.svg)](https://github.com/dimitarnestorov/DNLoginServiceKit/actions)
[![License: Apache-2.0](https://img.shields.io/github/license/dimitarnestorov/DNLoginServiceKit.svg)](https://github.com/dimitarnestorov/DNLoginServiceKit/blob/master/LICENSE)

Easily manage login items in macOS.

## Installation

### Carthage

```
github "dimitarnestorov/DNLoginServiceKit"
```

### CocoaPods

```ruby
pod 'DNLoginServiceKit', :git => 'https://github.com/dimitarnestorov/DNLoginServiceKit.git'
```

## Example
#### Check if login item exists
```objc
BOOL loginItemExists = DNLoginServiceKit.loginItemExists;
```

#### Add login item 
```objc
[DNLoginServiceKit addLoginItem];
```

#### Remove login item
```objc
[DNLoginServiceKit removeLoginItem];
```

## About Deprecated APIs
DNLoginServiceKit uses an API that has been deprecated since macOS 10.11 El Capitan. However, there is no API migration destination that meets the current specifications.

See this [issue](https://github.com/Clipy/LoginServiceKit/issues/10) for more details.
