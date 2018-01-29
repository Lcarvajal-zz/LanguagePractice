//
//  MessageManager.swift
//  LanguagePractice
//
//  Created by Lukas Carvajal on 1/29/18.
//  Copyright © 2018 Lukas Carvajal. All rights reserved.
//

import UIKit

class MessageManager: NSObject {
    internal var messages: [Message]!
    
    override init() {
        super.init()
        
        messages = []
        let welcomeMessage = Message(text: "Hi, welcome to the language practice app.", from: .chatBot)
        messages.append(welcomeMessage)
    }
    
    internal func sendMessage(withText input: String?) throws {
        
        // Check message requirements before sending.
        guard let input = input else {
            throw MessageInputError.nilInput
        }
        
        guard input.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 else {
            throw MessageInputError.notEnoughCharacters
        }
        
        guard input.count < 70 else {
            throw MessageInputError.exceedsCharacterLimit
        }
    }
}
