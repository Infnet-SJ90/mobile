//
//  ComplaintsViewModel.swift
//  SJ90
//
//  Created by Ronilson Batista on 22/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

final class ComplaintsViewModel: NSObject {
    
    var address: Int
    var CEP : Double
    var number : Double
    var neighborhood : Double
    var date: Double

    init(address: Int, CEP: Double, number: Double, neighborhood: Double, date: Double) {
        self.address = address
        self.CEP = CEP
        self.number = number
        self.neighborhood = neighborhood
        self.date = date
    }
}
