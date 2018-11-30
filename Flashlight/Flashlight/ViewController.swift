//
//  ViewController.swift
//  Flashlight
//
//  Created by Thomas Cowern New on 11/24/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var toggleButton: UIButton!
    
    var isOn: Bool = false
    
    var device: AVCaptureDevice!
    
    var statusBarTextColor: UIStatusBarStyle = .lightContent {
        didSet(newValue) {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarTextColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
        if isOn == false {
            turnLightOn()
        } else {
            turnLightOff()
        }
        
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        if isOn == false {
            turnLightOn()
        } else {
            turnLightOff()
        }
    }
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
    
    func turnLightOn () {
        statusBarTextColor = .default
        self.view.backgroundColor = UIColor.white
        toggleButton.setTitle("Off", for: .normal)
        toggleButton.setTitleColor(UIColor.black, for: .normal)
        isOn = true
        toggleTorch(on: true)
        
    }
    
    func turnLightOff () {
        statusBarTextColor = .lightContent
        self.view.backgroundColor = UIColor.black
        toggleButton.setTitle("On", for: .normal)
        toggleButton.setTitleColor(UIColor.white, for: .normal)
        isOn = false
        toggleTorch(on: false)
    }
}
