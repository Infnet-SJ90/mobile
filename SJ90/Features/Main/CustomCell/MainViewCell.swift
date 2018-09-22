//
//  MainViewCell.swift
//  SJ90
//
//  Created by Ronilson Batista on 21/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit

protocol MainViewCellDelegate: class {
    func loginButton()
    func registerButton()
}

class MainViewCell: UITableViewCell {
    
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var register: UIButton!
    
    var delegate: MainViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.login.layer.cornerRadius = 5
        self.register.layer.cornerRadius = 5
    }
}

// MARK: - Action methods
extension MainViewCell {
    @IBAction func loginButton(){
        self.delegate?.loginButton()
    }
    
    @IBAction func registerButton(){
        self.delegate?.registerButton()
    }
}

