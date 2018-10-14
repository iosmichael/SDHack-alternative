//
//  PreviewViewController.swift
//  SDHack
//
//  Created by Michael Liu on 10/13/18.
//  Copyright © 2018 sdhack. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import WebKit

class PreviewViewController: UIViewController{
    var envelopeId: String = ""

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DocuSignAPI.getImageUrl(envelopeId: envelopeId) { (link) in
            print(link)
            print(self.envelopeId)
            let url = URL (string: link)
            let requestObj = URLRequest(url: url!)
            self.webView.load(requestObj)
        }
    }
    
    @IBAction func successButtonPressed(_ sender: Any) {
        //DocuSignAPI.sendEnvelope(envelopeId: envelopeId) {
            self.performSegue(withIdentifier: "success", sender: self)
        //}
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
