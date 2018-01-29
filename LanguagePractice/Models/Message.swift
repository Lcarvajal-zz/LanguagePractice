//
//  Message.swift
//  LanguagePractice
//
//  Created by Lukas Carvajal on 1/29/18.
//  Copyright © 2018 Lukas Carvajal. All rights reserved.
//

import Foundation

struct Message {
    internal let language: Language
    internal let createdAt: Date
    internal let sender: MessageSender
    internal let text: String
}

enum MessageSender {
    case currentUser
    case chatBot
}
