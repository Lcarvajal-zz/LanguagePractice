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
    fileprivate let keyboardBarHeight: CGFloat = 100
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
    }
    
    // MARK: - Subviews
    
    fileprivate func initializeTableView() {
        tableView = UITableView()
        if let tableView = tableView {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.backgroundColor = .black
            tableView.tableFooterView = UIView(frame: .zero)
            
            view.addSubview(tableView)
        }
    }
    
    fileprivate func initializeKeyboardBar() {
        keyboardBarContainer = UIView()
        if let keyboardBarContainer = keyboardBarContainer {
            view.addSubview(keyboardBarContainer)
            
            messageInputTextView = UITextView()
            if let messageInputTextView = messageInputTextView {
                messageInputTextView.delegate = self
                messageInputTextView.autocorrectionType = .no
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
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // FIXME: - Not implemented
        let cell = UITableViewCell()
        return cell
    }
}

