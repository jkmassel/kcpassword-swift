import XCTest
@testable import kcpassword

/// A password shorter than the encryption key
private let shortPassword = "password"
private let shortPasswordBytes = shortPassword.data(using: .utf8)
private let shortPasswordEncrypted = Data([13, 232, 33, 80, 165, 211, 175, 142, 163, 185, 31])

/// A password the same length as the encryption key
private let mediumPassword = "passwordenc"
private let mediumPasswordBytes = mediumPassword.data(using: .utf8)
private let mediumPasswordEncrypted = Data([13, 232, 33, 80, 165, 211, 175, 142, 198, 215, 124])

/// A password longer than the encryption key
private let longPassword = "passwordislonglong"
private let longPasswordBytes = longPassword.data(using: .utf8)
private let longPasswordEncrypted = Data([13, 232, 33, 80, 165, 211, 175, 142, 202, 202, 115, 18, 231, 53, 79, 189, 210, 186, 234, 163, 185, 31])


final class kcpasswordTests: XCTestCase {
    func testThatPasswordsShorterThanMagicKeyCanBeEncrypted() {
        XCTAssertEqual(kcpassword(encrypting: shortPassword), shortPasswordEncrypted)
    }
    
    func testThatPasswordsEqualToMagicKeyLengthCanBeEncrypted() {
        XCTAssertEqual(kcpassword(encrypting: mediumPassword), mediumPasswordEncrypted)
    }

    func testThatPasswordsLongerThanMagicKeyCanBeEncrypted() {
        XCTAssertEqual(kcpassword(encrypting: longPassword), longPasswordEncrypted)
    }
    
    func testThatPasswordsShorterThanMagicKeyCanBeDecrypted() {
        XCTAssertEqual(kcpassword(decrypting: shortPasswordEncrypted), shortPassword)
    }

    func testThatPasswordsEqualToMagicKeyLengthCanBeDecrypted() {
        XCTAssertEqual(kcpassword(decrypting: mediumPasswordEncrypted), mediumPassword)
    }
    
    func testThatPasswordsLongerThanMagicKeyCanBeDecrypted() {
        XCTAssertEqual(kcpassword(decrypting: longPasswordEncrypted), longPassword)
    }
}
