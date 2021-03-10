
import UIKit
import MapKit
import SpriteKit

var firstTime = true

var audioSampler: AudioSampler!

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    
    // this function sets the starting location of the map view and is called in the view did load to zoom into the york centre when the map is loaded
 func configureMap() {
    let center = CLLocationCoordinate2D(latitude: 53.960152, longitude: -1.086533)
          let span = MKCoordinateSpan(latitudeDelta: 0.030, longitudeDelta: 0.030)
          let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)}
        
// This function creates the pop up when the annotation is clicked on and creates and a plus button to segue onto the next screen and see more information about the selected area
    
         func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "pin"
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                
                // Create the button that leads to the audio map page
                
                let button = UIButton(type: .contactAdd)
                annotationView?.rightCalloutAccessoryView = button
            }
          
              else {annotationView?.annotation = annotation}
          
                 return annotationView
              }
          
// this function is the action taken when the button is selected and changes screens depending on the AudioSpot screen value
    
            func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
                
                // This makes the button move to the next screen when it is selected to the selected screen string set up in the audiospot class
                
                guard let AudioSpot = view.annotation as? AudioSpot else {return}
                               
                               let screen = AudioSpot.screen
                
                // each segue has its own identifier set up in their inital annotations
                
                performSegue(withIdentifier: "\(screen)", sender: nil)}

    

    override func viewDidLoad() {
        super.viewDidLoad()
        //load map starting position from function configure map
        
        self.configureMap()
        
        // create the annotations from the Audio spot class and then add these to the map view
        
        let shambles = AudioSpot(title: "The Shambles", coordinate: CLLocationCoordinate2D(latitude: 53.959156, longitude: -1.080018), info: "The oldest street in the UK", screen: "shambles")
        let riverWalk = AudioSpot(title: "River Walk", coordinate: CLLocationCoordinate2D(latitude: 53.964382, longitude: -1.099158), info: "The river running through York", screen: "riverWalk")
        let yorkMinster = AudioSpot(title: "York Minster", coordinate: CLLocationCoordinate2D(latitude: 53.96218, longitude: -1.08206), info: "Famous tourist spot in York", screen: "yorkMinster")
       
        // add the annotations to the mapView
        
        mapView.addAnnotation(shambles)
        mapView.addAnnotation(riverWalk)
        mapView.addAnnotation(yorkMinster)
        
        if firstTime == true{
                   
               print("AudioKit is being set up in shambles view did load") // this makes sure that audiokit does not load multiple times everytime the screen is loaded
                   
               audioSampler = AudioSampler()  // Create instance of AudioSampler class
                // start by playing background audio when the code is open
                   
                   firstTime = !firstTime
               }
        // This sets up a segue to display the inital instructions when the Audio Map is loaded
        
   performSegue(withIdentifier: "startUp", sender: nil)
        
    }
    
    
}
  
