//
//  LoginViewController.swift
//  SJ90
//
//  Created by Ronilson Batista on 18/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController {
    
    @IBOutlet fileprivate weak var usernameTextField: UITextField!
    @IBOutlet fileprivate weak var passwordTextField: UITextField!
    fileprivate var presenter: LoginPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = LoginPresenter(view: self)
    }
}

// MARK: - Action methods
extension LoginViewController {
    @IBAction func login(_ sender: UIButton) {
        guard let username = self.usernameTextField.text, let password = self.passwordTextField.text else { return  }
        self.presenter.login(username: username, password: password)
    }
}

// MARK: - LoginProtocol
extension LoginViewController: LoginProtocol {
    func startLoading() {
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setForegroundColor(.white)
        SVProgressHUD.setBackgroundColor(UIColor.lightGray)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.show()
    }
    
    func stopLoading() {
        SVProgressHUD.dismiss()
    }
    
    func showAlertError(with title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
