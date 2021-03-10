//
//  AudioSpots.swift
//  SampleTriggering
//
//  Created by Jamie Fenton on 24/10/2020.
//  Copyright © 2020 Nicholas Arner. All rights reserved.
//

import UIKit
import MapKit

// this creates the class to create the locations on the audio map 

class AudioSpot: NSObject, MKAnnotation{
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var screen: String
    

    init(title: String, coordinate: CLLocationCoordinate2D, info: String, screen: String){
    self.title = title
    self.coordinate = coordinate
    self.info = info
    self.screen = screen
        
    }
    
}
