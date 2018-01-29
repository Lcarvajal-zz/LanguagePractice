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
    private var messageManager: MessageManager?
    
    override func setUp() {
        super.setUp()
        
        messageManager = MessageManager()
        XCTAssertNotNil(messageManager, "Not able to initialize message manager object.")
    }
    
    override func tearDown() {
        messageManager = nil

        super.tearDown()
    }
    
    // MARK: - Language
    
    internal func testEnglishLanguage() {
        let englishMessage = "Hello, my name is Lukas and I love soccer!"
        XCTAssertEqual(.english, Language(for: englishMessage),
                       "Did not convert message to English language.")
    }
    
    internal func testGermanLanguage() {
        let germanMessage = "Hallo, ich heiße Lukas und ich liebe Fußball!"
        XCTAssertEqual(.german, Language(for: germanMessage),
                       "Did not convert message to German language.")
    }
    
    internal func testSpanishLanguage() {
        let spanishMessage = "Hola, me llamo Lukas y me encanta el fútbol!"
        XCTAssertEqual(.spanish, Language(for: spanishMessage),
                       "Did not convert message to Spanish language.")
    }
    
    internal func testNotSupportedLanguage() {
        let notSupportedMessage = "Cześć, jestem Lukas i uwielbiam piłkę nożną"
        XCTAssertEqual(.notSupported, Language(for: notSupportedMessage),
                       "Did not acknowledge not supported language.")
    }
    
    // MARK: - Message Manager
    
    internal func testMessageInputException() {
        if let manager = messageManager {
            
            // Nil input.
            XCTAssertThrowsError(try manager.sendMessage(withText: nil)) { (error) in
                debugPrint(error.localizedDescription)
            }
            
            // No characters.
            XCTAssertThrowsError(try manager.sendMessage(withText: "")) { (error) in
                debugPrint(error.localizedDescription)
            }
            
            // Only whitespace and new lines.
            XCTAssertThrowsError(try manager.sendMessage(withText: "  \n    ")) { (error) in
                debugPrint(error.localizedDescription)
            }
            
            // Greater than 70 characters.
            let giantText = String(repeating: "A", count: 71)
            XCTAssertThrowsError(try manager.sendMessage(withText: giantText)) { (error) in
                debugPrint(error.localizedDescription)
            }
        }
    }
    
}
