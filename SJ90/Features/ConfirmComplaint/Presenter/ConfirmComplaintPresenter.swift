//
//  ConfirmComplaintPresenter.swift
//  SJ90
//
//  Created by Ronilson Batista on 22/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation
import RealmSwift

final class ConfirmComplaintPresenter {
    
    fileprivate unowned let view: ConfirmComplaintProtocol
    fileprivate(set) var sucessLogin = Bool()
    
    init(view: ConfirmComplaintProtocol) {
        self.view = view
    }
}

// MARK: - Public methods
extension ConfirmComplaintPresenter {
    func setupInitialization() {
        self.view.setupNavigationController()
    }
    
    func saveComplaint() {
        let realm = try! Realm()
        
        guard let address = ComplaintsViewModel.shared.address, let cep = ComplaintsViewModel.shared.CEP, let date = ComplaintsViewModel.shared.date, let neighborhood = ComplaintsViewModel.shared.neighborhood, let number = ComplaintsViewModel.shared.number, let type = ComplaintsViewModel.shared.type else {
            return
        }

        try! realm.write {
            let database = SaveComplaintModel()
            
            database.address = address
            database.CEP = cep
            database.date = date
            database.neighborhood = neighborhood
            database.number = number
            database.type = type
            
            if let images = PhotoTakenImg.sharedInstance.photoTakenImg.image {
                database.image = UIImagePNGRepresentation(images) as NSData?
            }
            
            realm.add(database)
        }
    }
}

// MARK: - Private methods
extension ConfirmComplaintPresenter {
}
