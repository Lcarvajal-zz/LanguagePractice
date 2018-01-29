//
//  MessageTableViewCell.swift
//  LanguagePractice
//
//  Created by Lukas Carvajal on 1/29/18.
//  Copyright © 2018 Lukas Carvajal. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    static let reuseIdentifier = "MessageCell"
    
    internal var messageTextLabel: UILabel?
    internal var messageSender = MessageSender.chatBot

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        clipsToBounds = true
        
        messageTextLabel = UILabel()
        if let messageTextLabel = messageTextLabel {
            messageTextLabel.numberOfLines = 0
            messageTextLabel.lineBreakMode = .byWordWrapping
            messageTextLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(messageTextLabel)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("No storyboards or nibs allowed in this app.")
    }
    
    // MARK: - Sub views
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutMessageTextLabel()
        styleMessageTextLabel()
    }
    
    fileprivate func layoutMessageTextLabel() {
        guard let messageTextLabel = messageTextLabel else {
            debugPrint("Message text label not initialized before adding constraints.")
            return
        }
        
        // Label spans part of content view for automatic dimensions in table view.
        let margins = contentView.layoutMarginsGuide
        let messagePadding = contentView.frame.width * 0.15
        messageTextLabel.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        messageTextLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true

        switch messageSender {
        case .chatBot:
            messageTextLabel.rightAnchor.constraint(lessThanOrEqualTo: margins.rightAnchor, constant: -messagePadding).isActive = true
            messageTextLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        case .currentUser:
            messageTextLabel.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
            messageTextLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: messagePadding).isActive = true
        }
    }
    
    fileprivate func styleMessageTextLabel() {
        guard let messageTextLabel = messageTextLabel else {
            debugPrint("Message text label not initialized before styling.")
            return
        }
        
        switch messageSender {
        case .chatBot:
            messageTextLabel.backgroundColor = .cyan
            messageTextLabel.textAlignment = .left
        case .currentUser:
            messageTextLabel.backgroundColor = .lightGray
            messageTextLabel.textAlignment = .right
            
        }
    }
}
