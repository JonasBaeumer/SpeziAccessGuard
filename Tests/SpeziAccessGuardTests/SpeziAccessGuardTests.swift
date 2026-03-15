//
// This source file is part of the Spezi open source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

@testable import SpeziAccessGuard
import Testing


@Test func numericFormatFiltersLetters() {
    let format = PasscodeFormat.numeric(4)
    #expect(format.filteringInvalidCharacters(from: "1a2b") == "12")
    #expect(format.filteringInvalidCharacters(from: "1234") == "1234")
    #expect(format.filteringInvalidCharacters(from: "abcd") == "")
}

@Test func alphanumericFormatFiltersSpecialChars() {
    let format = PasscodeFormat.alphanumeric(6)
    #expect(format.filteringInvalidCharacters(from: "abc!@#") == "abc")
    #expect(format.filteringInvalidCharacters(from: "ab12cd") == "ab12cd")
}

@Test func invalidCharacterMessageIsPresent() {
    #expect(PasscodeFormat.numeric(4).invalidCharacterMessage != nil)
    #expect(PasscodeFormat.alphanumeric(6).invalidCharacterMessage != nil)
}
