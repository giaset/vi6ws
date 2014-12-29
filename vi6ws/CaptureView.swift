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
    
    var cameraPosition: AVCaptureDevicePosition
    
    override init(frame: CGRect) {
        cameraPosition = .Back
        super.init(frame: frame)
        backgroundColor = UIColor.blackColor()
    }
    
    required init(coder aDecoder: NSCoder) {
        cameraPosition = .Back
        super.init(coder: aDecoder)
        backgroundColor = UIColor.blackColor()
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
        captureSession!.sessionPreset = AVCaptureSessionPresetPhoto
        setupDeviceInput(cameraPosition)
        
        imageOutput = AVCaptureStillImageOutput()
        imageOutput!.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
        captureSession!.addOutput(imageOutput)
        
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
        imageOutput = nil
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
    
    func setCameraPosition(position: AVCaptureDevicePosition) {
        cameraPosition = position
        setupCaptureSession()
    }
    
    func setupVideoPreviewLayer() {
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        var layerBounds = layer.bounds
        videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        videoPreviewLayer?.bounds = layerBounds
        videoPreviewLayer?.position = CGPoint(x: CGRectGetMidX(layerBounds), y: CGRectGetMidY(layerBounds))
        
        layer.addSublayer(videoPreviewLayer)
    }
    
}
