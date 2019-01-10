//
//  ViewController.swift
//  Animations
//
//  Created by Thomas Cowern New on 1/8/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sunImageView: UIImageView!
    @IBOutlet weak var backCloudImageView: UIImageView!
    @IBOutlet weak var frontCloudImageView: UIImageView!
    @IBOutlet weak var showTheSunButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showTheSunButton.addTarget(self, action: #selector(animateSun), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateClouds()
        animateButton()
    }
    
    func animateClouds () {
        self.backCloudImageView.center.x -= self.view.bounds.width
        self.frontCloudImageView.center.x -= self.view.bounds.width
        
        UIView.animate(withDuration: 8.0, delay: 0, options: [.repeat], animations: { self.backCloudImageView.center.x += 2 * self.view.bounds.width }, completion: nil)
        
        UIView.animate(withDuration: 5.0, delay: 3.0, options: [.repeat], animations: { self.frontCloudImageView.center.x += 2 * self.view.bounds.width }, completion: nil)
    }
    
    func animateButton () {
        self.showTheSunButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 3.0,
                       delay: 2.0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        self.showTheSunButton.transform = .identity},
                       completion: nil)
    }
    
    @objc func animateSun () {
        let originalPosition = sunImageView.frame
        UIView.animateKeyframes(withDuration: 10.0, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4, animations: {
                self.sunImageView.center = CGPoint(x: 0.5 * self.view.frame.width, y: 0.1 * self.view.frame.height)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.6, animations: {
                self.sunImageView.center = CGPoint(x: 1 * self.view.frame.width, y: self.view.frame.height + 50)
            })
        }, completion: { (_) in
            self.sunImageView.frame = originalPosition
        })
        
        
    }
}
