//
//  CraigslistTableViewCell.swift
//  SDHack
//
//  Created by Michael Liu on 10/13/18.
//  Copyright © 2018 sdhack. All rights reserved.
//

import UIKit
import Material

class CraigslistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var craigslistTextField: ErrorTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setDelegate(delegate:TextFieldDelegate){
        self.craigslistTextField.delegate = delegate
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
