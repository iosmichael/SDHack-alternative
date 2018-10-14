//
//  ModalViewController.swift
//  SDHack
//
//  Created by Michael Liu on 10/13/18.
//  Copyright © 2018 sdhack. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.firstName.delegate = self
        self.lastName.delegate = self
        self.email.delegate = self
    }
    
    @IBAction func demo(_ sender: Any) {
        self.firstName.text = ""
        self.lastName.text = ""
        self.email.text = ""
    }
    
    @IBAction func cancelEditing(_ sender: Any) {
        self.firstName.resignFirstResponder()
        self.lastName.resignFirstResponder()
        self.email.resignFirstResponder()
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.firstName.resignFirstResponder()
        self.lastName.resignFirstResponder()
        self.email.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
