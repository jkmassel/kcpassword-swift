# kcpassword

[![Swift](https://github.com/jkmassel/kcpassword-swift/actions/workflows/swift.yml/badge.svg)](https://github.com/jkmassel/kcpassword-swift/actions/workflows/swift.yml)

A Swift implementation of the kcpassword encryption used for automatic user login.

## Usage

Add the dependency using:

```swift
let package = Package(
    // name, platforms, products, etc.
    dependencies: [
        .package(url: "https://github.com/jkmassel/kcpassword-swift", from: "1.0.0"),
        // other dependencies
    ],
    targets: [
        .target(name: "my-app", dependencies: [
            .product(name: "kcpassword", package: "kcpassword-swift"),
        ]),
        // other targets
    ]
)

```


To encrypt a password:

```swift
import kcpassword

let password = "my-password"
let data = kcpassword(encrypting: password)
/// You'll need to be running as `root` for this to work
try data.write(to: URL(fileURLWithPath: "/etc/kcpassword"))
```
To decrypt a password:

```swift
import kcpassword

/// You'll need to be running as `root` for this to work
let data = try Data(contentsOf: URL(fileURLWithPath: "/etc/kcpassword"))
let password = kcpassword(decrypting: data)
```

