//
//  ChatHistoryViewController.swift
//  learn_code
//
//  Created by Amit Raghuvanshi on 19/12/2023.
//

import UIKit

class ChatHistoryViewController : UIViewController {
    
    //  MARK:  UIView IBOutlet Connections
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var imgBack: UIImageView!
    @IBOutlet weak var imgChat: UIImageView!
    
    @IBOutlet weak var chatTableView: UITableView!
    
    
    var profileData = ["image1","image2","image3","image4","image5","image6"]
    var userName = ["Christlle Jolly", "Michelle", "Christal", "Shailly", "Mercy", "Rubina Fleam"]
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitView()
    }
    
    //  MARK:  Configure Init Layout View
    func configureInitView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.registerChatTableCell()
            self.lblTitle.configureLabel(text: UINavigationTile.chatHistory, color: .blackColor,fontStyle: .bold, fontSize: FontSize.navigationTitle18.generateFontSize())
            
            self.imgBack.image = UIImage(named: ImageCollection.backImage)
            self.imgChat.image = UIImage(named: ImageCollection.chatIcon)
        }
        
    }
    
    
    //  MARK:   Register Table View delegate & dataSource
    func registerChatTableCell() {
        self.chatTableView.register(UINib(nibName: ChatHistoryCell.className, bundle: nil), forCellReuseIdentifier: ChatHistoryCell.className)
        self.chatTableView.register(UINib(nibName: ChatUserListCell.className, bundle: nil), forCellReuseIdentifier: ChatUserListCell.className)
        self.chatTableView.delegate = self
        self.chatTableView.dataSource = self
        
        self.chatTableView.estimatedRowHeight = 140
        self.chatTableView.rowHeight = UITableView.automaticDimension
        
        self.chatTableView.scrollIndicatorInsets = .zero
    }
    
    //  MARK:  OnClick Back Button Action
    @IBAction func onClickBackAction(_ sender: Any) {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}


extension ChatHistoryViewController : UITableViewDelegate {
    
}

extension ChatHistoryViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return self.profileData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let chatCell = tableView.dequeueReusableCell(withIdentifier: ChatHistoryCell.className, for: indexPath) as! ChatHistoryCell
            return chatCell
        } else if indexPath.section == 1 {
            let userListCell = tableView.dequeueReusableCell(withIdentifier: ChatUserListCell.className, for: indexPath) as! ChatUserListCell
            userListCell.configureUserList(profile: self.profileData[indexPath.row], name: self.userName[indexPath.row])
            return userListCell
        }
      return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 160.0
        } else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatVC = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: ConversationViewController.className) as! ConversationViewController
        self.navigationController?.pushViewController(chatVC, animated: true)
    }
}