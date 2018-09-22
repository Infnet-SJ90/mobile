//
//  RegisterViewController.swift
//  SJ90
//
//  Created by Ronilson Batista on 21/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit

class RegisterViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: RegisterViewCell.identifier, bundle: nil), forCellReuseIdentifier: RegisterViewCell.identifier)
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension RegisterViewController: RegisterViewCellDelegate {
    func loginButton() {
        let nextController = LoginViewController()
        self.present(nextController, animated: false, completion: nil)
    }
    
    func createAccountButton() {
        print("920")
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
