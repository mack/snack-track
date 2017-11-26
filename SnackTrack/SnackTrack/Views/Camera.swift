//
//  Camera.swift
//  DalHackathon2017
//
//  Created by Mack Boudreau on 2017-11-25.
//  Copyright © 2017 Mack Boudreau. All rights reserved.
//
import UIKit
import AVFoundation

class Camera: UIView, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    // preview
    private var session: AVCaptureSession?
    private var preview: AVCaptureVideoPreviewLayer?
    
    private let BUTTON_SIZE: CGFloat = 80
    
    private var popupLauncher: PopupLauncher?
    
    @objc func addPopup() {
        
        popupLauncher?.showSettings()

    }
    
    lazy var captureBtn: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = BUTTON_SIZE / 2.0
        btn.backgroundColor = UIColor(white: 0, alpha: 0.70)
        btn.layer.borderWidth = 1
        btn.addTarget(self, action: #selector(addPopup), for: UIControlEvents.touchUpInside)
        btn.layer.borderColor = UIColor.white.cgColor
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_control_point")
        imageView.contentMode = .center
        btn.addSubview(imageView)
        btn.addConstraintsWithFormat(format: "H:|[v0]|", views: imageView)
        btn.addConstraintsWithFormat(format: "V:|[v0]|", views: imageView)
        return btn
    }()
    
    lazy var popupView: UIView = {
        let popup = UIView()
        popup.layer.cornerRadius = 5
        popup.backgroundColor = UIColor(white: 0, alpha: 0.7)
        return popup
    }()
    
    lazy var popupLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.text = "Banana"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        popupLauncher = PopupLauncher()
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        do {
            let input = try AVCaptureDeviceInput(device: device!)
            session = AVCaptureSession()
            // added
            session?.sessionPreset = .photo
            // ---
            session?.addInput(input)
            preview = AVCaptureVideoPreviewLayer(session: session!)
            preview?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            preview?.frame = self.layer.bounds
            self.layer.addSublayer(preview!)
            session?.startRunning()
            let dataOutput = AVCaptureVideoDataOutput()
            dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue.main)
            session?.addOutput(dataOutput)
            
        } catch {
            // handle error
            fatalError("Failed to load camera: \(error)")
        }
        setupUI()
    }
    
    var date: Date = Date()
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if (date.timeIntervalSinceNow < -1) {
            let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)!
            DispatchQueue.global(qos: .background).async { // 1
                MLManager.shared.classify(buffer: pixelBuffer) { (res) in
                    DispatchQueue.main.async { // 2
                        if let val = SimulatedDatabase.foodDatabase[res.lowercased()] {
                            self.popupLabel.alpha = 1
                        } else {
                            self.popupLabel.alpha = 0.4
                        }
                        if (res == "packet") {
                            self.popupLabel.text = "Bag of food"
                        } else {
                            self.popupLabel.text = res
                        }
                        
                    }
                }
            }
            date = Date()
        }
    }
    
    private func setupUI() {
        self.addSubview(captureBtn)
        self.addSubview(popupView)
        self.addConstraintsWithFormat(format: "V:[v0(\(BUTTON_SIZE))]-25-|", views: captureBtn)
        self.addConstraintsWithFormat(format: "H:[v0(\(BUTTON_SIZE))]", views: captureBtn)
        self.addConstraint(NSLayoutConstraint(item: captureBtn, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        self.addConstraintsWithFormat(format: "V:[v0(40)]-\(BUTTON_SIZE + 41)-|", views: popupView)
        self.addConstraint(NSLayoutConstraint(item: popupView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        popupView.addSubview(popupLabel)
        popupView.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: popupLabel)
        popupView.addConstraintsWithFormat(format: "V:|[v0]|", views: popupLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
