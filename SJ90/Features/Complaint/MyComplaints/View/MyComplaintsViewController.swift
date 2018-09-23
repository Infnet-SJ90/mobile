//
//  MyComplaintsViewController.swift
//  SJ90
//
//  Created by Ronilson Batista on 22/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit
import SVProgressHUD
import RealmSwift

class MyComplaintsViewController: UITableViewController {
    
    fileprivate var dataBase: Realm?
    fileprivate var complaintModel: RealmSwift.Results<SaveComplaintModel>?
    fileprivate var presenter: MyComplaintsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataBase = try! Realm()
        
        self.presenter = MyComplaintsPresenter(view: self)
        self.presenter.setupInitialization()
        self.updateData()
        
        self.tableView.register(UINib(nibName: WithoutComplaintsViewCell.identifier, bundle: nil), forCellReuseIdentifier: WithoutComplaintsViewCell.identifier)
        
        self.tableView.register(UINib(nibName: ComplaintsViewCell.identifier, bundle: nil), forCellReuseIdentifier: ComplaintsViewCell.identifier)
    }
    
    func updateData() {
        guard let dataBase = self.dataBase else { return }
        complaintModel = dataBase.objects(SaveComplaintModel.self)
        tableView.reloadData()
    }
}

// MARK: - Table view data source
extension MyComplaintsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let complaint = self.complaintModel else {
            return 0
        }
        
        if complaint.count == 0 {
            return 1
        }
        return complaint.count
    }
    
    internal override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let complaint = self.complaintModel else {
            return UITableViewCell()
        }

        if complaint.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: WithoutComplaintsViewCell.identifier, for: indexPath) as! WithoutComplaintsViewCell
            return cell
        } else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: ComplaintsViewCell.identifier, for: indexPath) as! ComplaintsViewCell
            cell.fillOutlets(complaints: complaint[indexPath.row])
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 41))
        customView.backgroundColor = AppColor.shared.colorPrimary
        customView.layer.cornerRadius = 10.0
        customView.layer.shadowOpacity = 0.8
        customView.layer.shadowColor = AppColor.shared.colorSnow.cgColor
        customView.layer.shadowRadius = 3.0
        customView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 330, height: 50))
        button.setTitle("              Fazer denúncia", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: UIFontWeightMedium)
        button.addTarget(self, action: #selector(self.makeComplaints), for: .touchUpInside)
        customView.addSubview(button)
        
        return customView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let complaint = self.complaintModel else {
            return 0
        }
        
        if complaint.count == 0 {
            return 50
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let complaint = self.complaintModel else {
            return 0
        }
        
        if complaint.count == 0 {
            return 187
        } else {
            return 220
        }
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
    
    @objc func makeComplaints() {
        let types = "makeComplaints"
        performSegue(withIdentifier: types, sender: nil)
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

