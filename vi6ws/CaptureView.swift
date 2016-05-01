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
    var imageOutput: AVCaptureStillImageOutput?
    var captureDevice: AVCaptureDevice?
    
    var cameraPosition: AVCaptureDevicePosition {
        didSet {
            setupCaptureSession()
        }
    }
    
    override init(frame: CGRect) {
        cameraPosition = .Back
        super.init(frame: frame)
        backgroundColor = UIColor.blackColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        cameraPosition = .Back
        super.init(coder: aDecoder)
        backgroundColor = UIColor.blackColor()
    }
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        if newSuperview != nil && newSuperview != superview {
            setupCaptureSession()
        } else if newSuperview == nil {
            tearDownCaptureSession()
        }
    }
    
    func setupCaptureSession() {
        tearDownCaptureSession()
        captureSession = AVCaptureSession()
        captureSession!.sessionPreset = AVCaptureSessionPresetPhoto
        setupDeviceInput(cameraPosition)
        
        imageOutput = AVCaptureStillImageOutput()
        imageOutput!.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
        captureSession!.addOutput(imageOutput)
        
        setupVideoPreviewLayer()
        captureSession?.startRunning()
    }
    
    func tearDownCaptureSession() {
        if captureSession == nil {
            return
        }
        
        captureSession?.stopRunning()
        videoPreviewLayer?.removeFromSuperlayer()
        
        captureSession = nil
        videoPreviewLayer = nil
        imageOutput = nil
    }
    
    func setupDeviceInput(position: AVCaptureDevicePosition) {
        guard let captureSession = captureSession else { return }
        
        for device in AVCaptureDevice.devices() as? [AVCaptureDevice] ?? [] {
            if device.position == position {
                do {
                    let input = try AVCaptureDeviceInput(device: device)
                    if captureSession.canAddInput(input) {
                        captureSession.addInput(input)
                        captureDevice = device
                    } else {
                        print("Capture session can't add camera input")
                    }
                } catch let error as NSError {
                    print("Error adding camera: " + error.localizedDescription)
                }
            }
        }
    }
    
    func setupVideoPreviewLayer() {
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        let layerBounds = layer.bounds
        videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        videoPreviewLayer?.bounds = layerBounds
        videoPreviewLayer?.position = CGPoint(x: CGRectGetMidX(layerBounds), y: CGRectGetMidY(layerBounds))
        
        layer.addSublayer(videoPreviewLayer!)
    }
    
}
