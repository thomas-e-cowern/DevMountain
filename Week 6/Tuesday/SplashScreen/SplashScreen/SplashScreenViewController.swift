//
//  SplashScreenViewController.swift
//  SplashScreen
//
//  Created by Thomas Cowern New on 1/9/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var purpleView: UIView!
    @IBOutlet weak var yelloeView: UIView!
    
    @IBOutlet weak var redViewLeftConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playButton.layer.cornerRadius = playButton.bounds.height/2
        playButton.layer.borderColor = UIColor.lightGray.cgColor
        playButton.layer.borderWidth = 10.0
        
        playButton.layer.shadowColor = UIColor.purple.cgColor
        playButton.layer.shadowRadius = 10.0
        playButton.layer.shadowOpacity = 1.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateRedView()
        animatePurpleView()
        animateBlueView()
    }
    
    func animateRedView() {
        UIView.animate(withDuration: 2.0, delay: 0, options: [.repeat], animations: {
            self.redViewLeftConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func animatePurpleView() {
        UIView.animate(withDuration: 2.0, delay: 0, options: [.repeat, .curveLinear], animations: {
            self.purpleView.center = CGPoint(x: self.purpleView.center.x + self.view.bounds.width, y: self.purpleView.center.y)
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func animateBlueView() {
        UIView.animate(withDuration: 2.0, delay: 0, options: [.curveLinear, .repeat], animations: {
            self.yelloeView.center = CGPoint(x: self.yelloeView.center.x - self.view.bounds.width, y: self.yelloeView.center.y)
            
            self.yelloeView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }, completion: nil)
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
    }
    
}
