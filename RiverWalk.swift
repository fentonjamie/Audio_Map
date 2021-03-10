//
//  RiverWalk.swift
//  SampleTriggering
//
//  Created by Jamie Fenton on 23/10/2020.
//  Copyright © 2020 Nicholas Arner. All rights reserved.
//

import UIKit
import AudioKit
import GoogleMaps
import SpriteKit

//var audioSamplerRiver: AudioSampler!

class RiverWalk: UIViewController {
    
    let emitterNode = SKEmitterNode(fileNamed: "Rain.sks")! // set the emitting rain constant

    @IBOutlet var RiverWalkStreetView: GMSPanoramaView!
    
           override func viewDidLoad() {
               super.viewDidLoad()
            
            addRain()
            emitterNode.isHidden = true
            
            RiverWalkStreetView.moveNearCoordinate(CLLocationCoordinate2D(latitude: 53.958875, longitude: -1.085757)) // set coordinates for the street view
            
            // start background volume
            
            audioSampler.riverPlayer.play()
            
            // initilise the volume to 0.5 so it matches the slider 
            
                        audioSampler.playerSix.volume = 0.5
                        audioSampler.goosePlayer.volume = 0.5
                        audioSampler.rowPlayer.volume = 0.5
                        audioSampler.dogPlayer.volume = 0.5
                        audioSampler.riverPlayer.volume = 0.5
}
    
    @IBOutlet var BikeButton: UIButton!
    
    @IBOutlet var GooseButton: UIButton!
    
    @IBOutlet var RowButton: UIButton!
    
