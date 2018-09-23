//
//  ServiceURL.swift
//  SJ90
//
//  Created by Yago on 12/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

enum ServiceURL {
    case login
    case account
    
    var value: String {
        switch self {
            case .login: return "https://"
            case .account: return "/cidadao"
        }
    }
}
