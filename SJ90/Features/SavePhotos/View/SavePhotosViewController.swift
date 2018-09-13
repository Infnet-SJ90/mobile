//
//  SavePhotosViewController.swift
//  SJ90
//
//  Created by Ronilson Batista on 09/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class SavePhotosViewController: UIViewController {
    
    @IBOutlet weak private var capturedImage: UIImageView!
 
    override func viewDidLoad() {
        super.viewDidLoad()

       self.capturedImage.image = PhotoTakenImg.sharedInstance.photoTakenImg.image
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction private func cancelButtonTapped(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
}
