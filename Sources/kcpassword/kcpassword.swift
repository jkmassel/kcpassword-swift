import Foundation

fileprivate let kcpasswordMagicKey = Data([125,137,82,35,210,188,221,234,163,185,31])

public func kcpassword(encrypting password: String) -> Data {
    let passwordData = Data(password.compactMap { $0.asciiValue })
    return passwordData.xor(with: kcpasswordMagicKey)
}

public func kcpassword(decrypting data: Data) -> String {
    let passwordCharacters = data.xor(with: kcpasswordMagicKey)
        .compactMap { Character(UnicodeScalar($0)) }

    return String(passwordCharacters)
        .trimmingCharacters(in: CharacterSet(["\0"]))
}

extension Data {
    func xor(with key: Data) -> Data {
        let passwordLength = self.count
        let keyLength = key.count

        let requiredPadding = Int(ceil(Double(passwordLength) / Double(keyLength))) * keyLength % passwordLength

        var passwordBytes = self
        for _ in 0..<requiredPadding { passwordBytes.append(0) }

        return Data(passwordBytes.enumerated().map {
            let ix = $0.offset % key.count
            return $0.element ^ key[ix]
        })
    }
}
