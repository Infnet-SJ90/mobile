//
//  RegisterProtocol.swift
//  SJ90
//
//  Created by Ronilson Batista on 21/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

protocol RegisterProtocol: class {
    func startLoading()
    func stopLoading()
    func successAccount()
    func showAlertError(with title: String, message: String, buttonTitle: String)
}
