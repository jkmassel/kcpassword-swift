# kcpassword

A Swift implementation of the kcpassword encryption used for automatic user login.

## Usage

To encrypt a password:

```swift
let password = "my-password"
let data = kcpassword(encrypting: password)
/// You'll need to be running as `root` for this to work
try data.write(to: URL(fileURLWithPath: "/etc/kcpassword"))
```
To decrypt a password:

```swift
/// You'll need to be running as `root` for this to work
let data = try Data(contentsOf: URL(fileURLWithPath: "/etc/kcpassword"))
let password = kcpassword(decrypting: data)
```
