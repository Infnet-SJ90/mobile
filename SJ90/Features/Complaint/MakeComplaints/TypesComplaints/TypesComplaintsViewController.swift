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
        
        self.radioCheckViewTypeA.layer.cornerRadius = self.radioCheckViewTypeA.bounds.width / 2
        self.radioCheckViewTypeA.layer.borderWidth = 1
        self.radioCheckViewTypeA.layer.borderColor = AppColor.shared.colorGrayLighten60.cgColor
        self.radioCheckViewTypeA.backgroundColor = AppColor.shared.colorGrayLighten70
        
        self.radioCheckedViewTypeA.layer.cornerRadius = self.radioCheckedViewTypeA.bounds.width / 2
        self.radioCheckedViewTypeA.backgroundColor = AppColor.shared.colorPrimary
    }
}

extension TypesComplaintsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
}
