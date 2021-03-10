//
//  Shambles.swift
//  SampleTriggering
//
//  Created by Jamie Fenton on 23/10/2020.
//  Copyright © 2020 Nicholas Arner. All rights reserved.
//

import UIKit
import AudioKit
import GoogleMaps
import SpriteKit

class Shambles: UIViewController {
    
    let emitterNode = SKEmitterNode(fileNamed: "Rain.sks")! // set the emitting rain constant
    
    @IBOutlet var panoramaView: GMSPanoramaView! // set the google maps view
    
       override func viewDidLoad() {
           super.viewDidLoad()
        
        addRain()
        emitterNode.isHidden = true // add the spritekit rain function and start off with having it hidden
        
        panoramaView.moveNearCoordinate(CLLocationCoordinate2D(latitude: 53.959420, longitude: -1.080081)) // set coordinates for the street view
        
        audioSampler.playerOne.play()
        
        // sets all the volumes to 0.5 so it is inline with having the slider halfway through
        
                audioSampler.playerOne.volume = 0.5
                audioSampler.playerTwo.volume = 0.5
                audioSampler.playerThree.volume = 0.5
                audioSampler.playerFour.volume = 0.5
                audioSampler.playerFive.volume = 0.5
    }
    
    // below creats a functuion that pas the street view around when opened, although this is slow on my computer so has been commented out, although could be used to allow movement in when the street view is first opened
    
    
    /*override func viewDidAppear(_ animated: Bool) {
        //super.viewDidAppear(animated)
        
       // DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
           // self.panoramaView.animate(to: GMSPanoramaCamera(heading: 180, pitch: 0, zoom: 0), animationDuration: 15)*/
    
    
    // set button outlets to change colour when pressed
    
    @IBOutlet var CoffeeButton: UIButton!
    
    @IBOutlet var TownCrierButton: UIButton!
    
    @IBOutlet var PintButton: UIButton!
    
    @IBOutlet var BuskerButton: UIButton!
    
    // buttons to stop and start audio which are connected to the functions set up in the AudioSampler class
    
