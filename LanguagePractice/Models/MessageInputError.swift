//
//  MessageError.swift
//  LanguagePractice
//
//  Created by Lukas Carvajal on 1/29/18.
//  Copyright © 2018 Lukas Carvajal. All rights reserved.
//

import Foundation

public enum MessageInputError : Error {
    case nilInput
    case exceedsCharacterLimit
    case notEnoughCharacters
}

extension MessageInputError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .nilInput:
            return NSLocalizedString("Nil exception.", comment: "The input is nil.")
        case .exceedsCharacterLimit:
            return NSLocalizedString("Exceeds character limit exception.", comment: "The input contains more than 70 characters.")
        case .notEnoughCharacters:
            return NSLocalizedString("Not enough characters exception.", comment: "The input must be greater than 0 characters excluding whitespace.")
        }
    }
}
