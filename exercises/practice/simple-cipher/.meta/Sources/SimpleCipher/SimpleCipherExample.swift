import Foundation

public struct Cipher {
  private let abc = "abcdefghijklmnopqrstuvwxyz"
  private var alphabet: [Character] { return Array(abc) }
  private(set) var key: String = ""
  private var keyArray: [Character] { return Array(key) }
  private func randomKeySet() -> String {
    var tempKey = ""
    for _ in (0..<100).enumerated() {
      tempKey.append(alphabet[Int.random(in: 0..<alphabet.count)])
    }
    return tempKey
  }
  init() {
    key = randomKeySet()
  }
  init?(key: String) {
    if isLowerCaseAlfabet(key) {
      self.key = key

      if key.isEmpty {
        return nil
      }
    } else {
      return nil
      //self.key = randomKeySet() // Alternative non Optional faiulure
    }
  }
  func isLowerCaseAlfabet(_ inkey: String) -> Bool {
    var valid = true
    inkey.forEach {

      if "abcdefghijklmnopqrstuvwxyz".contains(String($0)) == false {
        valid = false
      }
    }
    return valid
  }
  func encode(_ plaintext: String) -> String {
    let plainTextArray = Array(plaintext)

    func encodeCharacter(_ plaintext: String, idx: Int) -> Character {
      //let plainTextArray = Array(plaintext) // hack for subscript support for Strings
      var alphabetIdx: Int =
        (alphabet.firstIndex(of: plainTextArray[idx]) ?? 0)
        + (alphabet.firstIndex(of: keyArray[idx % keyArray.count]) ?? 0)
      if alphabetIdx >= alphabet.count {
        alphabetIdx -= alphabet.count
      }
      return alphabet[alphabetIdx]
    }

    var ciphertext = ""
    for i in 0..<plainTextArray.count {
      ciphertext.append(encodeCharacter(plaintext, idx: i))
    }
    return ciphertext
  }

  func decode(_ ciphertext: String) -> String {
    let cipherTextArray = Array(ciphertext)

    func decodeCharacter(_ ciphertext: String, idx: Int) -> Character {
      //let cipherTextArray = Array(ciphertext) // no native subscript for String
      var alphabetIdx: Int =
        (alphabet.firstIndex(of: cipherTextArray[idx]) ?? 0)
        - (alphabet.firstIndex(of: keyArray[idx % keyArray.count]) ?? 0)
      if alphabetIdx < 0 {
        alphabetIdx += alphabet.count
      }
      return alphabet[alphabetIdx]
    }
    var plaintext = ""

    for i in 0..<cipherTextArray.count {
      plaintext.append(decodeCharacter(ciphertext, idx: i))
    }
    return plaintext
  }
}
