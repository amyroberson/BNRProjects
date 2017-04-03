//
//  ViewController.swift
//  VocalEditor
//
//  Created by Amy Roberson on 4/3/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    let speechSynthesizer = NSSpeechSynthesizer()
    
    @IBOutlet var textView: NSTextView!
    
    @IBAction func speakButtonClicked(_ sender: NSButton) {
        if let contents = textView.string, !contents.isEmpty {
            speechSynthesizer.startSpeaking(contents)
        } else {
            speechSynthesizer.startSpeaking("This Document is empty.")
        }
    }
    
    
    @IBAction func stopButtonClickerd(_ sender: NSButton) {
        speechSynthesizer.stopSpeaking()
    }

}

