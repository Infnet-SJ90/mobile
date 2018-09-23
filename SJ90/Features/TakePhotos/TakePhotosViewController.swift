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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.captureSessions()
        self.fetchOptions()
        self.flashButtonOff()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

// MARK: - Frame for capture methods
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

// MARK: - Flash methods
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

// MARK: - Action methods
extension TakePhotosViewController {
    
    @IBAction func takePhoto(_ sender: AnyObject) {
        let TakePhoto: DispatchQueue = DispatchQueue(label:"TakePhoto", attributes: .concurrent)
        TakePhoto.async(execute: { () in
            
            if let videoConnection = self.stillImageOutput!.connection(withMediaType: AVMediaTypeVideo) {   //2a
                
                self.stillImageOutput?.captureStillImageAsynchronously(from: videoConnection, completionHandler: {(sampleBuffer, error) in
                    
                    if (sampleBuffer != nil) {
                        
                        let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                        
                        let dataProvider = CGDataProvider(data: imageData! as CFData)
                        
                        let cgImageRef = CGImage(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: CGColorRenderingIntent.defaultIntent)
                        
                        let imagePortrait = UIImage(cgImage: cgImageRef!, scale: 1.0, orientation: .right).ImageOrientation
                        
                        DispatchQueue.main.async(execute: {
                            
                            let currentCameraInput: AVCaptureInput = self.captureSession!.inputs[0] as! AVCaptureInput
                            self.captureSession!.removeInput(currentCameraInput)
                            
                            if (currentCameraInput as! AVCaptureDeviceInput).device.position == .back {
                                if UIDevice.current.orientation.isPortrait {
                                    PhotoTakenImg.sharedInstance.photoTakenImg.image = imagePortrait()
                                }
                            }
                            self.captureSession!.stopRunning()
                            
                            let newViewController = SavePhotosViewController(nibName: "SavePhotosViewController", bundle: nil)
                            newViewController.isConfirmA = true
                            newViewController.isDisplayComplaintsA = false
                            newViewController.isDisplayA = false
                            self.present(newViewController, animated: true, completion: nil)
                        })
                    }
                })
            }
        })
    }
    
    @IBAction private func flashButton(_ sender: AnyObject) {
        if let device = backCamera {
            if device.hasFlash {
                if (device.hasFlash && (device.flashMode == AVCaptureFlashMode.on)) {
                    do {
                        try device.lockForConfiguration()
                    }catch _ {}
                    device.flashMode = AVCaptureFlashMode.off
                    device.unlockForConfiguration()
                    self.flashButtonOff()
                } else if (device.hasFlash && (device.flashMode == AVCaptureFlashMode.off)) {
                    do {
                        try device.lockForConfiguration()
                    } catch _ {}
                    device.flashMode = AVCaptureFlashMode.on
                    device.unlockForConfiguration()
                    
                    let flashOnImage = UIImage(named: "flashOn")
                    flashOnImage?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
                    flashButton.setImage(flashOnImage, for: UIControlState())
                    flashButton.tintColor = UIColor.yellow
                    
                }
            }
        }
    }
}
