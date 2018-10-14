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
    
    public class func sendEnvelope(envelopeId: String, completion: @escaping (() -> Void)) {
        let api = "https://demo.docusign.net/restapi/v2/accounts/6807336/envelopes/\(envelopeId)"
        let url = URL(string: api)
        let parameters = ["status":"sent"]
        var request = URLRequest(url: url!)
        request.httpMethod = "PUT"
        request.addValue(token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField:"Content-Type")
        do { request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) } catch {print("HELLO")}
        
        Alamofire.request(request).validate().responseJSON() {response in
            print("was sent successfully!")
            completion()
        }
    }
    
    public class func updateTabValues(envelopeId: String, listOfTabIds: [String], listOfStuff: [String], completion: @escaping (() -> Void)) {
        var listOfShit = listOfStuff

        let api =  "https://demo.docusign.net/restapi/v2/accounts/6807336/envelopes/\(envelopeId)/recipients/1/tabs"
        let url = URL(string: api)
        let parameters = ["textTabs":[["tabLabel":"Text 8b194486-ffd8-468d-adea-9c768abac462", "value":listOfShit.removeFirst()],
                                      ["tabLabel":"year", "value":listOfShit.removeFirst()],
                                      ["tabLabel":"make", "value":listOfShit.removeFirst()],
                                      ["tabLabel":"model", "value":listOfShit.removeFirst()],
                                      ["tabLabel":"VIN", "value":listOfShit.removeFirst()],
                                      ["tabLabel":"mileage", "value":listOfShit.removeFirst()],
                                      ["tabLabel":"date of sale", "value":listOfShit.removeFirst()],
                                      ["tabLabel":"Text ed0d71c3-5f5c-4269-9c48-19e65da5ba76", "value":listOfShit.removeFirst()],
                                      ["tabLabel":"Text d5fc3281-8dd5-4ff0-8c31-51c3a1b978ab", "value":listOfShit.removeFirst()]
            ]]
        print("count of this stuff: \(listOfShit.count)")
        var request = URLRequest(url: url!)
        request.httpMethod = "PUT"
        request.addValue(token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField:"Content-Type")
        do { request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) } catch {print("HELLO")}
        
        Alamofire.request(request).validate().responseJSON() {response in
            completion()
        }
    }
    
    public class func getTabIds(envelopeId: String, completion: @escaping (([String]) -> Void)) {
        let api = "https://demo.docusign.net/restapi/v2/accounts/6807336/envelopes/\(envelopeId)/recipients/1/tabs"
        
        
        guard let url = URL(string: api) else {return assertionFailure("URL Failed")}
        var request = URLRequest(url: url)

        request.addValue(token, forHTTPHeaderField: "Authorization")

        var toOutput: [String] = []
        Alamofire.request(request).validate().responseJSON() {response in
            
            if let value = response.result.value {
                let json = JSON(value)
                for tab in json["textTabs"].arrayValue {
                    toOutput.append(tab["tabId"].stringValue)
                    print("tab: " + tab["tabId"].stringValue)
                }
            }
            completion(toOutput)
        }
    }
    
    public class func getEnvolope(email: String, name: String, completion: @escaping (String) -> Void) {
        let accountId = "5cd608e8-b842-4b35-90c8-8b7b1d530ee9"
        let templateId = "3094dff1-06e9-4fc3-b6b9-ecda701d4554"
        let createEnvelopeApi =  "https://demo.docusign.net/restapi/v2/accounts/6807336/envelopes"
        let sellerDict = ["email":"rapolusakura@gmail.com","name":"Sakura Rapolu","roleName":"Seller"]
        let buyerDict = ["email":email,"name":name,"roleName":"Buyer"]
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
