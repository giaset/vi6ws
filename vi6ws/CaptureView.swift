//
//  CaptureView.swift
//  vi6ws
//
//  Created by Gianni Settino on 2014-12-14.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit
import AVFoundation

class CaptureView: UIView {
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    var cameraPosition: AVCaptureDevicePosition {
        get {
            return self.cameraPosition
        }
        set {
            self.cameraPosition = newValue
            setupCaptureSession()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        cameraPosition = .Back
    }
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        if (newSuperview != nil && newSuperview != superview) {
            setupCaptureSession()
        } else if (newSuperview == nil) {
            tearDownCaptureSession()
        }
    }
    
    func setupCaptureSession() {
        tearDownCaptureSession()
        captureSession = AVCaptureSession()
        setupDeviceInput(cameraPosition)
        setupVideoPreviewLayer()
        captureSession?.startRunning()
    }
    
    func tearDownCaptureSession() {
        if (captureSession == nil) {
            return;
        }
        
        captureSession?.stopRunning()
        videoPreviewLayer?.removeFromSuperlayer()
        
        captureSession = nil
        videoPreviewLayer = nil
    }
    
    func setupDeviceInput(position: AVCaptureDevicePosition) {
        for device: AVCaptureDevice in AVCaptureDevice.devices() as [AVCaptureDevice] {
            if (device.position == position) {
                var error: NSError? = nil
                var input = AVCaptureDeviceInput(device: device, error: &error)
                if (error == nil) {
                    if (captureSession!.canAddInput(input)) {
                        captureSession?.addInput(input)
                    } else {
                        println("Capture session can't add camera input")
                    }
                } else {
                    println("Error adding camera: " + error!.localizedDescription)
                }
            }
        }
    }
    
    func setupVideoPreviewLayer() {
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.frame = bounds
        layer.addSublayer(videoPreviewLayer)
    }
    
}
