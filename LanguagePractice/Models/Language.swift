//
//  Language.swift
//  LanguagePractice
//
//  Created by Lukas Carvajal on 1/29/18.
//  Copyright © 2018 Lukas Carvajal. All rights reserved.
//

import Foundation

enum Language {
    case english
    case german
    case spanish
    case notSupported
    
    init(for textToInterpret: String) {
        if let languageTag = NSLinguisticTagger.dominantLanguage(for: textToInterpret) {
            switch languageTag {
            case "en": self = .english
            case "de": self = .german
            case "es": self = .spanish
            default: self = .notSupported
            }
        }
        else {
            debugPrint("Nil value used to initialize Language Enum.")
            self = .notSupported
        }
    }
}
