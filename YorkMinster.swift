//
//  YorkMinster.swift
//  SampleTriggering
//
//  Created by Jamie Fenton on 16/12/2020.
//  Copyright © 2020 Nicholas Arner. All rights reserved.
//

import UIKit
import AudioKit
import GoogleMaps
import SpriteKit

class YorkMinster: UIViewController {
    
    let emitterNode = SKEmitterNode(fileNamed: "Rain.sks")! // set the emitting rain constant
    
    let emitterNodeSnow = SKEmitterNode(fileNamed: "Snow.sks")! // set up a snow emitting constant
    
    @IBOutlet var YorkStreetView: GMSPanoramaView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addRain()
        addSnow()
        emitterNode.isHidden = true
        emitterNodeSnow.isHidden = true
                   
        YorkStreetView.moveNearCoordinate(CLLocationCoordinate2D(latitude: 53.96191, longitude: -1.08271)) // set coordinates for the street view
        

        audioSampler.minsterPlayer.play()
        
        // set inital volumes
        
        audioSampler.minsterPlayer.volume = 0.5
        audioSampler.bellPlayer.volume = 0.5
        audioSampler.carolPlayer.volume = 0.5
        audioSampler.clockPlayer.volume = 0.5
        audioSampler.organPlayer.volume = 0.5
        
    }
    

    @IBOutlet var ClockButton: UIButton!
    
    @IBOutlet var OrganButton: UIButton!
    
    @IBOutlet var CarolButton: UIButton!
    
    @IBOutlet var BellsButton: UIButton!
    
    @IBAction func ClockAudio(_ sender: UIButton) {
        if audioSampler.clockPlayer.isPlaying {
                audioSampler.StopSample(number: 13)
                ClockButton.setTitleColor(.white, for: .normal)}
            else{
            audioSampler.PlaySample(number: 13)
            sender.pulsate()
            ClockButton.setTitleColor(.systemTeal, for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + 27.5) {
                self.ClockButton.setTitleColor(.white, for: .normal)}
        }
    }
    
    @IBAction func OrganAudio(_ sender: UIButton) {
        if audioSampler.organPlayer.isPlaying {
                audioSampler.StopSample(number: 14)
                OrganButton.setTitleColor(.black, for: .normal)}
            else{
            audioSampler.PlaySample(number: 14)
            sender.pulsate()
            OrganButton.setTitleColor(.systemTeal, for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + 92.5) {
                self.OrganButton.setTitleColor(.black, for: .normal)}
        }
    }
    
    var snowHidden = true
    
    @IBAction func CarolAudio(_ sender: UIButton) {
        if audioSampler.carolPlayer.isPlaying {
                audioSampler.StopSample(number: 15)
                CarolButton.setTitleColor(.white, for: .normal)}
            else{
            audioSampler.PlaySample(number: 15)
            sender.pulsate()
            CarolButton.setTitleColor(.systemTeal, for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + 240) {
                self.CarolButton.setTitleColor(.white, for: .normal)}
        }
        if snowHidden == true {
                emitterNodeSnow.isHidden = false
            }
            if snowHidden == false{
                emitterNodeSnow.isHidden = true
            }
            snowHidden = !snowHidden
        }
    
    
    @IBAction func BellsAudio(_ sender: UIButton) {
        if audioSampler.bellPlayer.isPlaying {
                audioSampler.StopSample(number: 16)
                BellsButton.setTitleColor(.white, for: .normal)}
            else{
            audioSampler.PlaySample(number: 16)
            sender.pulsate()
            BellsButton.setTitleColor(.systemTeal, for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + 22.5) {
                self.BellsButton.setTitleColor(.black, for: .normal)}
        }
    }
    
    
    @IBAction func MinsterBackgroundVolume(_ sender: UISlider) {
         audioSampler.SetPlayervolume(forPlayer: 12, tovolume: sender.value)
    }
    
    @IBAction func ClockVolume(_ sender: UISlider) {
         audioSampler.SetPlayervolume(forPlayer: 13, tovolume: sender.value)
    }
    
    @IBAction func OrganVolume(_ sender: UISlider) {
         audioSampler.SetPlayervolume(forPlayer: 14, tovolume: sender.value)
    }
    
    @IBAction func CarolVolume(_ sender: UISlider) {
         audioSampler.SetPlayervolume(forPlayer: 15, tovolume: sender.value)
    }
    
    @IBAction func BellVolume(_ sender: UISlider) {
         audioSampler.SetPlayervolume(forPlayer: 16, tovolume: sender.value)
    }
    
    @IBOutlet var ClockLoopButton: UIButton!
    
    @IBOutlet var OrganLoopButton: UIButton!
    
    @IBOutlet var CarolLoopButton: UIButton!
    
    @IBOutlet var BellLoopButton: UIButton!
    
    var clockLoop = false
    
    @IBAction func ClockLoop(_ sender: UIButton) {
        if clockLoop == false{
        audioSampler.LoopSample(number: 13, loop: true)
        ClockLoopButton.setTitle("Looping", for: .normal)
            clockLoop = !clockLoop}
            
            else if clockLoop == true{
            audioSampler.LoopSample(number: 13, loop: false)
            ClockLoopButton.setTitle("Loop", for: .normal)
            clockLoop = !clockLoop
            }}
    
    var organLoop = false
    
    @IBAction func OrganLoop(_ sender: UIButton) {
        if organLoop == false{
        audioSampler.LoopSample(number: 14, loop: true)
        OrganLoopButton.setTitle("Looping", for: .normal)
            organLoop = !organLoop}
        
        else if organLoop == true{
        audioSampler.LoopSample(number: 14, loop: false)
        OrganLoopButton.setTitle("Loop", for: .normal)
        organLoop = !organLoop
        }}
    
    var carolLoop = false
    
    @IBAction func CarolLoop(_ sender: UIButton) {
        if carolLoop == false{
        audioSampler.LoopSample(number: 15, loop: true)
        CarolLoopButton.setTitle("Looping", for: .normal)
            carolLoop = !carolLoop}
        else if carolLoop == true{
        audioSampler.LoopSample(number: 15, loop: false)
        CarolLoopButton.setTitle("Loop", for: .normal)
        carolLoop = !carolLoop
        }}
    
    var bellLoop = false
    
    @IBAction func BellLoop(_ sender: UIButton) {
        if bellLoop == false{
        audioSampler.LoopSample(number: 16, loop: true)
        BellLoopButton.setTitle("Looping", for: .normal)
            bellLoop = !bellLoop}
        else if bellLoop == true{
        audioSampler.LoopSample(number: 16, loop: false)
        BellLoopButton.setTitle("Loop", for: .normal)
        bellLoop = !bellLoop
        }}
    
    // set up function to set rain audio and visual
    
var rainHidden = true
    
    @IBAction func MinsterRain(_ sender: UIButton) {
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


    // add a snow function to play when the carol is selected

  private func addSnow() {
             let skView = SKView(frame: view.frame)
             skView.backgroundColor = .clear
             let scene = SKScene(size: view.frame.size)
             scene.backgroundColor = .clear
             skView.presentScene(scene)
             skView.isUserInteractionEnabled = false
             scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
             scene.addChild(emitterNodeSnow)
             emitterNodeSnow.position.y = scene.frame.maxY
             emitterNodeSnow.particlePositionRange.dx = scene.frame.width
           view.addSubview(skView)}



override func viewDidDisappear(_ animated: Bool) {
    audioSampler.StopSample(number: 7)
    audioSampler.StopSample(number: 12)
    audioSampler.StopSample(number: 13)
    audioSampler.StopSample(number: 14)
    audioSampler.StopSample(number: 15)
    audioSampler.StopSample(number: 16)
}
}





