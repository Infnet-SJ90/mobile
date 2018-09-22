//
//  MainViewController.swift
//  SJ90
//
//  Created by Ronilson Batista on 21/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController, MainViewCellDelegate {
    func a() {
        let nextController = LoginViewController()
        self.present(nextController, animated: false, completion: nil)
    }
    
    func b() {
        let nextController = RegisterViewController()
        self.present(nextController, animated: false, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: MainViewCell.identifier, bundle: nil), forCellReuseIdentifier: MainViewCell.identifier)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainViewCell.identifier, for: indexPath) as! MainViewCell
        cell.delegate = self
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 736
    }
}
