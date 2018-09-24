//
//  ComplaintsViewModel.swift
//  SJ90
//
//  Created by Ronilson Batista on 22/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

class ComplaintsViewModel {
    
    static public let shared = ComplaintsViewModel()
    
    var address: String?
    var CEP : String?
    var number : String?
    var neighborhood : String?
    var date: String?
    var type: String?
}
