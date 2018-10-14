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

class PreviewViewController: UIViewController, UIWebViewDelegate {
    var envelopeId: String = ""

    @IBOutlet weak var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self as? WKUIDelegate
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        DocuSignAPI.getImageUrl(envelopeId: envelopeId) { (link) in
            let myURL = URL(string:link)
            let myRequest = URLRequest(url: myURL!)
            self.webView.load(myRequest)
        }
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
