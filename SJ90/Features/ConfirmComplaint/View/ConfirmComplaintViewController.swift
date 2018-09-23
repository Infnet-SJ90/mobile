//
//  ConfirmComplaintViewController.swift
//  SJ90
//
//  Created by Ronilson Batista on 22/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit
import SVProgressHUD

class ConfirmComplaintViewController: UITableViewController {
    
    @IBOutlet fileprivate weak var address: UILabel!
    @IBOutlet fileprivate weak var CEP: UILabel!
    @IBOutlet fileprivate weak var number: UILabel!
    @IBOutlet fileprivate weak var neighborhood: UILabel!
    @IBOutlet fileprivate weak var date: UILabel!
    @IBOutlet fileprivate weak var type: UILabel!
    @IBOutlet fileprivate weak var capturedImage: UIImageView!
    
    fileprivate var presenter: ConfirmComplaintPresenter!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.presenter = ConfirmComplaintPresenter(view: self)
         self.presenter.setupInitialization()
         self.fillOutlets()
    }
}
// MARK: - Public methods
extension ConfirmComplaintViewController {
    
    func fillOutlets() {
        
        self.address.text = ComplaintsViewModel.shared.address
        self.CEP.text = ComplaintsViewModel.shared.CEP
        self.number.text = ComplaintsViewModel.shared.number
        self.neighborhood.text = ComplaintsViewModel.shared.neighborhood
        self.date.text = ComplaintsViewModel.shared.date
        self.type.text = ComplaintsViewModel.shared.type
        self.capturedImage.layer.cornerRadius = 10
        self.capturedImage.image = PhotoTakenImg.sharedInstance.photoTakenImg.image
    }
}

// MARK: - Table view data source
extension ConfirmComplaintViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
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
        button.setTitle("                    Enviar denúncia", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: UIFontWeightMedium)
//        button.addTarget(self, action: #selector(self.takePhoto), for: .touchUpInside)
        customView.addSubview(button)
        
        return customView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
}

// MARK: - ConfirmComplaintProtocol
extension ConfirmComplaintViewController: ConfirmComplaintProtocol {
    
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
    
    func stopLoading() {
        SVProgressHUD.dismiss()
    }
    
    func showAlertError(with title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
