//
//  CreateContractViewController.swift
//  SDHacks2018
//
//  Created by Sakura Rapolu on 10/13/18.
//  Copyright © 2018 SDHacks. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class CreateContractViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let accountId = "5cd608e8-b842-4b35-90c8-8b7b1d530ee9"
////        //let apiToContact = "https://demo.docusign.net/v2/accounts/\(accountId)/templates"
////        //let parameters = ["url":link]
////        Alamofire.request(apiToContact, method: .get, encoding: JSONEncoding.default, headers: nil).responseString {JSON in
////            print(JSON)
////        }
////
        let apiToContact = "https://demo.docusign.net/restapi/v2/accounts/5cd608e8-b842-4b35-90c8-8b7b1d530ee9/templates"

        guard let url = URL(string: apiToContact) else {return assertionFailure("URL Failed")}

        var request = URLRequest(url: url)
        request.setValue("Bearer eyJ0eXAiOiJNVCIsImFsZyI6IlJTMjU2Iiwia2lkIjoiNjgxODVmZjEtNGU1MS00Y2U5LWFmMWMtNjg5ODEyMjAzMzE3In0.AQgAAAABAAUABwAAZ70PZjHWSAgAAKfgHakx1kgCAIkI7G6XMQdIiPxoo8qM80QVAAEAAAAYAAEAAAAFAAAADQAkAAAAZjBmMjdmMGUtODU3ZC00YTcxLWE0ZGEtMzJjZWNhZTNhOTc4MACAIp2JXTHWSA.TATf5RjK6PabLCwU1J7NZfDFqpH2gQlCP9KGFBdqbv4-5JD4DUuh-k4xe9TL6qKLMCx2mpe8mxPhgan0ndJK7nnJC3AXtI4L5u-KKOIRaMWtrejUVbE4dpk324vuGqyikGXtwwMCIKknL_TSSEgRcsE2kZmYXsdi4i1T3iu_TYIuLXX9FTrDHbOVU8FH0YONT0zHgFS4n8dn30cCCVHoqsbksND4jSlsNWN7nTKTKiRH0xcTOlR35C28OIipTxkbRdn2QveUSirAWCZPiUjokNnwUID1_6Ex4bWKqRbxz8SEwhHDly4hK_j86U_fIdLBfMp6z5dV5sq1jRYU_uyOsA", forHTTPHeaderField: "Authorization")

        Alamofire.request(request).validate().responseJSON() { response in
            print(response)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


