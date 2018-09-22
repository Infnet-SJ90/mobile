//
//  TypesComplaintsViewController.swift
//  SJ90
//
//  Created by Ronilson Batista on 22/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit

class TypesComplaintsViewController: UITableViewController {
    
    @IBOutlet fileprivate weak var radioCheckViewTypeA: UIView!
    @IBOutlet fileprivate weak var radioCheckedViewTypeA: UIView!
    @IBOutlet fileprivate weak var radioCheckViewTypeB: UIView!
    @IBOutlet fileprivate weak var radioCheckedViewTypeB: UIView!
    @IBOutlet fileprivate weak var radioCheckViewTypeC: UIView!
    @IBOutlet fileprivate weak var radioCheckedViewTypeC: UIView!
    @IBOutlet fileprivate weak var radioCheckViewTypeD: UIView!
    @IBOutlet fileprivate weak var radioCheckedViewTypeD: UIView!
    
    @IBOutlet fileprivate weak var shadowView: UIView!
    @IBOutlet fileprivate weak var containerView: UIView!
    
    @IBOutlet fileprivate weak var typeA: UILabel!
    @IBOutlet fileprivate weak var typeB: UILabel!
    @IBOutlet fileprivate weak var typeC: UILabel!
    @IBOutlet fileprivate weak var typeD: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addGesture()
        self.viewParameterization()
        self.labelParameterization()
        
        if let tabBarMenu = self.tabBarController {
            tabBarMenu.tabBar.isHidden = true
        }
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.radioViewParameterization(radioCheckViewTypeA, radioCheckedViewTypeA)
        self.radioViewParameterization(radioCheckViewTypeB, radioCheckedViewTypeB)
        self.radioViewParameterization(radioCheckViewTypeC, radioCheckedViewTypeC)
        self.radioViewParameterization(radioCheckViewTypeD, radioCheckedViewTypeD)
    }
}

// MARK: - Private methods
extension TypesComplaintsViewController {
    fileprivate func viewParameterization() {
        ButtonViewParameterization.cornerRadius(view: self.containerView)
        ButtonViewParameterization.shadowView(view: self.shadowView, color: .white)
    }
    
    fileprivate func labelParameterization() {
        self.typeA.attributedText = self.createLabelText(bold: "Classe A: ", regular: "Alvenarias, concreto, argamassas e solos - podem ser reutilizados na forma de agregados.")
        self.typeB.attributedText = self.createLabelText(bold: "Classe B: ", regular: "Restos de madeira, metal, plástico, papel, papelão, gesso, vidros - podem ser reutilizados no próprio canteiro de obra ou encaminhados para reciclagem.")
        self.typeC.attributedText = self.createLabelText(bold: "Classe C: ", regular: "Resíduos sem tecnologia para reciclagem.")
        self.typeD.attributedText = self.createLabelText(bold: "Classe D: ", regular: "Resíduos perigosos, tais como tintas, solventes, óleos e outros, ou aqueles contaminados oriundos de obras em clínicas radiológicas, hospitais, instalações, industriais, etc.")
    }
    
    private func createLabelText(bold: String, regular: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString()
        
        let boldAttributes = [NSForegroundColorAttributeName : AppColor.shared.colorPrimary,
                              NSFontAttributeName : UIFont.systemFont(ofSize: 17.0, weight: UIFontWeightBold)]
        let regularAtrributes = [NSForegroundColorAttributeName : UIColor.black,
                                 NSFontAttributeName : UIFont.systemFont(ofSize: 17.0)]
        
        attributedString.append(NSAttributedString(string: bold, attributes: boldAttributes))
        attributedString.append(NSAttributedString(string: regular, attributes: regularAtrributes))
        return attributedString
    }
    
    fileprivate func radioViewParameterization(_ radioCheck: UIView, _ radioChecked: UIView) {
        
        radioCheck.layer.cornerRadius = radioCheck.bounds.width / 2
        radioCheck.layer.borderWidth = 1
        radioCheck.layer.borderColor = AppColor.shared.colorGrayLighten60.cgColor
        radioCheck.backgroundColor = AppColor.shared.colorGrayLighten70
        
        radioChecked.layer.cornerRadius = radioChecked.bounds.width / 2
        radioChecked.backgroundColor = AppColor.shared.colorGrayLighten70
    }
    
    fileprivate func addGesture() {
        let gestureA = UITapGestureRecognizer(target: self, action: #selector(tapGestureCheckedViewTypeA(sender:)))
        self.radioCheckedViewTypeA.addGestureRecognizer(gestureA)
        
        let gestureB = UITapGestureRecognizer(target: self, action: #selector(tapGestureCheckedViewTypeB(sender:)))
        self.radioCheckedViewTypeB.addGestureRecognizer(gestureB)
        
        let gestureC = UITapGestureRecognizer(target: self, action: #selector(tapGestureCheckedViewTypeC(sender:)))
        self.radioCheckedViewTypeC.addGestureRecognizer(gestureC)
        
        let gestureD = UITapGestureRecognizer(target: self, action: #selector(tapGestureCheckedViewTypeD(sender:)))
        self.radioCheckedViewTypeD.addGestureRecognizer(gestureD)
    }
    
    private dynamic func tapGestureCheckedViewTypeA(sender: UITapGestureRecognizer) {
        self.radioCheckedViewTypeA.backgroundColor = AppColor.shared.colorPrimary
        self.radioCheckedViewTypeB.backgroundColor = AppColor.shared.colorGrayLighten70
        self.radioCheckedViewTypeC.backgroundColor = AppColor.shared.colorGrayLighten70
        self.radioCheckedViewTypeD.backgroundColor = AppColor.shared.colorGrayLighten70
    }
    
    private dynamic func tapGestureCheckedViewTypeB(sender: UITapGestureRecognizer) {
        self.radioCheckedViewTypeA.backgroundColor = AppColor.shared.colorGrayLighten70
        self.radioCheckedViewTypeB.backgroundColor = AppColor.shared.colorPrimary
        self.radioCheckedViewTypeC.backgroundColor = AppColor.shared.colorGrayLighten70
        self.radioCheckedViewTypeD.backgroundColor = AppColor.shared.colorGrayLighten70
    }
    
    private dynamic func tapGestureCheckedViewTypeC(sender: UITapGestureRecognizer) {
        self.radioCheckedViewTypeA.backgroundColor = AppColor.shared.colorGrayLighten70
        self.radioCheckedViewTypeB.backgroundColor = AppColor.shared.colorGrayLighten70
        self.radioCheckedViewTypeC.backgroundColor = AppColor.shared.colorPrimary
        self.radioCheckedViewTypeD.backgroundColor = AppColor.shared.colorGrayLighten70
    }
    
    private dynamic func tapGestureCheckedViewTypeD(sender: UITapGestureRecognizer) {
        self.radioCheckedViewTypeA.backgroundColor = AppColor.shared.colorGrayLighten70
        self.radioCheckedViewTypeB.backgroundColor = AppColor.shared.colorGrayLighten70
        self.radioCheckedViewTypeC.backgroundColor = AppColor.shared.colorGrayLighten70
        self.radioCheckedViewTypeD.backgroundColor = AppColor.shared.colorPrimary
    }
    
    @objc func takePhoto() {
        let nextController = TakePhotosViewController()
        self.present(nextController, animated: false, completion: nil)
    }
}

// MARK: - MakeComplaintsProtocol
extension TypesComplaintsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
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
        button.setTitle("              Tirar Foto", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: UIFontWeightMedium)
        button.addTarget(self, action: #selector(self.takePhoto), for: .touchUpInside)
        customView.addSubview(button)
        
        return customView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
}
