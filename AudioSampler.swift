//
//  AudioSampler.swift
//  SampleTriggering
//
//  Created by Nicholas Arner on 5/8/16. Edited Andy Hunt 25/8/17
//  Copyright © 2017 University of York Department of Electronics 
//

import Foundation
import AudioKit

// this is the class where all the audio is set up and handled, it interacts with the view controller classes through open functions which then in turn interacts with the user interface

open class AudioSampler {
    
        // Declare AudioPlayers pointer as class variables
        // so they can be accessed by the functions below
    
        var playerOne: AKAudioPlayer
        var playerTwo: AKAudioPlayer
        var playerThree: AKAudioPlayer
        var playerFour: AKAudioPlayer
        var playerFive: AKAudioPlayer
        var playerSix: AKAudioPlayer
        var rainPlayer: AKAudioPlayer
        var goosePlayer: AKAudioPlayer
        var rowPlayer: AKAudioPlayer
        var dogPlayer: AKAudioPlayer
        var riverPlayer: AKAudioPlayer
        var minsterPlayer: AKAudioPlayer
        var clockPlayer: AKAudioPlayer
        var organPlayer: AKAudioPlayer
        var carolPlayer: AKAudioPlayer
        var bellPlayer: AKAudioPlayer
    
        init () {
            
            // Load the audio samples into audio file readers
            
            let sampleOne = try! AKAudioFile(readFileName: "Background Long.wav", baseDir: .resources)
            let sampleTwo = try! AKAudioFile(readFileName: "Coffe making.wav", baseDir: .resources)
            let sampleThree = try! AKAudioFile(readFileName: "Shambles Pint.wav", baseDir: .resources)
            let sampleFour = try! AKAudioFile(readFileName: "city caller.wav", baseDir: .resources)
            let sampleFive = try! AKAudioFile(readFileName: "Busker.wav", baseDir: .resources)
            let sampleSix = try! AKAudioFile(readFileName: "Bike sound.wav", baseDir: .resources)
            let rainSample = try! AKAudioFile(readFileName: "Rain.wav", baseDir: .resources)
            let gooseSample = try! AKAudioFile(readFileName: "Goose.wav", baseDir: .resources)
            let rowSample = try! AKAudioFile(readFileName: "Rowing boat.wav", baseDir: .resources)
            let dogSample = try! AKAudioFile(readFileName: "Dog Barking.wav", baseDir: .resources)
            let riverSample = try! AKAudioFile(readFileName: "River Background.wav", baseDir: .resources)
            let minsterSample = try! AKAudioFile(readFileName: "Minster Background.wav", baseDir: .resources)
            let clockSample = try! AKAudioFile(readFileName: "clock chime.wav", baseDir: .resources)
            let organSample = try! AKAudioFile(readFileName: "organ.wav", baseDir: .resources)
            let carolSample = try! AKAudioFile(readFileName: "Carol.wav", baseDir: .resources)
            let bellSample = try! AKAudioFile(readFileName: "bells.wav", baseDir: .resources)
            


            // Create audio players for each audio file
            
            playerOne = try! AKAudioPlayer(file: sampleOne)
            playerTwo = try! AKAudioPlayer(file: sampleTwo)
            playerThree = try! AKAudioPlayer(file: sampleThree)
            playerFour = try! AKAudioPlayer(file: sampleFour)
            playerFive = try! AKAudioPlayer(file: sampleFive)
            playerSix = try! AKAudioPlayer(file: sampleSix)
            rainPlayer = try! AKAudioPlayer(file: rainSample)
            goosePlayer = try! AKAudioPlayer(file: gooseSample)
            rowPlayer = try! AKAudioPlayer(file: rowSample)
            dogPlayer = try! AKAudioPlayer(file: dogSample)
            riverPlayer = try! AKAudioPlayer(file: riverSample)
            minsterPlayer = try! AKAudioPlayer(file: minsterSample)
            clockPlayer = try! AKAudioPlayer(file: clockSample)
            organPlayer = try! AKAudioPlayer(file: organSample)
            carolPlayer = try! AKAudioPlayer(file: carolSample)
            bellPlayer = try! AKAudioPlayer(file: bellSample)
            
            
            // set the panning positions of the audio files
            // Shambles
            playerTwo.pan = -0.6
            playerThree.pan = -0.4
            playerFour.pan = 0.6
            playerFive.pan = 0.4
            
            // river
            playerSix.pan = -0.5
            rowPlayer.pan = 0.7
            dogPlayer.pan = -0.2
            
            // Minster
            
            clockPlayer.pan = 0.4
            organPlayer.pan = -0.4
            carolPlayer.pan = 0.2
            bellPlayer.pan = -0.2
            
            // set the background audio to loop
            
            rainPlayer.looping = true
            riverPlayer.looping = true
            playerOne.looping = true
            minsterPlayer.looping = true
           
            // Create a mixer object with the audio players as inputs
            
            let mixer = AKMixer(playerOne, playerTwo, playerThree, playerFour, playerFive, playerSix, rainPlayer, goosePlayer, rowPlayer, dogPlayer, riverPlayer, minsterPlayer, clockPlayer, organPlayer, carolPlayer, bellPlayer)
            
            AudioKit.output = mixer // Let mixer output go to AudioKit o/p
            try!AudioKit.start()
            
            print("AudioKit is being set up in the AudioSampler class")
        }

