//
//  LoginViewController.swift
//  SJ90
//
//  Created by Ronilson Batista on 18/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    fileprivate var presenter: LoginPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = LoginPresenter(view: self)
    }
}

extension LoginViewController: LoginProtocol {
    func startLoading() {
    }
    
    func stopLoading() {
    }
    
    func reloadTableView() {
    }
}
