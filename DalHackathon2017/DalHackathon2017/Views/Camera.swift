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
    
    var session: AVCaptureSession?
    private var preview: AVCaptureVideoPreviewLayer?
    
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
