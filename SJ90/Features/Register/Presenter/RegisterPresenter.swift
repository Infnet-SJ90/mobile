//
//  RegisterPresenter.swift
//  SJ90
//
//  Created by Ronilson Batista on 21/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

final class RegisterPresenter {
    
    fileprivate unowned let view: RegisterProtocol
    fileprivate let service: LoginService
    fileprivate(set) var sucessLogin = Bool()
    
    init(view: RegisterProtocol) {
        self.view = view
        self.service = LoginService()
    }
}

// MARK: - Public methods
extension RegisterPresenter {
    func Register(username: String, password: String, email: String, cpf: String) {
        self.view.startLoading()
        self.service.createAccount(username: username, password: password, email: email, cpf: cpf, success: { result in
            self.view.stopLoading()
            self.view.successAccount()
        }) { erro in
            self.view.stopLoading()
            self.view.showAlertError(with: "Erro encontrado", message: "Vamos solucionar o mais possível", buttonTitle: "ok")
        }
    }
}

// MARK: - Private methods
extension RegisterPresenter {
}
