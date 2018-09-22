//
//  MyComplaintsViewController.swift
//  SJ90
//
//  Created by Ronilson Batista on 22/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit

class MyComplaintsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem_()
        self.tabBarItem_()
    }
    
    func navigationItem_() {
        self.navigationController?.navigationBar.barTintColor = UIColor.blue
    }
    
    func tabBarItem_() {
        tabBarItem = UITabBarItem(title: "Minhas denúncias", image: UIImage(named: "checklist"), tag: 0)
        self.tabBarController?.tabBarItem.title = "Minhas denúncias"
        self.tabBarController?.tabBar.backgroundColor = UIColor.white
        self.tabBarController?.tabBar.tintColor = UIColor.blue
        self.tabBarController?.tabBar.unselectedItemTintColor = UIColor.black
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
