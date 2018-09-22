//
//  MyComplaintsViewController.swift
//  SJ90
//
//  Created by Ronilson Batista on 22/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit
import SVProgressHUD

class MyComplaintsViewController: UITableViewController {
    
    fileprivate var presenter: MyComplaintsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = MyComplaintsPresenter(view: self)
        self.presenter.setupInitialization()
        
        self.tableView.register(UINib(nibName: MyComplaintsEmptyViewCell.identifier, bundle: nil), forCellReuseIdentifier: MyComplaintsEmptyViewCell.identifier)
    }
}

// MARK: - Table view data source
extension MyComplaintsViewController {
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

// MARK: - MyComplaintsEmptyCellDelegate
extension MyComplaintsViewController: MyComplaintsEmptyCellDelegate {
    func makeComplaintsButton() {
        
    }
}

// MARK: - MyComplaintsProtocol
extension MyComplaintsViewController: MyComplaintsProtocol {
    
    func setupTabBarItem() {
        tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "checklist"), tag: 0)
        tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        self.tabBarController?.tabBar.backgroundColor = UIColor.white
        self.tabBarController?.tabBar.tintColor = AppColor.shared.colorPrimary
        self.tabBarController?.tabBar.unselectedItemTintColor = UIColor.black
    }
    
    func setupNavigationController() {
        self.title = "Minhas denúncias"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white, NSFontAttributeName : UIFont.systemFont(ofSize: 15.0, weight: UIFontWeightSemibold)]
        self.navigationController?.navigationBar.barTintColor = AppColor.shared.colorPrimary
        self.view.backgroundColor = AppColor.shared.colorGrayLighten70
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

