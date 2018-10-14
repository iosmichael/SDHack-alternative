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
    
    static let token: String = "Bearer eyJ0eXAiOiJNVCIsImFsZyI6IlJTMjU2Iiwia2lkIjoiNjgxODVmZjEtNGU1MS00Y2U5LWFmMWMtNjg5ODEyMjAzMzE3In0.AQkAAAABAAUABwCAyxyn8zHWSAgAgAtAtTYy1kgCAIkI7G6XMQdIiPxoo8qM80QVAAEAAAAYAAEAAAAFAAAADQAkAAAAZjBmMjdmMGUtODU3ZC00YTcxLWE0ZGEtMzJjZWNhZTNhOTc4EgABAAAACwAAAGludGVyYWN0aXZlMACAcbqk8zHWSA.fQdp3qGAeokNAhywh6-apMDb18Kv5VMfTJm_NavdnsmlTzXH8f14Lof3vD3pYvPyDjah7je5srKOrpf3txQmR9R95qtw2vSzfWC34Xb6satbDdCve-FnJz3V5VlzILUyPZUUsn_jS1frvByj5I0k2asTlrxeKMnaOp7pX6CmmBiUCFhkGXUrofG2VpND95A_e1yJMgdye_YzFp62w9VbFMLCkEgakVBn7NjMEhDqcBP_MONHBy-X2I1ObAiK-2guipTmN_YWCh7np2dGAUQJufLzAe9LFY2BxJQvuhxRgX2cpInJ_ec5rfvsT0uMUQ_1GIpsU3L10FpEa6WtICdXAg"
    
    public class func getImageUrl(envelopeId: String, completion: @escaping ((String) -> Void)) {
        let api = "https://demo.docusign.net/restapi/v2/accounts/6807336/views/console"
        let url = URL(string: api)
        let parameters = ["envelopeId":envelopeId]
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue(token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField:"Content-Type")
        do { request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) } catch {print("HELLO")}
        
        Alamofire.request(request).validate().responseJSON() {response in
            print(response)
            completion(JSON(response.result.value)["url"].stringValue)
        }
    }
    
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

        let api =  "https://demo.docusign.net/restapi/v2/accounts/6807336/envelopes/\(envelopeId)/recipients/2/tabs"
        let url = URL(string: api)
        let parameters = ["textTabs":[["tabId":listOfTabIds[5], "value":listOfShit.removeFirst()],
                                      ["tabId":listOfTabIds[6], "value":listOfShit.removeFirst()],
                                      ["tabId":listOfTabIds[7], "value":listOfShit.removeFirst()],
                                      ["tabId":listOfTabIds[8], "value":listOfShit.removeFirst()],
                                      ["tabId":listOfTabIds[1], "value":listOfShit.removeFirst()],
                                      ["tabId":listOfTabIds[2], "value":listOfShit.removeFirst()],
                                      ["tabId":listOfTabIds[3], "value":listOfShit.removeFirst()],
                                      ["tabId":listOfTabIds[4], "value":listOfShit.removeFirst()],
                                      ["tabId":listOfTabIds[0], "value":listOfShit.removeFirst()]
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
        let api = "https://demo.docusign.net/restapi/v2/accounts/6807336/envelopes/\(envelopeId)/recipients/2/tabs"
        
        guard let url = URL(string: api) else {return assertionFailure("URL Failed")}
        var request = URLRequest(url: url)

        request.addValue(token, forHTTPHeaderField: "Authorization")

        var toOutput: [String] = []
        Alamofire.request(request).validate().responseJSON() {response in
            print(response)
            if let value = response.result.value {
                let json = JSON(value)
                for tab in json["textTabs"].arrayValue {
                    print("tab: " + tab["tabId"].stringValue)
                    toOutput.append(tab["tabId"].stringValue)
                }
            }
            completion(toOutput)
        }
        print("hello")
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
