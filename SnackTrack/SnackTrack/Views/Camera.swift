//
//  Camera.swift
//  DalHackathon2017
//
//  Created by Mack Boudreau on 2017-11-25.
//  Copyright © 2017 Mack Boudreau. All rights reserved.
//
import UIKit
import AVFoundation

class Camera: UIView {
    
    // preview
    private var session: AVCaptureSession?
    private var preview: AVCaptureVideoPreviewLayer?
    
    private let BUTTON_SIZE: CGFloat = 80
    
    lazy var captureBtn: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = BUTTON_SIZE / 2.0
        btn.backgroundColor = UIColor(white: 0, alpha: 0.70)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.white.cgColor
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
        label.text = "Test"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        do {
            let input = try AVCaptureDeviceInput(device: device!)
            session = AVCaptureSession()
            session?.addInput(input)
            preview = AVCaptureVideoPreviewLayer(session: session!)
            preview?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            preview?.frame = self.layer.bounds
            self.layer.addSublayer(preview!)
            session?.startRunning()
        } catch {
            // handle error
            fatalError("Failed to load camera: \(error)")
        }
        setupUI()
    }
    
    private func setupUI() {
        self.addSubview(captureBtn)
        self.addSubview(popupView)
        self.addConstraintsWithFormat(format: "V:[v0(\(BUTTON_SIZE))]-16-|", views: captureBtn)
        self.addConstraintsWithFormat(format: "H:[v0(\(BUTTON_SIZE))]", views: captureBtn)
        self.addConstraint(NSLayoutConstraint(item: captureBtn, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        self.addConstraintsWithFormat(format: "V:[v0(40)]-\(BUTTON_SIZE + 30)-|", views: popupView)
        self.addConstraintsWithFormat(format: "H:|-25-[v0]-25-|", views: popupView)
        popupView.addSubview(popupLabel)
        popupView.addConstraintsWithFormat(format: "H:|[v0]|", views: popupLabel)
        popupView.addConstraintsWithFormat(format: "V:|[v0]|", views: popupLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