    @IBAction func shamblesPint(_ sender: UIButton) {
        if audioSampler.playerThree.isPlaying == false{
            
            // the sender.pulsate() function links to the ButtonANimation class and makes the button move when pressed
            
        sender.pulsate()
        audioSampler.PlaySample(number: 3)
            
            // This changes the colour of the button when it is playing so it is easy to see which sounds are playing
            
        PintButton.setTitleColor(.systemTeal, for: .normal)
            
            // this makes the button turn back white if it is not stopped manually
            
        DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
        self.PintButton.setTitleColor(.white, for: .normal)
        }
    }
        else if audioSampler.playerThree.isPlaying == true {
            audioSampler.StopSample(number: 3)
            PintButton.setTitleColor(.white, for: .normal)

        }
    }

    @IBAction func shamblesCoffee(_ sender: UIButton) {
        
        if audioSampler.playerTwo.isPlaying == false{
        sender.pulsate()
        audioSampler.PlaySample(number: 2)
        CoffeeButton.setTitleColor(.systemTeal, for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + 18.5) {
            self.CoffeeButton.setTitleColor(.white, for: .normal)
            }
        
    }
        else if audioSampler.playerTwo.isPlaying == true{
            audioSampler.StopSample(number: 2)
            CoffeeButton.setTitleColor(.white, for: .normal)
        }
    }
    
    @IBAction func shamblesTownCrier(_ sender: UIButton) {
        
        if audioSampler.playerFour.isPlaying == false{
            sender.pulsate()
              audioSampler.PlaySample(number: 4)
              TownCrierButton.setTitleColor(.systemTeal, for: .normal)
              DispatchQueue.main.asyncAfter(deadline: .now() + 21) {
              self.TownCrierButton.setTitleColor(.black, for: .normal)
            }
          }
              else if audioSampler.playerFour.isPlaying == true{
                  audioSampler.StopSample(number: 4)
                TownCrierButton.setTitleColor(.black, for: .normal)
              }
    }
    
    @IBAction func shamblesBusker(_ sender: UIButton) {
        
               if audioSampler.playerFive.isPlaying == false{
                sender.pulsate()
                     audioSampler.PlaySample(number: 5)
                BuskerButton.setTitleColor(.systemTeal, for: .normal)
                DispatchQueue.main.asyncAfter(deadline: .now() + 45) {
                self.BuskerButton.setTitleColor(.black, for: .normal)
                }
                 }
                     else if audioSampler.playerFive.isPlaying == true{
                         audioSampler.StopSample(number: 5)
                BuskerButton.setTitleColor(.black, for: .normal)
    }
    }
    
    
    // volume sliders set up with a function in the Aduio sampler class
    
    @IBAction func backgroundVolume(_ sender: UISlider) {
        audioSampler.SetPlayervolume(forPlayer: 1, tovolume: sender.value)
    }
    @IBAction func shamblesVolume(_ sender: UISlider) {
        audioSampler.SetPlayervolume(forPlayer: 3, tovolume: sender.value)
    }
    
    @IBAction func shamblesCoffeeVolume(_ sender: UISlider) {
        audioSampler.SetPlayervolume(forPlayer: 2, tovolume: sender.value)
    }
    
    @IBAction func shamblesTownCrierVolume(_ sender: UISlider) {
        audioSampler.SetPlayervolume(forPlayer: 4, tovolume: sender.value)
    }
    
    @IBAction func shamblesBuskerVolume(_ sender: UISlider) {
        audioSampler.SetPlayervolume(forPlayer: 5, tovolume: sender.value)
    }
    
    
    // oulets set up for the looping buttons to allow the text and colour to be changed when pressed
    
    @IBOutlet var ShamblesLoopButton: UIButton!
    
    @IBOutlet var CoffeeLoopButton: UIButton!
    
    @IBOutlet var TownCrierLoopButton: UIButton!
    
    @IBOutlet var BuskerLoopButton: UIButton!
    
    // set up looping buttons with an itinal looping vriable and ake the buttons change text and colour when pressed
    
    var shamblesLooping = false
    
    @IBAction func ShamblesLoop(_ sender: UIButton) {
        if shamblesLooping == false{
            audioSampler.LoopSample(number: 3, loop: true)
            ShamblesLoopButton.setTitle("Looping", for: .normal)
            
            // This reverses the shamblesLooping var after it has been pressed
            
            shamblesLooping = !shamblesLooping
        }
        
        else if shamblesLooping == true{
            audioSampler.LoopSample(number: 3, loop: false)
            ShamblesLoopButton.setTitle("Loop", for: .normal)
            shamblesLooping = !shamblesLooping
        }
    }

    
    var coffeeLooping = false
    
    @IBAction func CoffeeLoop(_ sender: UIButton) {
        if coffeeLooping == false{
            audioSampler.LoopSample(number: 2, loop: true)
            CoffeeLoopButton.setTitle("Looping", for: .normal)
            coffeeLooping = !coffeeLooping
        }
        else if coffeeLooping == true{
            audioSampler.LoopSample(number: 2, loop: false)
            CoffeeLoopButton.setTitle("Loop", for: .normal)
            coffeeLooping = !coffeeLooping
        }
    }
        
    var townCrierLooping = false
    
    @IBAction func TownCrierLoop(_ sender: UIButton) {
        if townCrierLooping == false{
                   audioSampler.LoopSample(number: 4, loop: true)
                   TownCrierLoopButton.setTitle("Looping", for: .normal)
                   townCrierLooping = !townCrierLooping
               }
               else if townCrierLooping == true{
                   audioSampler.LoopSample(number: 4, loop: false)
                   TownCrierLoopButton.setTitle("Loop", for: .normal)
                   townCrierLooping = !townCrierLooping
               }
    }
    
    var buskerLooping = false
    
    @IBAction func BuskerLoop(_ sender: UIButton) {
        if buskerLooping == false{
            audioSampler.LoopSample(number: 5, loop: true)
            BuskerLoopButton.setTitle("Looping", for: .normal)
            buskerLooping = !buskerLooping
        }
        else if buskerLooping == true{
            audioSampler.LoopSample(number: 5, loop: false)
            BuskerLoopButton.setTitle("Loop", for: .normal)
            buskerLooping = !buskerLooping
        }
    }
    
    
    // create the function to create sprite kit rain falling animation using the prebuilt rain setting in spritekit
    
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
    
    // This allows the rain to be hidden and shown when the rain button is pressed as well as playing the audio similar to the loop function it creates a true or false rainHidden var and reveres it when the button is pressed
    
    var rainHidden = true
    
    @IBAction func rainButton(_ sender: UIButton) {
        if rainHidden == true {
            emitterNode.isHidden = false
        }
        else if rainHidden == false
        {
            emitterNode.isHidden = true
        }
        rainHidden = !rainHidden
        
        if audioSampler.rainPlayer.isPlaying == true {
            audioSampler.StopSample(number: 7)
        }
        else if audioSampler.rainPlayer.isPlaying == false{
            audioSampler.PlaySample(number: 7)
        }
    }
    
    
// this stops the audio from playing after the user has selected to leave the current page
    
    override func viewDidDisappear(_ animated: Bool) {
        audioSampler.StopSample(number: 1)
        audioSampler.StopSample(number: 2)
        audioSampler.StopSample(number: 3)
        audioSampler.StopSample(number: 4)
        audioSampler.StopSample(number: 5)
        audioSampler.StopSample(number: 7)
    }
    

    
    }
    



