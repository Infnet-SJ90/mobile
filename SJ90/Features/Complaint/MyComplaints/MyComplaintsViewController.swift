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
        
        self.tableView.register(UINib(nibName: MyComplaintsEmptyViewCell.identifier, bundle: nil), forCellReuseIdentifier: MyComplaintsEmptyViewCell.identifier)
    }
    
    func navigationItem_() {

        self.title = "Minhas denúncias"        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white, NSFontAttributeName : UIFont.systemFont(ofSize: 15.0, weight: UIFontWeightSemibold)]
        self.navigationController?.navigationBar.barTintColor = AppColor.shared.colorPrimary
        self.view.backgroundColor = AppColor.shared.colorGrayLighten70
    }
    
    func tabBarItem_() {
        tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "checklist"), tag: 0)
        tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        self.tabBarController?.tabBar.backgroundColor = UIColor.white
        self.tabBarController?.tabBar.tintColor = AppColor.shared.colorPrimary
        self.tabBarController?.tabBar.unselectedItemTintColor = UIColor.black
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyComplaintsEmptyViewCell.identifier, for: indexPath) as! MyComplaintsEmptyViewCell
        cell.delegate = self
        return cell
    }
}

extension MyComplaintsViewController: MyComplaintsEmptyCellDelegate {
    func makeComplaintsButton() {
        
    }
}
