//
//  MainViewCell.swift
//  SJ90
//
//  Created by Ronilson Batista on 21/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit

protocol MainViewCellDelegate: class {
    func a()
    func b()
}

class MainViewCell: UITableViewCell {
    
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b1: UIButton!
    
    var delegate: MainViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        b1.layer.cornerRadius = 5
        b2.layer.cornerRadius = 5
    }
    
    
    @IBAction func aa1(){
        self.delegate?.a()
    }
    
    @IBAction func aa2(){
        self.delegate?.b()
    }
}

