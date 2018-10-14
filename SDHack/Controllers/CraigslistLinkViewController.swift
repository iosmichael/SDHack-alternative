//
//  CraigslistLinkViewController.swift
//  SDHack
//
//  Created by Michael Liu on 10/13/18.
//  Copyright © 2018 sdhack. All rights reserved.
//

import UIKit

class CraigslistLinkViewController: UIViewController {

    @IBOutlet weak var craigslistLink: UITextField!
    var parentController: ContractDetailTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func setParentController(controller:ContractDetailTableViewController){
        self.parentController = controller
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //self.parentController?.receiveParseData(link: self.craigslistLink.text!)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
