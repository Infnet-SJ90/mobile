//
//  WithoutComplaintsViewCell.swift
//  SJ90
//
//  Created by Ronilson Batista on 23/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit

class WithoutComplaintsViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var imageWithout: UIImageView!
    @IBOutlet fileprivate weak var shadow: UIView!
    @IBOutlet fileprivate weak var container: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        ButtonViewParameterization.cornerRadius(view: self.container)
        ButtonViewParameterization.shadowView(view: self.shadow, color: .white)
        
        self.imageWithout.image = self.imageWithout.image?.overlayImage(AppColor.shared.colorPrimary)
    }
}
