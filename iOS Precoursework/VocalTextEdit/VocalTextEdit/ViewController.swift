//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by Thomas Cowern New on 10/6/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    
    
    let speechSynthsizer = NSSpeechSynthesizer()

    @IBOutlet weak var speakButton: NSButton!
    
    @IBOutlet weak var stopButton: NSButton!
    
    @IBOutlet var textView: NSTextView!
    
    @IBAction func speakButtonClicked(_ sender: NSButton) {
//        print("I should speak \(textView.string)")
        
//        speakButton.isEnabled = false
//        stopButton.isEnabled = true
        
        var contents: String? {
            get {
                return textView.string
            }
            set {
                textView.string = newValue as! String
            }
        }
        
        if contents != "" {
            speechSynthsizer.startSpeaking(contents ?? "Nothing to see here!")
        } else {
            speechSynthsizer.startSpeaking("The document is empty")
        }
    }
    
    @IBAction func stopButtonClicked(_ sender: NSButton) {
//        print("The Stop Button was Clicked")
        speechSynthsizer.stopSpeaking()
    }

}

