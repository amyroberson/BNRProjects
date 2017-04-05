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
    @IBOutlet var progressBar: NSProgressIndicator!
    
    override func loadView(){
        super.loadView()
        speechSynthesizer.delegate = self
        speakButton.isEnabled = true
        stopButtton.isEnabled = false
        progressBar.isHidden = true
    }
    
    @IBAction func speakButtonClicked(_ sender: NSButton) {
        
        if let contents = textView.string, !contents.isEmpty {
            speechSynthesizer.startSpeaking(contents)
        } else {
            speechSynthesizer.startSpeaking("This Document is empty.")
        }
        speakButton.isEnabled = false
        stopButtton.isEnabled = true
        progressBar.isHidden = false
        progressBar.increment(by: 5.0)
        progressBar.minValue = 0.0
        progressBar.maxValue = 100.0
        progressBar.startAnimation(sender)
    
    }
    
    
    @IBAction func stopButtonClickerd(_ sender: NSButton) {
        speechSynthesizer.stopSpeaking()
        progressBar.stopAnimation(sender)
        progressBar.isHidden = true
    }
    
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        
        speakButton.isEnabled = true
        stopButtton.isEnabled = false
        progressBar.isHidden = true
    }
}

