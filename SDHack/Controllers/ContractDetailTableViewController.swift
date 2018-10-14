//
//  ContractDetailTableViewController.swift
//  SDHack
//
//  Created by Michael Liu on 10/13/18.
//  Copyright © 2018 sdhack. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Material

class ContractDetailTableViewController: UITableViewController {
    
    var userInfo:[String:String] = ["first":"", "last":"", "email":""]
    var carInfo:[String: String] = ["model":"", "year":"", "price":""]
    var carTags:[String: String] = [:]
    var seller: [String: String] = [:]
    var envelopeId: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadAPI()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 0) ? 1 : self.carInfo.count + self.carTags.count + 2
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                let alertController = UIAlertController(title: "Enter Craigslist Link", message: "", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addTextField { (textField : UITextField!) -> Void in
                    textField.placeholder = "Link"
                }
                // Create the actions
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                    UIAlertAction in
                    let link = alertController.textFields![0].text!
                    self.receiveParseData(link: link, completion: {
                        
                    })
                }
                
                let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
                    UIAlertAction in
                    NSLog("Cancel Pressed")
                }
                
                // Add the actions
                alertController.addAction(okAction)
                alertController.addAction(cancelAction)
                
                // Present the controller
                self.present(alertController, animated: true, completion: nil)
            }
            if indexPath.row == self.carInfo.count + self.carTags.count + 1 {
                DocuSignAPI.getEnvolope(email: self.seller["email"]!, name: self.seller["firstName"]!) { (envelopeId) in
                    self.envelopeId = envelopeId
                    print(envelopeId)
                    DocuSignAPI.getTabIds(envelopeId: envelopeId, completion: { (listOfTabs) in
                        var listOfShit: [String] = []
                        listOfShit.append(self.seller["firstName"]! + " " + self.seller["lastName"]!)
                        listOfShit.append(self.carInfo["year"]!)
                        listOfShit.append("Model: ")
                        listOfShit.append(self.carInfo["model"]!)
                        listOfShit.append("VIN!")
                        listOfShit.append("mileage")
                        listOfShit.append("October 14, 2018")
                        listOfShit.append(self.carInfo["price"]!)
                        listOfShit.append(self.carTags.description)
                        DocuSignAPI.updateTabValues(envelopeId: envelopeId, listOfTabIds: listOfTabs, listOfStuff: listOfShit, completion: {
                            DocuSignAPI.sendEnvelope(envelopeId: envelopeId, completion: {
                                print("FINALLY DONE")
                            })
                        })
                    })
                }
            }
                let controller = storyboard?.instantiateViewController(withIdentifier: "previewController") as! PreviewViewController
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "userInfo", for: indexPath) as! UserInfoTableViewCell
            cell.setUserInfo(first: userInfo["first"]!, last: userInfo["last"]!, email: userInfo["email"]!)
            return cell
        }else{
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "craigslist", for: indexPath) as! CraigslistTableViewCell
                return cell
            }else if indexPath.row == self.carInfo.count + self.carTags.count + 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "next")
                return cell!
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "carInfo", for: indexPath) as! CarInfoTableViewCell
                if indexPath.row < self.carInfo.count + 1 {
                    let key = Array(self.carInfo.keys)[indexPath.row - 1]
                    cell.setLabel(keyLabel: key, valueLabel: self.carInfo[key]!)
                }else{
                    let key = Array(self.carTags.keys)[indexPath.row - self.carInfo.count]
                    cell.setLabel(keyLabel: key, valueLabel: self.carTags[key]!)
                }
                return cell
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 135
        }else{
            if indexPath.row == 0 {
                return 55
            }else{
                return 45
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (section == 0) ? "User Information" : "Item Information"
    }
    
    func downloadAPI() {
        let apiToContact = "https://account-d.docusign.com/oauth/userinfo"
        guard let url = URL(string: apiToContact) else {return assertionFailure("URL Failed")}
        var request = URLRequest(url: url)
        request.setValue(DocuSignAPI.token, forHTTPHeaderField: "Authorization")
        
        Alamofire.request(request).validate().responseJSON() { response in
            if let value = response.result.value {
                let json = JSON(value)
                self.userInfo["first"] = json["given_name"].stringValue
                self.userInfo["last"] = json["family_name"].stringValue
                self.userInfo["email"] = json["email"].stringValue
                self.tableView.reloadData()
            }
        }
    }
    
    func receiveParseData(link:String, completion: @escaping (() -> Void)){
        let apiToContact = "http://ec2-52-53-154-16.us-west-1.compute.amazonaws.com:3001/?"
        let parameters = ["url":link]
        Alamofire.request(apiToContact, parameters: parameters).responseJSON(options:.mutableContainers) {response in
            if let value = response.result.value {
                let json = JSON(value)
                for (key, _) in json {
                    if key != "model" || key != "price" || key != "year" {
                        self.carInfo[key] = json[key].stringValue
                    }else{
                        self.carTags[key] = json[key].stringValue
                    }
                }
                self.tableView.reloadData()
                completion()
            }
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

