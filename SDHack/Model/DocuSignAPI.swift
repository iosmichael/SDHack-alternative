//
//  DocuSignAPI.swift
//  SDHack
//
//  Created by Michael Liu on 10/14/18.
//  Copyright © 2018 sdhack. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DocuSignAPI: NSObject {
    
    static let token: String = "Bearer eyJ0eXAiOiJNVCIsImFsZyI6IlJTMjU2Iiwia2lkIjoiNjgxODVmZjEtNGU1MS00Y2U5LWFmMWMtNjg5ODEyMjAzMzE3In0.AQgAAAABAAUABwCA4FowqTHWSAgAgCB-Puwx1kgCAIkI7G6XMQdIiPxoo8qM80QVAAEAAAAYAAEAAAAFAAAADQAkAAAAZjBmMjdmMGUtODU3ZC00YTcxLWE0ZGEtMzJjZWNhZTNhOTc4MACAXQisqDHWSA.uSjsPJEtZWnqgOzsbD7YfGfRrOzCLaFxKhCJoQNMo3RXneKUj9t0V7ZnMCPxW6ZWOmJ28KW0hUyMLWWtOJ4VWNXAfmmIt5JUCpM_ZT9r6LwOcMkt70JamJEECZaUpqLx65h7qDWC5483PWrz_D6U6ZzjMznFVyAxJifEJ6IpLtKrySigvTjbBsIshPvNMThqVg6VJoe6lm3MihT_owQ3YiAkjg4lGTo59bmrpNKsn9_rcu9TQKyI9swYUQUiiz17VEiyhY5LgN7POGmGknk3qLCw6tGZhIgESF0U2MMiL7Zcu-xBmc9EVSsDOACMBP0NzfpSqk7YoE5CXoV2iPfGpg"
    
    public class func getTabIds(envelopeId: String, completion: @escaping (([String]) -> Void)) {
        let api = "https://demo.docusign.net/restapi/v2/accounts/6807336/envelopes/bda5b2f6-8a0d-4ad1-8dc4-3b940fb6a25f/recipients/1/tabs"
        
        
        guard let url = URL(string: api) else {return assertionFailure("URL Failed")}
        var request = URLRequest(url: url)

        request.addValue(token, forHTTPHeaderField: "Authorization")

        var toOutput: [String] = []
        Alamofire.request(request).validate().responseJSON() {response in
            
            if let value = response.result.value {
                let json = JSON(value)
                for tab in json["textTabs"].arrayValue {
                    toOutput.append(tab["tabId"].stringValue)
                }
            }
            completion(toOutput)
        }
    }
    
    public class func getEnvolope(completion: @escaping (String) -> Void) {
        let accountId = "5cd608e8-b842-4b35-90c8-8b7b1d530ee9"
        let templateId = "3094dff1-06e9-4fc3-b6b9-ecda701d4554"
        let createEnvelopeApi =  "https://demo.docusign.net/restapi/v2/accounts/6807336/envelopes"
        //        let apiToContact = "https://demo.docusign.net/restapi/v2/accounts/\(accountId)/templates/\(templateId)"
        let sellerDict = ["email":"rapolusakura@gmail.com","name":"Sakura Rapolu","roleName":"Seller"]
        let buyerDict = ["email":"x4liu@eng.ucsd.edu","name":"Michael","roleName":"Buyer"]
        let url = URL(string: createEnvelopeApi)
        let parameters = ["status":"created","templateId":"3094dff1-06e9-4fc3-b6b9-ecda701d4554","templateRoles":[sellerDict,buyerDict]]  as [String : Any]
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue(token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField:"Content-Type")
        do { request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) } catch {print("HELLO")}
        
        Alamofire.request(request).validate().responseJSON() {response in
            
            if let value = response.result.value {
                let json = JSON(value)
                completion(json["envelopeId"].stringValue)
            }
        }
    }
    
}
