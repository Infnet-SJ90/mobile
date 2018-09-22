//
//  MyComplaintsProtocol.swift
//  SJ90
//
//  Created by Ronilson Batista on 22/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import Foundation

protocol MyComplaintsProtocol: class {
    func startLoading()
    func stopLoading()
    func showAlertError(with title: String, message: String, buttonTitle: String)
    func setupNavigationController()
    func setupTabBarItem()
}
