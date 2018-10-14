//
//  UserInfoTableViewCell.swift
//  SDHack
//
//  Created by Michael Liu on 10/13/18.
//  Copyright © 2018 sdhack. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var firstName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUserInfo(first:String, last:String, email:String) {
        self.email.text = email
        self.firstName.text = first
        self.lastName.text = last
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
