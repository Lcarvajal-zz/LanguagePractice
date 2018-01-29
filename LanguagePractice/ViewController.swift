//
//  ViewController.swift
//  LanguagePractice
//
//  Created by Lukas Carvajal on 1/29/18.
//  Copyright © 2018 Lukas Carvajal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    fileprivate var dataManager: MessageManager = MessageManager()
    fileprivate var tableView: UITableView?
    
    // Bar above keyboard for writing and sending messages.
    fileprivate var keyboardBarContainer: UIView?
    fileprivate let keyboardBarHeight: CGFloat = 60
    fileprivate var messageInputTextView: UITextView?
    fileprivate var sendButton: UIButton?
    
    override func loadView() {
        let mainScreenFrame = UIScreen.main.bounds
        view = UIView(frame: mainScreenFrame)
        view.backgroundColor = .white
        navigationItem.title = "Language Practice"
        
        initializeTableView()
        initializeKeyboardBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView?.frame = CGRect(x: 0, y: 0, width: view.frame.width,
                                  height: view.frame.height - keyboardBarHeight)
        keyboardBarContainer?.frame = CGRect(x: 0, y: view.frame.height - keyboardBarHeight, width: view.frame.width, height: keyboardBarHeight)
        
        
        let inputTextViewWidth = view.frame.width * 0.7
        messageInputTextView?.frame = CGRect(x: 16, y: 8, width: inputTextViewWidth, height: keyboardBarHeight - 16)
        let sendButtonWidth = view.frame.width - inputTextViewWidth - 48
        sendButton?.frame = CGRect(x: inputTextViewWidth + 32, y: 8, width: sendButtonWidth , height: keyboardBarHeight - 16)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView?.reloadData()
    }
    
    // MARK: - Subviews
    
    fileprivate func initializeTableView() {
        tableView = UITableView()
        if let tableView = tableView {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.backgroundColor = .white
            tableView.separatorStyle = .none
            
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.estimatedRowHeight = 60
            tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: MessageTableViewCell.reuseIdentifier)
            tableView.tableFooterView = UIView(frame: .zero)
            
            view.addSubview(tableView)
        }
    }
    
    fileprivate func initializeKeyboardBar() {
        keyboardBarContainer = UIView()
        if let keyboardBarContainer = keyboardBarContainer {
            keyboardBarContainer.backgroundColor = .lightGray
            view.addSubview(keyboardBarContainer)
            
            messageInputTextView = UITextView()
            if let messageInputTextView = messageInputTextView {
                messageInputTextView.delegate = self
                messageInputTextView.autocorrectionType = .no
                messageInputTextView.backgroundColor = .white
                keyboardBarContainer.addSubview(messageInputTextView)
            }
            
            sendButton = UIButton()
            if let sendButton = sendButton {
                sendButton.setTitle("Send", for: .normal)
                keyboardBarContainer.addSubview(sendButton)
            }
        }
    }

    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let messageCell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.reuseIdentifier, for: indexPath) as? MessageTableViewCell {
            
            let message = dataManager.messages[indexPath.row]
            messageCell.messageSender = message.sender
            messageCell.messageTextLabel?.text = message.text
            
            return messageCell
        }
        else {
            debugPrint("Cell with matching reuse identifier not called.")
            return UITableViewCell(frame: .zero)
        }
    }
}

