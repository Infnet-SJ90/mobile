//
//  MakeComplaintsViewController.swift
//  SJ90
//
//  Created by Ronilson Batista on 22/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit
import AVFoundation
import SVProgressHUD
import CoreLocation

class MakeComplaintsViewController: UITableViewController {
    
    @IBOutlet fileprivate weak var address: UITextField!
    @IBOutlet fileprivate weak var CEP: UITextField!
    @IBOutlet fileprivate weak var number: UITextField!
    @IBOutlet fileprivate weak var neighborhood: UITextField!
    @IBOutlet fileprivate weak var date: UITextField!
    
    @IBOutlet fileprivate weak var addressCell: UITableViewCell!
    @IBOutlet fileprivate weak var CEPCell: UITableViewCell!
    @IBOutlet fileprivate weak var numberCell: UITableViewCell!
    @IBOutlet fileprivate weak var neighborhoodCell: UITableViewCell!
    @IBOutlet fileprivate weak var dateCell: UITableViewCell!
    
    @IBOutlet fileprivate weak var shadowLocation: UIView!
    @IBOutlet fileprivate weak var containerLocation: UIView!
    @IBOutlet fileprivate weak var img: UIImageView!
    
    fileprivate let locationManager = CLLocationManager()
    fileprivate var location: CLLocation?
    fileprivate let geocoder = CLGeocoder()
    fileprivate var placemark: CLPlacemark?
    
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
    
    @IBAction private func locationButton(_ sender: AnyObject) {
        self.getLocation()
    }

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
        
        if address.count < 1 { self.addressCell.backgroundColor = UIColor.red }
        else { self.addressCell.backgroundColor = UIColor.clear }
        if CEP.count < 1 { self.CEPCell.backgroundColor = UIColor.red  }
        else { self.CEPCell.backgroundColor = UIColor.clear }
        if number.count < 1 { self.numberCell.backgroundColor = UIColor.red  }
        else {  self.numberCell.backgroundColor = UIColor.clear }
        if neighborhood.count < 1 {  self.neighborhoodCell.backgroundColor = UIColor.red }
        else { self.neighborhoodCell.backgroundColor = UIColor.clear }
    }
    
    @objc func typesComplaints() {
        if self.checkFields() {
            guard let address = self.address.text, let CEP = self.CEP.text, let number = self.number.text, let neighborhood = self.neighborhood.text else {
                return
            }
            self.presenter.saveData(address: address, CEP: CEP, number: number, neighborhood: neighborhood, date: "22/09/2018")
            
            let types = "typesComplaints"
            performSegue(withIdentifier: types, sender: nil)
        } else {
            Alert.show(delegate: self, title: "Preenchar todos os campos", message: "Para continuar a denúncia você precisa preencher todos os campos", buttonTitle: "Tente novamente") { _ in }
        }
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
    
    func stopLoading() {
        SVProgressHUD.dismiss()
    }
    
    func showAlertError(with title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Location methods
extension MakeComplaintsViewController {
    func getLocation()  {
        self.startLoading()
        let authStatus = CLLocationManager.authorizationStatus()
        if authStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        
        if authStatus == .denied || authStatus == .restricted {
        }
        startLocationManager()
    }
    
    func startLocationManager() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    func stopLocationManager() {
        locationManager.stopUpdatingLocation()
        locationManager.delegate = nil
    }
}


extension MakeComplaintsViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailwithError\(error)")
        stopLocationManager()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let latestLocation = locations.last!
        
        if latestLocation.horizontalAccuracy < 0 {
            return
        }
        
        if location == nil || location!.horizontalAccuracy > latestLocation.horizontalAccuracy {
            location = latestLocation
            stopLocationManager()
            
            geocoder.reverseGeocodeLocation(latestLocation, completionHandler: { (placemarks, error) in
                if error == nil, let placemark = placemarks, !placemark.isEmpty {
                    self.placemark = placemark.last
                }
                self.parsePlacemarks()
                
            })
        }
    }
    
    func parsePlacemarks() {
        if let _ = location {
            if let placemark = placemark {
                if let city = placemark.locality, !city.isEmpty {
                    self.neighborhood.text = city
                }
                if let thoroughfare = placemark.thoroughfare, !thoroughfare.isEmpty {
                    self.address.text = thoroughfare
                }
                if let cep = placemark.postalCode, !cep.isEmpty {
                    self.CEP.text = cep
                }
                self.stopLoading()
            }
        } else {
            self.stopLoading()
            Alert.show(delegate: self, title: "Erro", message: "Erro ao obter a Localização", buttonTitle: "Tente novamente") { _ in }
        }
    }
}
