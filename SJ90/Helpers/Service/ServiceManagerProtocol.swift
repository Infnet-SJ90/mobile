//
//  ServiceManagerProtocol.swift
//  SJ90
//
//  Created by Yago on 12/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

protocol ServiceManagerProtocol {
    
    func GetData(url: String, parameters: [String : Any]?, success: @escaping (Data) -> Void, failure: @escaping (ServiceError) -> Void)
    
}
