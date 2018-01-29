//
//  Language.swift
//  LanguagePractice
//
//  Created by Lukas Carvajal on 1/29/18.
//  Copyright © 2018 Lukas Carvajal. All rights reserved.
//

import Foundation

enum Language {
    case English
    case German
    case Spanish
    case NotSupported
    
    init(for textToInterpret: String) {
        if let languageTag = NSLinguisticTagger.dominantLanguage(for: textToInterpret) {
            switch languageTag {
            case "en": self = .English
            case "de": self = .German
            case "es": self = .Spanish
            default: self = .NotSupported
            }
        }
        else {
            debugPrint("Nil value used to initialize Language Enum.")
            self = .NotSupported
        }
    }
}
