//
//  MakeComplaintsViewController.swift
//  SJ90
//
//  Created by Ronilson Batista on 22/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit
import SVProgressHUD

class MakeComplaintsViewController: UITableViewController {
    
    @IBOutlet fileprivate weak var address: UITextField!
    @IBOutlet fileprivate weak var CEP: UITextField!
    @IBOutlet fileprivate weak var number: UITextField!
    @IBOutlet fileprivate weak var neighborhood: UITextField!
    @IBOutlet fileprivate weak var date: UITextField!
    @IBOutlet fileprivate weak var shadowLocation: UIView!
    @IBOutlet fileprivate weak var containerLocation: UIView!
    @IBOutlet fileprivate weak var img: UIImageView!
    
    fileprivate var presenter: MakeComplaintsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = MakeComplaintsPresenter(view: self)
        self.presenter.setupInitialization()
        self.styleTextField()
        self.viewParameterization()
        
        self.img.image = self.img.image?.overlayImage(AppColor.shared.colorPrimary)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "camera"), tag: 1)
        tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        self.tabBarController?.tabBar.backgroundColor = UIColor.white
        self.tabBarController?.tabBar.tintColor = AppColor.shared.colorPrimary
        self.tabBarController?.tabBar.unselectedItemTintColor = UIColor.black
    }
}

// MARK: - Private methods
extension MakeComplaintsViewController {
    
    fileprivate func styleTextField() {
        self.address.layer.cornerRadius = 10
        self.CEP.layer.cornerRadius = 10
        self.number.layer.cornerRadius = 10
        self.neighborhood.layer.cornerRadius = 10
        self.date.layer.cornerRadius = 10
    }
    
    fileprivate func viewParameterization() {
        ButtonViewParameterization.cornerRadius(view: self.containerLocation)
        ButtonViewParameterization.shadowView(view: self.shadowLocation, color: .white)
    }
    
    fileprivate func checkFields() -> Bool {
        self.tintCell()
        
        guard let address = self.address.text, let CEP = self.CEP.text, let number = self.number.text, let neighborhood = self.neighborhood.text else {
            return false
        }
        
        if address.count >= 1, CEP.count >= 1, number.count >= 1, neighborhood.count >= 1 {
            return true
        }else {
            return false
        }
    }
    
    func tintCell() {
        
        guard let address = self.address.text, let CEP = self.CEP.text, let number = self.number.text, let neighborhood = self.neighborhood.text else {
            return
        }
        
        if address.count < 1 { self.address.layer.borderColor = UIColor.red.cgColor }
        else { self.address.layer.borderColor = UIColor.white.cgColor }
        if CEP.count < 1 { self.CEP.layer.borderColor = UIColor.red.cgColor }
        else { self.CEP.layer.borderColor = UIColor.white.cgColor }
        if number.count < 1 { self.number.layer.borderColor = UIColor.red.cgColor}
        else { self.number.layer.borderColor = UIColor.white.cgColor}
        if neighborhood.count < 1 { self.neighborhood.layer.borderColor = UIColor.red.cgColor}
        else { self.neighborhood.layer.borderColor = UIColor.white.cgColor}
    }
}

// MARK: - MakeComplaintsProtocol
extension MakeComplaintsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
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
        button.setTitle("                 Continuar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: UIFontWeightMedium)
        button.addTarget(self, action: #selector(self.typesComplaints), for: .touchUpInside)
        customView.addSubview(button)
        
        return customView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
}

// MARK: - MakeComplaintsProtocol
extension MakeComplaintsViewController: MakeComplaintsProtocol {
    
    func setupNavigationController() {
        self.navigationController?.navigationBar.barTintColor = AppColor.shared.colorPrimary
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white, NSFontAttributeName : UIFont.systemFont(ofSize: 15.0, weight: UIFontWeightSemibold)]
        self.navigationController?.navigationBar.barTintColor = AppColor.shared.colorPrimary
        self.view.backgroundColor = AppColor.shared.colorGrayLighten70
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    func startLoading() {
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setForegroundColor(.white)
        SVProgressHUD.setBackgroundColor(UIColor.lightGray)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.show()
    }
    
    @objc func typesComplaints() {
        if self.checkFields() {
            let types = "typesComplaints"
            performSegue(withIdentifier: types, sender: nil)
        } else {
            Alert.show(delegate: self, title: "Preenchar todos os campos", message: "Para continuar a denúncia você precisa preencher todos os campos", buttonTitle: "Tente novamente") { _ in }
        }
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