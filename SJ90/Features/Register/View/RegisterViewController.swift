//
//  RegisterViewController.swift
//  SJ90
//
//  Created by Ronilson Batista on 21/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit
import SVProgressHUD

class RegisterViewController: UITableViewController {
    
    fileprivate var presenter: RegisterPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = RegisterPresenter(view: self)
        self.tableView.register(UINib(nibName: RegisterViewCell.identifier, bundle: nil), forCellReuseIdentifier: RegisterViewCell.identifier)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// MARK: - Table view data source
extension RegisterViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RegisterViewCell.identifier, for: indexPath) as! RegisterViewCell
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 736
    }
}

// MARK: - RegisterViewCellDelegate
extension RegisterViewController: RegisterViewCellDelegate {
    func createAccountButton(name: String, email: String, cpf: String, password: String) {
        //        self.presenter.Register(username: name, password: password, email: email, cpf: cpf)
    }
    
    func loginButton() {
        let nextController = LoginViewController()
        self.present(nextController, animated: false, completion: nil)
    }
    
}

// MARK: - RegisterProtocol
extension RegisterViewController: RegisterProtocol {
    
    func successAccount() {
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
