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
        
        let tabId = "aadd8a3a-f73c-4972-9aba-790402c41241"
        let accountId = "5cd608e8-b842-4b35-90c8-8b7b1d530ee9"
        let templateId = "e628033a-8d33-4e28-84d3-bed003762b29"
        
        let api = "https://demo.docusign.net/restapi/v2/accounts/\(accountId)/tab_definitions/\(tabId)"
        let apiToContact = "https://demo.docusign.net/restapi/v2/accounts/\(accountId)/templates/\(templateId)"
        
        let tabAPICall = "https://demo.docusign.net/restapi/v2/accounts/\(accountId)/templates/\(templateId)/recipients/88322874/tabs"
        guard let url = URL(string: tabAPICall) else {return assertionFailure("URL Failed")}
        let parameters = ["fontColor":"red"]
        var request = URLRequest(url: url)
        request.setValue("Bearer eyJ0eXAiOiJNVCIsImFsZyI6IlJTMjU2Iiwia2lkIjoiNjgxODVmZjEtNGU1MS00Y2U5LWFmMWMtNjg5ODEyMjAzMzE3In0.AQgAAAABAAUABwAAZ70PZjHWSAgAAKfgHakx1kgCAIkI7G6XMQdIiPxoo8qM80QVAAEAAAAYAAEAAAAFAAAADQAkAAAAZjBmMjdmMGUtODU3ZC00YTcxLWE0ZGEtMzJjZWNhZTNhOTc4MACAIp2JXTHWSA.TATf5RjK6PabLCwU1J7NZfDFqpH2gQlCP9KGFBdqbv4-5JD4DUuh-k4xe9TL6qKLMCx2mpe8mxPhgan0ndJK7nnJC3AXtI4L5u-KKOIRaMWtrejUVbE4dpk324vuGqyikGXtwwMCIKknL_TSSEgRcsE2kZmYXsdi4i1T3iu_TYIuLXX9FTrDHbOVU8FH0YONT0zHgFS4n8dn30cCCVHoqsbksND4jSlsNWN7nTKTKiRH0xcTOlR35C28OIipTxkbRdn2QveUSirAWCZPiUjokNnwUID1_6Ex4bWKqRbxz8SEwhHDly4hK_j86U_fIdLBfMp6z5dV5sq1jRYU_uyOsA", forHTTPHeaderField: "Authorization")
         do { let newRequest = try URLEncoding.queryString.encode(request, with: parameters) } catch  {
        }
        Alamofire.request(request).responseJSON() { response in
            print(response)
        }
        
//        let headers: HTTPHeaders = [
//            "Authorization": "Bearer eyJ0eXAiOiJNVCIsImFsZyI6IlJTMjU2Iiwia2lkIjoiNjgxODVmZjEtNGU1MS00Y2U5LWFmMWMtNjg5ODEyMjAzMzE3In0.AQgAAAABAAUABwAAZ70PZjHWSAgAAKfgHakx1kgCAIkI7G6XMQdIiPxoo8qM80QVAAEAAAAYAAEAAAAFAAAADQAkAAAAZjBmMjdmMGUtODU3ZC00YTcxLWE0ZGEtMzJjZWNhZTNhOTc4MACAIp2JXTHWSA.TATf5RjK6PabLCwU1J7NZfDFqpH2gQlCP9KGFBdqbv4-5JD4DUuh-k4xe9TL6qKLMCx2mpe8mxPhgan0ndJK7nnJC3AXtI4L5u-KKOIRaMWtrejUVbE4dpk324vuGqyikGXtwwMCIKknL_TSSEgRcsE2kZmYXsdi4i1T3iu_TYIuLXX9FTrDHbOVU8FH0YONT0zHgFS4n8dn30cCCVHoqsbksND4jSlsNWN7nTKTKiRH0xcTOlR35C28OIipTxkbRdn2QveUSirAWCZPiUjokNnwUID1_6Ex4bWKqRbxz8SEwhHDly4hK_j86U_fIdLBfMp6z5dV5sq1jRYU_uyOsA",
//            "Accept": "application/json"
//        ]
//
//        guard let url = URL(string: api) else {return assertionFailure("URL Failed")}
//
//

////        Alamofire.request(api, parameters: parameters, header: headers).responseJSON(options:.mutableContainers) {JSON in
////            print(JSON)
////        }
//
////        Alamofire.request(url, method: .put, parameters: parameters, encoding: URLEncoding(destination: .queryString), headers: headers) {
////            JSON in
////            print(JSON)
////        }
////
//        Alamofire.request(url, headers: headers).responseJSON {
//            JSON in
//            print(JSON)
//        }
////
//        var request = URLRequest(url: url)
//        request.setValue(", forHTTPHeaderField: "Authorization")
//
//        Alamofire.request(request).validate().responseJSON() { response in
//            print(response)
//        }
        


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


