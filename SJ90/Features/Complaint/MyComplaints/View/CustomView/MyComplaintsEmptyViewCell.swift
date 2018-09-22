//
//  MyComplaintsEmptyViewCell.swift
//  SJ90
//
//  Created by Ronilson Batista on 22/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit

protocol MyComplaintsEmptyCellDelegate: class {
    func makeComplaintsButton()
}

class MyComplaintsEmptyViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var makeComplaints: UIButton!
    @IBOutlet fileprivate weak var imageWithout: UIImageView!
    
    var delegate: MyComplaintsEmptyCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.makeComplaints.layer.cornerRadius = 10
        self.imageWithout.image = self.imageWithout.image?.overlayImage(AppColor.shared.colorPrimary)
    }
}

// MARK: - Action methods
extension MyComplaintsEmptyViewCell {
    @IBAction func makeComplaintsButton(){
        self.delegate?.makeComplaintsButton()
    }
}

