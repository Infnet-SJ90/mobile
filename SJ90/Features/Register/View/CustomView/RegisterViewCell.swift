//
//  RegisterViewCell.swift
//  SJ90
//
//  Created by Ronilson Batista on 21/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit

protocol RegisterViewCellDelegate: class {
    func loginButton()
    func createAccountButton(name: String, email: String, cpf: String, password: String)
}

class RegisterViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var nameTextField: UITextField!
    @IBOutlet fileprivate weak var usernameTextField: UITextField!
    @IBOutlet fileprivate weak var cpfTextField: UITextField!
    @IBOutlet fileprivate weak var passwordTextField: UITextField!
    @IBOutlet fileprivate weak var confirmPasswordTextField: UITextField!
    @IBOutlet fileprivate weak var login: UIButton!
    
    var delegate: RegisterViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.nameTextField.layer.cornerRadius = 10
        self.usernameTextField.layer.cornerRadius = 10
        self.cpfTextField.layer.cornerRadius = 10
        self.passwordTextField.layer.cornerRadius = 10
        self.login.layer.cornerRadius = 10
        self.confirmPasswordTextField.layer.cornerRadius = 10
    }
}

// MARK: - Action methods
extension RegisterViewCell {
    @IBAction func loginButton(){
        self.delegate?.loginButton()
    }
    
    @IBAction func createAccountButton() {
        guard let name = self.nameTextField.text, let email = self.usernameTextField.text, let cpf = self.cpfTextField.text, let password = self.passwordTextField.text else {
            return
        }
        self.delegate?.createAccountButton(name: name, email: email, cpf: cpf, password: password)
    }
}

