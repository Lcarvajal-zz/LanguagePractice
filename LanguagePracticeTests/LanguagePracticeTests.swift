//
//  LanguagePracticeTests.swift
//  LanguagePracticeTests
//
//  Created by Lukas Carvajal on 1/29/18.
//  Copyright © 2018 Lukas Carvajal. All rights reserved.
//

import XCTest
@testable import LanguagePractice

class LanguagePracticeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Language
    
    internal func testEnglishLanguage() {
        let englishMessage = "Hello, my name is Lukas and I love soccer!"
        XCTAssertEqual(.English, Language(for: englishMessage),
                       "Did not convert message to English language.")
    }
    
    internal func testGermanLanguage() {
        let germanMessage = "Hallo, ich heiße Lukas und ich liebe Fußball!"
        XCTAssertEqual(.German, Language(for: germanMessage),
                       "Did not convert message to German language.")
    }
    
    internal func testSpanishLanguage() {
        let spanishMessage = "Hola, me llamo Lukas y me encanta el fútbol!"
        XCTAssertEqual(.Spanish, Language(for: spanishMessage),
                       "Did not convert message to Spanish language.")
    }
    
    internal func testNotSupportedLanguage() {
        let notSupportedMessage = "Cześć, jestem Lukas i uwielbiam piłkę nożną"
        XCTAssertEqual(.NotSupported, Language(for: notSupportedMessage),
                       "Did not acknowledge not supported language.")
    }

}
