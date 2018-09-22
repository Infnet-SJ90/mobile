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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addGesture()
        
        self.radioViewParameterization(radioCheckViewTypeA, radioCheckedViewTypeA)
        self.radioViewParameterization(radioCheckViewTypeB, radioCheckedViewTypeB)
        self.radioViewParameterization(radioCheckViewTypeC, radioCheckedViewTypeC)
        self.radioViewParameterization(radioCheckViewTypeD, radioCheckedViewTypeD)
    }
}

// MARK: - Private methods
extension TypesComplaintsViewController {
    
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
}

// MARK: - MakeComplaintsProtocol
extension TypesComplaintsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}
