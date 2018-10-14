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
        let parameters = ["status":"sent","templateId":"3094dff1-06e9-4fc3-b6b9-ecda701d4554","templateRoles":[sellerDict,buyerDict]]  as [String : Any]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer eyJ0eXAiOiJNVCIsImFsZyI6IlJTMjU2Iiwia2lkIjoiNjgxODVmZjEtNGU1MS00Y2U5LWFmMWMtNjg5ODEyMjAzMzE3In0.AQgAAAABAAUABwAAZ70PZjHWSAgAAKfgHakx1kgCAIkI7G6XMQdIiPxoo8qM80QVAAEAAAAYAAEAAAAFAAAADQAkAAAAZjBmMjdmMGUtODU3ZC00YTcxLWE0ZGEtMzJjZWNhZTNhOTc4MACAIp2JXTHWSA.TATf5RjK6PabLCwU1J7NZfDFqpH2gQlCP9KGFBdqbv4-5JD4DUuh-k4xe9TL6qKLMCx2mpe8mxPhgan0ndJK7nnJC3AXtI4L5u-KKOIRaMWtrejUVbE4dpk324vuGqyikGXtwwMCIKknL_TSSEgRcsE2kZmYXsdi4i1T3iu_TYIuLXX9FTrDHbOVU8FH0YONT0zHgFS4n8dn30cCCVHoqsbksND4jSlsNWN7nTKTKiRH0xcTOlR35C28OIipTxkbRdn2QveUSirAWCZPiUjokNnwUID1_6Ex4bWKqRbxz8SEwhHDly4hK_j86U_fIdLBfMp6z5dV5sq1jRYU_uyOsA", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField:"Content-Type")
        do { request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) } catch {print("HELLO")}
        
        Alamofire.request(request).responseJSON(options:.mutableContainers) {JSON in
            print(JSON)
            print(JSON.debugDescription)
        }

    }
    
}
