//
//  SaveComplaintModel.swift
//  SJ90
//
//  Created by Ronilson Batista on 23/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit
import RealmSwift

class SaveComplaintModel: Object {
    
    @objc dynamic var address = ""
    @objc dynamic var CEP = ""
    @objc dynamic var number = ""
    @objc dynamic var neighborhood = ""
    @objc dynamic var image: NSData? = nil
    @objc dynamic var date = ""
    @objc dynamic var type = ""
}
