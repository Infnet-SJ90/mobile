//
//  ConfirmComplaintPresenter.swift
//  SJ90
//
//  Created by Ronilson Batista on 22/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

final class ConfirmComplaintPresenter {
    
    fileprivate unowned let view: ConfirmComplaintProtocol
    //    fileprivate let service: LoginService
    fileprivate(set) var sucessLogin = Bool()
    
    init(view: ConfirmComplaintProtocol) {
        self.view = view
        //        self.service = LoginService()
    }
}

// MARK: - Public methods
extension ConfirmComplaintPresenter {
    func setupInitialization() {
        self.view.setupNavigationController()
    }
    
}

// MARK: - Private methods
extension ConfirmComplaintPresenter {
}
