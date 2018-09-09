//
//  TakePhotosViewController.swift
//  SJ90
//
//  Created by Ronilson Batista on 09/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import UIKit
import AVFoundation
import Photos
import AudioToolbox

class TakePhotosViewController: UIViewController {
    
    @IBOutlet weak fileprivate var takePhotoButton: CameraButton!
    @IBOutlet weak fileprivate var frameForCapture: UIView!
    @IBOutlet weak fileprivate var flashButton: UIButton!
    
    fileprivate var captureSession: AVCaptureSession?
    fileprivate var stillImageOutput: AVCaptureStillImageOutput?
    fileprivate var image: UIImageView = UIImageView()
    fileprivate var previewLayer: AVCaptureVideoPreviewLayer? 
    fileprivate let backCamera = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.captureSessions()
        self.fetchOptions()
        self.flashButtonOff()
    }
}

extension TakePhotosViewController {
    
    fileprivate func captureSessions() {
        
        captureSession = AVCaptureSession()
        captureSession!.sessionPreset = AVCaptureSessionPresetHigh
        
        var erro: NSError?
        var input: AVCaptureDeviceInput!
        
        do {
            input = try AVCaptureDeviceInput(device: AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo))
        } catch let error1 as NSError {
            erro = error1
            input = nil
        }
        
        let cameraSessionControllerQueue: DispatchQueue = DispatchQueue(label: "CameraSessionController Session", attributes: [])
        
        cameraSessionControllerQueue.async(execute: { () -> Void in
            if erro == nil && self.captureSession!.canAddInput(input) {
                self.captureSession!.addInput(input)
                self.stillImageOutput = AVCaptureStillImageOutput()
                self.stillImageOutput!.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
                
                if self.captureSession!.canAddOutput(self.stillImageOutput) {
                    self.captureSession!.addOutput(self.stillImageOutput)
                    self.previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
                    self.previewLayer!.videoGravity = AVLayerVideoGravityResizeAspectFill
                    
                    let orientation: UIDeviceOrientation = UIDevice.current.orientation
                    switch (orientation) {
                        case .portrait: self.previewLayer!.connection?.videoOrientation = .portrait
                        case .portraitUpsideDown: self.previewLayer!.connection?.videoOrientation = .portraitUpsideDown
                        case .landscapeRight: self.previewLayer!.connection?.videoOrientation = .landscapeLeft
                        case .landscapeLeft: self.previewLayer!.connection?.videoOrientation = .landscapeRight
                        default: self.previewLayer!.connection?.videoOrientation = .portrait
                    }
                    
                    self.captureSession!.startRunning()
                    
                    DispatchQueue.main.async(execute: {
                        self.previewLayer!.frame = self.frameForCapture.bounds
                        self.frameForCapture.layer.addSublayer(self.previewLayer!)
                        self.frameForCapture.addSubview(self.takePhotoButton)
                        self.frameForCapture.addSubview(self.flashButton)
                        self.view.layoutIfNeeded()
                    })
                }
            }
        })
    }
}

extension TakePhotosViewController {
    
    fileprivate func fetchOptions() {
        let fetchOptions: PHFetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        
        if let device = backCamera {
            if device.hasFlash {
                do {
                    try device.lockForConfiguration()
                } catch _ {
                    print("closer")
                }
                
                device.flashMode = AVCaptureFlashMode.off
                device.unlockForConfiguration()
            }
        }
    }
    
    fileprivate func flashButtonOff() {
        let flashOffImage = UIImage(named: "betterflash")
        flashOffImage?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        flashButton.setImage(flashOffImage, for: UIControlState())
        flashButton.tintColor = UIColor.white
    }
}
