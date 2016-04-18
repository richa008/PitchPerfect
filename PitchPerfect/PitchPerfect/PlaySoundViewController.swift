//
//  PlaySoundViewController.swift
//  PitchPerfect
//
//  Created by Deshmukh,Richa on 4/17/16.
//  Copyright © 2016 Richa. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController  {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL : NSURL!
    var audioFile : AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode : AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum ButtonType : Int {case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb}

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio();
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func playSoundButtonPressed(sender: AnyObject) {
        
        switch(ButtonType(rawValue: sender.tag)!){
        case.Slow:
            playSound(rate: 0.5)
        case.Fast:
            playSound(rate: 1.5)
        case.Chipmunk:
            playSound(pitch: 1000)
        case.Vader:
            playSound(pitch: -1000)
        case.Echo:
            playSound(echo: true)
        case.Reverb:
            playSound(reverb: true)
        }
        configureUI(.Playing)
    }
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        stopAudio()
    }
}
