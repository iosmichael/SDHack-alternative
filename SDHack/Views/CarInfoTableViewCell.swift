//
//  CarInfoTableViewCell.swift
//  SDHack
//
//  Created by Michael Liu on 10/13/18.
//  Copyright © 2018 sdhack. All rights reserved.
//

import UIKit

class CarInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var info: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setLabel(keyLabel:String, valueLabel:String) {
        self.keyLabel.text = keyLabel
        self.info.text = valueLabel
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
