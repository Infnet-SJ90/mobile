//
//  MakeComplaintsPresenter.swift
//  SJ90
//
//  Created by Ronilson Batista on 22/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

final class MakeComplaintsPresenter {
    
    fileprivate unowned let view: MakeComplaintsProtocol
//    fileprivate let service: LoginService
    fileprivate(set) var sucessLogin = Bool()
    
    init(view: MakeComplaintsProtocol) {
        self.view = view
//        self.service = LoginService()
    }
}

// MARK: - Public methods
extension MakeComplaintsPresenter {
    
    func setupInitialization() {
        self.view.setupNavigationController()
    }
    
    func saveData(address: String, CEP: String, number: String, neighborhood: String, date: String) {
        
        ComplaintsViewModel.shared.address = address
        ComplaintsViewModel.shared.CEP = CEP
        ComplaintsViewModel.shared.number = number
        ComplaintsViewModel.shared.neighborhood = neighborhood
        ComplaintsViewModel.shared.date = date
    
    }
}

// MARK: - Private methods
extension MakeComplaintsPresenter {

}
