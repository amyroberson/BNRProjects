//
//  ViewController.swift
//  VocalEditor
//
//  Created by Amy Roberson on 4/3/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSSpeechSynthesizerDelegate {
    
    let speechSynthesizer = NSSpeechSynthesizer()
    
    var contents: String? {
        get {
            return textView.string
        }
        set {
            textView.string = newValue
        }
    }
    
    @IBOutlet var textView: NSTextView!
    @IBOutlet var speakButton: NSButton!
    @IBOutlet var stopButtton: NSButton!
    
    
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
    
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        if !finishedSpeaking{
            speakButton.isEnabled = false
            stopButtton.isEnabled = true
        } else {
            speakButton.isEnabled = true
            stopButtton.isEnabled = false
        }
    }
}

