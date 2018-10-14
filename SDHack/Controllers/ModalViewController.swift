//
//  ModalViewController.swift
//  SDHack
//
//  Created by Michael Liu on 10/13/18.
//  Copyright © 2018 sdhack. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextBtn(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "contractDetail") as! ContractDetailTableViewController
        controller.seller = [
            "firstName":firstName.text!,
            "lastName": lastName.text!,
            "email": email.text!
        ]
        self.navigationController?.pushViewController(controller, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