        // this function enables the buttons on other screens to start playing the audio files
        
        open func PlaySample(number: Int) {
            switch number{
            
            case 1:
                playerOne.play()
            case 2:
                playerTwo.play()
            case 3:
                playerThree.play()
            case 4:
                playerFour.play()
            case 5:
                playerFive.play()
            case 6:
                playerSix.play()
            case 7:
                rainPlayer.play()
            case 8:
                goosePlayer.play()
            case 9:
                rowPlayer.play()
            case 10:
                dogPlayer.play()
            case 11:
                riverPlayer.play()
            case 12:
                minsterPlayer.play()
            case 13:
                clockPlayer.play()
            case 14:
                organPlayer.play()
            case 15:
                carolPlayer.play()
            case 16:
                bellPlayer.play()
                
                default: print("Sorry, that sample does not exist")
        }
    }
    
    // create an open function to be able to stop the audio once it has started
    
     open func StopSample(number: Int) {
            switch number{
            
            case 1:
                playerOne.stop()
            case 2:
                playerTwo.stop()
            case 3:
                playerThree.stop()
            case 4:
                playerFour.stop()
            case 5:
                playerFive.stop()
            case 6:
                playerSix.stop()
            case 7:
                rainPlayer.stop()
            case 8:
                goosePlayer.stop()
            case 9:
                rowPlayer.stop()
            case 10:
                dogPlayer.stop()
            case 11:
                riverPlayer.stop()
            case 12:
                minsterPlayer.stop()
            case 13:
                clockPlayer.stop()
            case 14:
                organPlayer.stop()
            case 15:
                carolPlayer.stop()
            case 16:
                bellPlayer.stop()
                              
                default: print("Sorry, that sample does not exist")
            
        }
    }
    
    // a function which connects to the sliders to change the volume of each payer
    
    open func SetPlayervolume (forPlayer: Int, tovolume: Float){
        switch forPlayer{
        
        case 1: playerOne.volume = Double(tovolume)
            
        case 2: playerTwo.volume = Double(tovolume)
            
        case 3: playerThree.volume = Double(tovolume)
            
        case 4: playerFour.volume = Double(tovolume)
            
        case 5: playerFive.volume = Double(tovolume)
            
        case 6: playerSix.volume = Double(tovolume)
            
        case 8: goosePlayer.volume = Double(tovolume)
            
        case 9: rowPlayer.volume = Double(tovolume)
            
        case 10: dogPlayer.volume = Double(tovolume)
            
        case 11: riverPlayer.volume = Double(tovolume)
            
        case 12: minsterPlayer.volume = Double(tovolume)
            
        case 13: clockPlayer.volume = Double(tovolume)
            
        case 14: organPlayer.volume = Double(tovolume)
            
        case 15: carolPlayer.volume = Double(tovolume)
            
        case 16: bellPlayer.volume = Double(tovolume)
            
        default: print ("This does not exist")
    }
    
    }
    
    // a function which connects to the loop button to make the players loop
    
    open func LoopSample(number: Int, loop: Bool) {
        
        switch number{
        
        case 2:
            playerTwo.looping = loop
            
        case 3:
            playerThree.looping = loop
            
        case 4:
            playerFour.looping = loop
            
        case 5:
            playerFive.looping = loop
            
        case 6:
            playerSix.looping = loop
            
        case 8:
            goosePlayer.looping = loop
            
        case 9:
            rowPlayer.looping = loop
            
        case 10:
            dogPlayer.looping = loop
            
        case 13:
            clockPlayer.looping = loop
            
        case 14:
            organPlayer.looping = loop
            
        case 15:
            carolPlayer.looping = loop
            
        case 16:
            bellPlayer.looping = loop
            
        default: print ("This does not exist")
           }
    }
    
}
