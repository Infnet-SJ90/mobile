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
    
    @IBOutlet fileprivate weak var capturedImage: UIImageView!
    @IBOutlet fileprivate weak var shadowButton: UIView!
    @IBOutlet fileprivate weak var containerButton: UIView!
    @IBOutlet fileprivate weak var button: UIButton!
    
    var isDisplayA = Bool()
    var isConfirmA = Bool()
    var isDisplayComplaintsA = Bool()
    var saveComplaintModel: SaveComplaintModel?
 
    override func viewDidLoad() {
        super.viewDidLoad()

        self.containerButton.isHidden = true
        self.shadowButton.isHidden = true
        self.button.isHidden = true
        
        if let tabBarMenu = self.tabBarController {
            tabBarMenu.tabBar.isHidden = true
        }
        
        if isConfirmA { self.isConfirm() }
        if isDisplayA { self.isDisplay() }
        if isDisplayComplaintsA { self.isDisplayComplaints(complaints: self.saveComplaintModel!) }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction private func cancelButtonTapped(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func isConfirm() {
        self.capturedImage.image = PhotoTakenImg.sharedInstance.photoTakenImg.image
        ButtonViewParameterization.cornerRadius(view: self.containerButton)
        ButtonViewParameterization.shadowView(view: self.shadowButton, color: AppColor.shared.colorPrimary)
        self.containerButton.isHidden = false
        self.shadowButton.isHidden = false
        self.button.isHidden = false
    }
    
    func isDisplay() {
        self.capturedImage.image = PhotoTakenImg.sharedInstance.photoTakenImg.image
    }
    
    func isDisplayComplaints(complaints: SaveComplaintModel) {
        if let data = complaints.image as? Data {
            self.capturedImage.image = UIImage(data: data)
        }
    }
    
    @IBAction func confirm(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "ConfirmComplaint", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ConfirmComplaint")
        self.present(controller, animated: true, completion: nil)
    }
}
