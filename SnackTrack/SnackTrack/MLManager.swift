//
//  MLManager.swift
//  DalHackathon2017
//
//  Created by Mack Boudreau on 2017-11-25.
//  Copyright © 2017 Mack Boudreau. All rights reserved.
//

import UIKit
import CoreML
import Vision
import ImageIO

class MLManager: NSObject {
    static var shared = MLManager()
    
    func classify(buffer: CVPixelBuffer, completion: @escaping ([String]) -> ()) {
        do {
            let model = try VNCoreMLModel(for: MobileNet().model)
            let request = VNCoreMLRequest(model: model) { (req, err) in
                if let _ = err {
                    return
                }
                print(req.results?.first)
            }
            try VNImageRequestHandler(cvPixelBuffer: buffer, options: [:]).perform([request])
        } catch {
            fatalError("Error!")
        }
    }

}



