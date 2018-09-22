//
//  ExtensionNSObject.swift
//  SJ90
//
//  Created by Ronilson Batista on 21/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

protocol Identifying { }

extension Identifying where Self : NSObject {
    static var identifier: String { return String(describing: self) }
    
    var className: String {
        return String(describing: type(of: self)).components(separatedBy: ".").last!
    }
}

extension NSObject: Identifying { }