    @IBOutlet var DogButton: UIButton!
    
    
    @IBAction func BikeRide(_ sender: UIButton) {
        if audioSampler.playerSix.isPlaying {
            audioSampler.StopSample(number: 6)
            BikeButton.setTitleColor(.white, for: .normal)}
        else{
        audioSampler.PlaySample(number: 6)
        sender.pulsate()
        BikeButton.setTitleColor(.systemTeal, for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 15.5) {
            self.BikeButton.setTitleColor(.white, for: .normal)}
    }
}
    
    
    @IBAction func GooseSound(_ sender: UIButton) {
        if audioSampler.goosePlayer.isPlaying {
            audioSampler.StopSample(number: 8)
            GooseButton.setTitleColor(.black, for: .normal)
             
         }
             else {
                audioSampler.PlaySample(number: 8)
                sender.pulsate()
                GooseButton.setTitleColor(.systemTeal, for: .normal)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.GooseButton.setTitleColor(.black, for: .normal)}
             }
    }
    
    @IBAction func RowSound(_ sender: UIButton) {
        if audioSampler.rowPlayer.isPlaying {
            audioSampler.StopSample(number: 9)
            RowButton.setTitleColor(.white, for: .normal)
             }
       else{
            audioSampler.PlaySample(number: 9)
            sender.pulsate()
            RowButton.setTitleColor(.systemTeal, for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + 22.5) {
            self.RowButton.setTitleColor(.white, for: .normal)}
                 }
    }
    
    @IBAction func DogSound(_ sender: UIButton) {
        
        if audioSampler.dogPlayer.isPlaying {
            audioSampler.StopSample(number: 10)
            DogButton.setTitleColor(.black, for: .normal)
                   
               }
        else {
            audioSampler.PlaySample(number: 10)
            DogButton.setTitleColor(.systemTeal, for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + 8.5) {
            self.DogButton.setTitleColor(.black, for: .normal)}
                   }
    }
    
    @IBAction func BackgroundVolume(_ sender: UISlider) {
        audioSampler.SetPlayervolume(forPlayer: 11, tovolume: sender.value)
    }
    
    @IBAction func BikeVolume(_ sender: UISlider) {
        audioSampler.SetPlayervolume(forPlayer: 6, tovolume: sender.value)
    }
    
    @IBAction func GooseVolume(_ sender: UISlider) {
        audioSampler.SetPlayervolume(forPlayer: 8, tovolume: sender.value)
    }
    
    @IBAction func RowVolume(_ sender: UISlider) {
        audioSampler.SetPlayervolume(forPlayer: 9, tovolume: sender.value)
    }
    
    @IBAction func DogVolume(_ sender: UISlider) {
        audioSampler.SetPlayervolume(forPlayer: 10, tovolume: sender.value)
    }
    
    @IBOutlet var BikeLoopButton: UIButton!
    
    @IBOutlet var GooseLoopButton: UIButton!
    
    @IBOutlet var RowLoopButton: UIButton!
    
    @IBOutlet var DogLoopButton: UIButton!
    
    
    var bikeLoop = false
    
    @IBAction func BikeLoop(_ sender: UIButton) {
        if bikeLoop == false{
            audioSampler.LoopSample(number: 6, loop: true)
            BikeLoopButton.setTitle("Looping", for: .normal)
            bikeLoop = !bikeLoop
        }
        
        else if bikeLoop == true{
            audioSampler.LoopSample(number: 6, loop: false)
            BikeLoopButton.setTitle("Loop", for: .normal)
            bikeLoop = !bikeLoop
        }
    }
    
    var gooseLoop = false
    
    @IBAction func GooseLoop(_ sender: UIButton) {
        if gooseLoop == false{
                   audioSampler.LoopSample(number: 8, loop: true)
                   GooseLoopButton.setTitle("Looping", for: .normal)
                   gooseLoop = !gooseLoop
               }
               
               else if gooseLoop == true{
                   audioSampler.LoopSample(number: 8, loop: false)
                   GooseLoopButton.setTitle("Loop", for: .normal)
                   gooseLoop = !gooseLoop
        }}
    
    var rowLoop = false
    
    @IBAction func RowLoop(_ sender: UIButton) {
        if rowLoop == false{
                   audioSampler.LoopSample(number: 9, loop: true)
                   RowLoopButton.setTitle("Looping", for: .normal)
                   rowLoop = !rowLoop
               }
               
               else if rowLoop == true{
                   audioSampler.LoopSample(number: 9, loop: false)
                   RowLoopButton.setTitle("Loop", for: .normal)
                   rowLoop = !rowLoop
        }}
    
    var dogLoop = false
    
    @IBAction func DogLoop(_ sender: UIButton) {
        if dogLoop == false{
            audioSampler.LoopSample(number: 9, loop: true)
            DogLoopButton.setTitle("Looping", for: .normal)
            dogLoop = !dogLoop
        }
        
        else if dogLoop == true{
            audioSampler.LoopSample(number: 9, loop: false)
            DogLoopButton.setTitle("Loop", for: .normal)
            dogLoop = !dogLoop}
    
    }
    
    // button to start the rain animation and sound
    
     var rainHidden = true
    
    @IBAction func RiverRain(_ sender: UIButton) {
        
        if rainHidden == true {
            emitterNode.isHidden = false
            audioSampler.PlaySample(number: 7)
        }
        if rainHidden == false{
            emitterNode.isHidden = true
            audioSampler.StopSample(number: 7)
        }
        rainHidden = !rainHidden
    }
    
    // function to set the sprite kit rain

    private func addRain() {
           let skView = SKView(frame: view.frame)
           skView.backgroundColor = .clear
           let scene = SKScene(size: view.frame.size)
           scene.backgroundColor = .clear
           skView.presentScene(scene)
           skView.isUserInteractionEnabled = false
           scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
           scene.addChild(emitterNode)
           emitterNode.position.y = scene.frame.maxY
           emitterNode.particlePositionRange.dx = scene.frame.width
         view.addSubview(skView)}
        

override func viewDidDisappear(_ animated: Bool) {
    audioSampler.StopSample(number: 6)
    audioSampler.StopSample(number: 7)
    audioSampler.StopSample(number: 8)
    audioSampler.StopSample(number: 9)
    audioSampler.StopSample(number: 10)
    audioSampler.StopSample(number: 11)
}
}
