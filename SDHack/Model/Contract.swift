//
//  Contract.swift
//  SDHacks2018
//
//  Created by Sakura Rapolu on 10/13/18.
//  Copyright © 2018 SDHacks. All rights reserved.
//

import Foundation

struct Contract {
    var receipientName: String
    var receipientEmail: String
    var car: Car
    
    init(rN: String, rE: String, car: Car){
        self.receipientName = rN
        self.receipientEmail = rE
        self.car = car
    }
}
