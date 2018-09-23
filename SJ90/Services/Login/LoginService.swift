//
//  LoginService.swift
//  SJ90
//
//  Created by Ronilson Batista on 18/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

final class LoginService {
    
    func login(username: String, password: String, success: @escaping (_ login: Bool) -> Void, fail: @escaping (_ error: ServiceError) -> Void) {
        
        let parms:[String: Any] = [
                "Email": username,
                "Senha": password,
                "AuthenticationType": 1
                ]
        
        ServiceRequest.shared.request(method: .post, url: ServiceURL.login.value, parameters: parms, encoding: .default, success: { result in
            success(true)
        }) { error in
            fail(error!)
        }
    }
    
    func createAccount(username: String, password: String, email: String, cpf: String, success: @escaping (_ account: Bool) -> Void, fail: @escaping (_ error: ServiceError) -> Void) {
        
        let parms:[String: Any] = [
            "Nome": username,
            "Email": password,
            "Cpf": cpf,
            "Senha": password
        ]
        
        ServiceRequest.shared.request(method: .post, url: ServiceURL.account.value, parameters: parms, encoding: .default, success: { result in
            success(true)
        }) { error in
            fail(error!)
        }
    }
    
}
