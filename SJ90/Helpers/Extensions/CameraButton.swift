//
//  CameraButton.swift
//  SJ90
//
//  Created by Ronilson Batista on 09/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit

class CameraButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = bounds.size.width / 2
        layer.borderWidth = 3
        layer.borderColor = AppColor.shared.colorPrimary.cgColor
        alpha = 0.7
        layer.masksToBounds = true
    }
}
