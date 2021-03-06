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
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet fileprivate weak var login: UIButton!
    fileprivate var presenter: LoginPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.returnKeyType = .done
        usernameTextField.returnKeyType = .done
        self.presenter = LoginPresenter(view: self)
        self.login.layer.cornerRadius = 10
        self.usernameTextField.layer.cornerRadius = 10
        self.passwordTextField.layer.cornerRadius = 10
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// MARK: - Action methods
extension LoginViewController {
    @IBAction func login(_ sender: UIButton) {
//        guard let username = self.usernameTextField.text, let password = self.passwordTextField.text else { return  }
//        self.presenter.login(username: username, password: password)
        
        let storyboard = UIStoryboard(name: "Complaint", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Complaint")
        self.present(controller, animated: true, completion: nil)
    
    }
    
    @IBAction func register(_ sender: UIButton) {
        let nextController = RegisterViewController()
        self.present(nextController, animated: false, completion: nil)
    }
}

// MARK: - LoginProtocol
extension LoginViewController: LoginProtocol {
    
    func success() {
        let storyboard = UIStoryboard(name: "Complaint", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Complaint")
        self.present(controller, animated: true, completion: nil)
    }
    
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

