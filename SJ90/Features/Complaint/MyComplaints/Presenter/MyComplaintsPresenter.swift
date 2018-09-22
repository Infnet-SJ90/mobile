//
//  MyComplaintsPresenter.swift
//  SJ90
//
//  Created by Ronilson Batista on 22/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

final class MyComplaintsPresenter {
    
    fileprivate unowned let view: MyComplaintsProtocol
    //    fileprivate let service: LoginService
    fileprivate(set) var sucessLogin = Bool()
    
    init(view: MyComplaintsProtocol) {
        self.view = view
        //        self.service = LoginService()
    }
}

// MARK: - Public methods
extension MyComplaintsPresenter {
    
    func setupInitialization() {
        self.view.setupNavigationController()
        self.view.setupTabBarItem()
    }
    
}

// MARK: - Private methods
extension MyComplaintsPresenter {
    
}
