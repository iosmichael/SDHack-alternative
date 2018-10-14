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
    var carInfo:[String: String] = ["Model":"", "Year":"", "Price":""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadAPI()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 0) ? 1 : self.carInfo.count + 1
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                
            }
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
                cell.setDelegate(delegate: self)
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "carInfo", for: indexPath) as! CarInfoTableViewCell
                let key = Array(self.carInfo.keys)[indexPath.row - 1]
                cell.setLabel(keyLabel: key, valueLabel: self.carInfo[key]!)
                return cell
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 135
        }else{
            if indexPath.row == 0 {
                return 80
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
        request.setValue("Bearer eyJ0eXAiOiJNVCIsImFsZyI6IlJTMjU2Iiwia2lkIjoiNjgxODVmZjEtNGU1MS00Y2U5LWFmMWMtNjg5ODEyMjAzMzE3In0.AQkAAAABAAUABwCAYT9FIDHWSAgAgKFiU2Mx1kgCAIkI7G6XMQdIiPxoo8qM80QVAAEAAAAYAAEAAAAFAAAADQAkAAAAZjBmMjdmMGUtODU3ZC00YTcxLWE0ZGEtMzJjZWNhZTNhOTc4EgABAAAACwAAAGludGVyYWN0aXZlMACANA5EIDHWSA.qAhB6vcx3mqeA4Se-UfaVAQiRaoX_C48eYs59B879dPCXQerO9__EURHuFCXc1cRtCgYdKkCZcRIUloVWAtewUv2Juu0VKZRK2X0JKKPEiGaPpL1xpxkVOb6ncTiWaN9U-qZjgyLQHsqIitWJn2x3YpGiOsf1Y1D3USjVfiHT7bqFCTVOv3AHqtdMX28SXRE3OZ8f3T7VKPnaPOzgwr-SuCigGHLIFN_aPx-7_MqOC_D1G6C2Y0W4y8UGuKwMp0iceWwuzWVWTdBjvLx8nLWSZ9eTq13GgHkeOsi9NxHCnag25I5AK4RxLt8jgwTUIx5WewcBcDaB9MvMKXAYoJYGw", forHTTPHeaderField: "Authorization")
        
        Alamofire.request(request).validate().responseJSON() { response in
            print(response)
            if let value = response.result.value {
                let json = JSON(value)
                self.userInfo["First Name"] = json["given_name"].stringValue
                self.userInfo["Last Name"] = json["family_name"].stringValue
                self.userInfo["Email"] = json["email"].stringValue
                self.tableView.reloadData()
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

extension ContractDetailTableViewController: TextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as? ErrorTextField)?.isErrorRevealed = false
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = true
        return true
    }
}

