//
//  ChatUserListCell.swift
//  learn_code
//
//  Created by Amit Raghuvanshi on 22/12/2023.
//

import UIKit

class ChatUserListCell: UITableViewCell {

    //  MARK: 
    @IBOutlet weak var contentVw: UIView!
    @IBOutlet weak var profileVw: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblActiveTiming: UILabel!
    @IBOutlet weak var lblLastMessage: UILabel!
    @IBOutlet weak var imgActiveStatus: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
 
    
    func configureUserList(profile: String , name: String) {
        
        self.profileImage.image = UIImage(named: profile)
        self.profileImage.contentMode = .scaleAspectFill
        self.profileImage.setBorder(radius: self.profileImage.frame.size.height / 2, color: .appColor, width: 1.5)
        
        self.lblActiveTiming.configureLabel(text: "10:30Am", color: .blackColor, fontStyle: .bold, fontSize: FontSize.title10.generateFontSize())
        
        self.lblUsername.configureLabel(text: name, color: .blackColor, fontStyle: .bold, fontSize: FontSize.title16.generateFontSize())
        self.lblLastMessage.configureLabel(text: "what happening", color: .lightGray, fontStyle: .regular, fontSize: FontSize.title12.generateFontSize())

        self.imgActiveStatus.configureLabel(text: "Seen", color: .lightGray, fontStyle: .semibold, fontSize: FontSize.title12.generateFontSize())
    }
}