//
//  LoginPresenter.swift
//  SJ90
//
//  Created by Ronilson Batista on 18/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

final class LoginPresenter {
    
    fileprivate unowned let view: LoginProtocol
    fileprivate let service: LoginService
    fileprivate(set) var sucessLogin = Bool()
    
    init(view: LoginProtocol) {
        self.view = view
        self.service = LoginService()
    }
}

// MARK: - Public methods
extension LoginPresenter {
    
    func login(username: String, password: String) {
        self.view.startLoading()
        self.service.login(username: username, password: password, success: { sucess in
          self.sucessLogin = sucess
          self.view.stopLoading()
        }) { error in
            self.view.stopLoading()
            self.view.showAlertError(with: "Erro encontrado", message: "Vamos solucionar o mais possível", buttonTitle: "ok")
        }
    }
}

// MARK: - Private methods
extension LoginPresenter {
    fileprivate func requestError(errorDescription: String) {
        self.view.stopLoading()
        self.view.showAlertError(with: "Erro", message: errorDescription, buttonTitle: "OK")
    }
}
