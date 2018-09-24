//
//  ComplaintsViewCell.swift
//  SJ90
//
//  Created by Ronilson Batista on 23/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit

class ComplaintsViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var address: UILabel!
    @IBOutlet fileprivate weak var CEP: UILabel!
    @IBOutlet fileprivate weak var number: UILabel!
    @IBOutlet fileprivate weak var neighborhood: UILabel!
    @IBOutlet fileprivate weak var date: UILabel!
    @IBOutlet fileprivate weak var type: UILabel!
    @IBOutlet fileprivate weak var shadow: UIView!
    @IBOutlet fileprivate weak var container: UIView!
    @IBOutlet fileprivate weak var shadowButton: UIView!
    @IBOutlet fileprivate weak var containerButton: UIView!
    
    @IBOutlet weak var complaintsImageButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        ButtonViewParameterization.cornerRadius(view: self.container)
        ButtonViewParameterization.shadowView(view: self.shadow, color: .white)
        ButtonViewParameterization.cornerRadius(view: self.containerButton)
        ButtonViewParameterization.shadowView(view: self.shadowButton, color: AppColor.shared.colorPrimary)
    }
    
    func fillOutlets(complaints: SaveComplaintModel) {
        
        self.address.text = complaints.address
        self.CEP.text = complaints.CEP
        self.number.text = complaints.number
        self.neighborhood.text = complaints.neighborhood
        self.date.text = complaints.date
        self.type.text = complaints.type
    }
}
