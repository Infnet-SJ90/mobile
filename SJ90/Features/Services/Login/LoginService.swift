//
//  LoginService.swift
//  SJ90
//
//  Created by Ronilson Batista on 18/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

final class LoginService {
    
    func postLogin(success: @escaping (_ login: Bool) -> Void, fail: @escaping (_ error: ServiceError) -> Void) {
        
        ServiceManager.shared.GetData(url: ServiceURL.postLogin.value, parameters: nil, success: { result in
//            let response = try! JSONDecoder().decode(Hotels.self, from: result)
            success(response)
        }, failure: { error in
            fail(ServiceError(code: error.code))
        })
    }
    
}
