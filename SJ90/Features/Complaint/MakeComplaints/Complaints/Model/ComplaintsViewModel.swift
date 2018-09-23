//
//  ComplaintsViewModel.swift
//  SJ90
//
//  Created by Ronilson Batista on 22/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

final class ComplaintsViewModel: NSObject {
    
    var address: String
    var CEP : String
    var number : String
    var neighborhood : String
    var date: String

    init(address: String, CEP: String, number: String, neighborhood: String, date: String) {
        
        self.address = address
        self.CEP = CEP
        self.number = number
        self.neighborhood = neighborhood
        self.date = date
    }
}
