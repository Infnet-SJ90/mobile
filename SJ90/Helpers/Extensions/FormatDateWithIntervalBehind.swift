//
//  FormatDateWithIntervalBehind.swift
//  SJ90
//
//  Created by Ronilson Batista on 23/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

extension Date {
    func formatDateWithIntervalBehind(_ qtyDays: Int) -> String {
        
        let date = Date().addingTimeInterval(60*60*24*Double(qtyDays))
        let temp = DateFormatter()
        temp.locale = Locale(identifier: "pt_BR")
        temp.timeZone = TimeZone(identifier: "America/Sao_Paulo")
        temp.dateFormat = "dd/MM/yyyy HH:mm:ss" //////////////////
        
        temp.dateFormat = "dd/MM/yyyy"
        
        return temp.string(from: date)
    }
}

