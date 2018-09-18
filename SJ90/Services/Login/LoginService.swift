//
//  LoginService.swift
//  SJ90
//
//  Created by Ronilson Batista on 18/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

final class LoginService {
    
    func postLogin(username: String, password: String, success: @escaping (_ login: Bool) -> Void, fail: @escaping (_ error: ServiceError) -> Void) {
        
        let parms:[String: Any] = [
                "Email": username,
                "Senha": password,
                "AuthenticationType":1
                ]
        
        ServiceManager.shared.GetData(url: ServiceURL.postLogin.value, parameters: parms, success: { result in
            success(true)
        }, failure: { error in
            fail(ServiceError(code: error.code))
        })
    }
}
