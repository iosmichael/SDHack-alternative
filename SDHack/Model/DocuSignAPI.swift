//
//  DocuSignAPI.swift
//  SDHack
//
//  Created by Michael Liu on 10/14/18.
//  Copyright © 2018 sdhack. All rights reserved.
//

import UIKit
import Alamofire

class DocuSignAPI: NSObject {
    
    public class func getEnvolope() {
        let accountId = "5cd608e8-b842-4b35-90c8-8b7b1d530ee9"
        let templateId = "3094dff1-06e9-4fc3-b6b9-ecda701d4554"
        let createEnvelopeApi =  "https://demo.docusign.net/restapi/v2/accounts/6807336/envelopes"
        //        let apiToContact = "https://demo.docusign.net/restapi/v2/accounts/\(accountId)/templates/\(templateId)"
        let sellerDict = ["email":"rapolusakura@gmail.com","name":"Sakura Rapolu","roleName":"Seller"]
        let buyerDict = ["email":"x4liu@eng.ucsd.edu","name":"Michael","roleName":"Buyer"]
        guard let url = URL(string: createEnvelopeApi) else {return assertionFailure("URL Failed")}
        let parameters = ["status":"created","templateId":"3094dff1-06e9-4fc3-b6b9-ecda701d4554","templateRoles":[sellerDict,buyerDict]]  as [String : Any]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer eyJ0eXAiOiJNVCIsImFsZyI6IlJTMjU2Iiwia2lkIjoiNjgxODVmZjEtNGU1MS00Y2U5LWFmMWMtNjg5ODEyMjAzMzE3In0.AQgAAAABAAUABwCA4FowqTHWSAgAgCB-Puwx1kgCAIkI7G6XMQdIiPxoo8qM80QVAAEAAAAYAAEAAAAFAAAADQAkAAAAZjBmMjdmMGUtODU3ZC00YTcxLWE0ZGEtMzJjZWNhZTNhOTc4MACAXQisqDHWSA.uSjsPJEtZWnqgOzsbD7YfGfRrOzCLaFxKhCJoQNMo3RXneKUj9t0V7ZnMCPxW6ZWOmJ28KW0hUyMLWWtOJ4VWNXAfmmIt5JUCpM_ZT9r6LwOcMkt70JamJEECZaUpqLx65h7qDWC5483PWrz_D6U6ZzjMznFVyAxJifEJ6IpLtKrySigvTjbBsIshPvNMThqVg6VJoe6lm3MihT_owQ3YiAkjg4lGTo59bmrpNKsn9_rcu9TQKyI9swYUQUiiz17VEiyhY5LgN7POGmGknk3qLCw6tGZhIgESF0U2MMiL7Zcu-xBmc9EVSsDOACMBP0NzfpSqk7YoE5CXoV2iPfGpg", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField:"Content-Type")
        do { request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) } catch {print("HELLO")}
        
        Alamofire.request(request).responseJSON(options:.mutableContainers) {JSON in
            print(JSON)
            print(JSON.debugDescription)
        }

    }
    
}
