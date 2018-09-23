//
//  ServiceManagerProtocol.swift
//  SJ90
//
//  Created by Yago on 12/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

protocol ServiceManagerProtocol {
    
    // MARK: - Methods
    func request(method: ServiceHTTPMethod, url: String, parameters: [String: Any]?, encoding: ServiceEncoding, success: @escaping (Data) -> Void, failure: @escaping (( _ responseError: ServiceError?)->()))
}
