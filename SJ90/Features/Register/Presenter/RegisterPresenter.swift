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
    //    fileprivate let service: LoginService
    fileprivate(set) var sucessLogin = Bool()
    
    init(view: RegisterProtocol) {
        self.view = view
        //        self.service = LoginService()
    }
}

// MARK: - Public methods
extension RegisterPresenter {
}

// MARK: - Private methods
extension RegisterPresenter {
}
