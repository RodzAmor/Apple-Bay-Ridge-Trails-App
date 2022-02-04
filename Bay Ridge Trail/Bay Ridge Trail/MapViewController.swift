//
//  MapViewController.swift
//  Bay Ridge Trail
//
//  Created by Rodz Amor on 1/3/21.
//

import MapKit
import UIKit
import CoreLocation
//import MKPolyline

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {

    @IBOutlet weak var mapView: MKMapView!
    let manager = CLLocationManager()
    @IBOutlet weak var center: UIButton!
    @IBOutlet weak var trail: UIButton!
    var buttonPressed = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        center.layer.cornerRadius = center.frame.height / 2.5
        trail.layer.cornerRadius = trail.frame.height / 2.5
        
        switch buttonPressed {
            case 0:
                self.title = "All Trails"
            case 1:
                self.title = "Pond View Trail"
            case 2:
                self.title = "Walnut Drive Trail"
            case 3:
                self.title = "Farmhouse Trail"
            case 4:
                self.title = "Inspiration Point Trail"
            case 5:
                self.title = "Fisherman Trail"
            case 6:
                self.title = "Hull-to-Wainwright Cut-through Trail"
            case 7:
                self.title = "Steam Engine Trail"
            case 8:
                self.title = "Farmhouse to Deer Exclosure Trail"
            default: break
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        manager.desiredAccuracy = kCLLocationAccuracyBest //Battery intensive
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        mapView.delegate = self
        drawLine()
        switch buttonPressed {
        case 0:
            addAnnotations()
        default: break
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            if location.horizontalAccuracy > 0 {
                manager.stopUpdatingLocation()
                
                render(location)
            }
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location update failed, \(error)")
    }
    
    func render(_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
        drawLine()
        
    }
    
    func drawLine() {
        
        let WalnutDriveTrailLocations = [
            CLLocationCoordinate2D(latitude: 38.937378, longitude: -76.469925),
            CLLocationCoordinate2D(latitude: 38.937363, longitude: -76.469887),
            CLLocationCoordinate2D(latitude: 38.937336, longitude: -76.469803),
            CLLocationCoordinate2D(latitude: 38.937305, longitude: -76.469765),
            CLLocationCoordinate2D(latitude: 38.937317, longitude: -76.469719), // Point 5
            CLLocationCoordinate2D(latitude: 38.937317, longitude: -76.469688),
            CLLocationCoordinate2D(latitude: 38.937325, longitude: -76.469643),
            CLLocationCoordinate2D(latitude: 38.937328, longitude: -76.469566),
            CLLocationCoordinate2D(latitude: 38.937302, longitude: -76.469513),
            CLLocationCoordinate2D(latitude: 38.937290, longitude: -76.469460), // Point 10
            CLLocationCoordinate2D(latitude: 38.937283, longitude: -76.469398),
            CLLocationCoordinate2D(latitude: 38.937275, longitude: -76.469330),
            CLLocationCoordinate2D(latitude: 38.937256, longitude: -76.469238),
            CLLocationCoordinate2D(latitude: 38.937263, longitude: -76.469185),
            CLLocationCoordinate2D(latitude: 38.937252, longitude: -76.469131), // Point 15
            CLLocationCoordinate2D(latitude: 38.937229, longitude: -76.469048),
            CLLocationCoordinate2D(latitude: 38.937199, longitude: -76.469048),
            CLLocationCoordinate2D(latitude: 38.937199, longitude: -76.469009),
            CLLocationCoordinate2D(latitude: 38.937168, longitude: -76.468956),
            CLLocationCoordinate2D(latitude: 38.937168, longitude: -76.468887), // Point 20
            CLLocationCoordinate2D(latitude: 38.937145, longitude: -76.468781),
            CLLocationCoordinate2D(latitude: 38.937115, longitude: -76.468697),
            CLLocationCoordinate2D(latitude: 38.937080, longitude: -76.468620),
            CLLocationCoordinate2D(latitude: 38.937065, longitude: -76.468506),
            CLLocationCoordinate2D(latitude: 38.937038, longitude: -76.468468), // Point 25
            CLLocationCoordinate2D(latitude: 38.936958, longitude: -76.468414),
            //CLLocationCoordinate2D(latitude: 38.936958, longitude: -76.468330),
            CLLocationCoordinate2D(latitude: 38.936958, longitude: -76.468307),
            CLLocationCoordinate2D(latitude: 38.936943, longitude: -76.468224),
            CLLocationCoordinate2D(latitude: 38.936935, longitude: -76.468155), // Point 30
            CLLocationCoordinate2D(latitude: 38.936924, longitude: -76.468147),
            CLLocationCoordinate2D(latitude: 38.936916, longitude: -76.468056),
            CLLocationCoordinate2D(latitude: 38.936901, longitude: -76.468033),
            CLLocationCoordinate2D(latitude: 38.936890, longitude: -76.467941),
            CLLocationCoordinate2D(latitude: 38.936901, longitude: -76.467873), // Point 35
            CLLocationCoordinate2D(latitude: 38.936897, longitude: -76.467789),
            CLLocationCoordinate2D(latitude: 38.936901, longitude: -76.467735),
            CLLocationCoordinate2D(latitude: 38.936863, longitude: -76.467667),
            CLLocationCoordinate2D(latitude: 38.936855, longitude: -76.467636),
            CLLocationCoordinate2D(latitude: 38.936852, longitude: -76.467552), // Point 40
            CLLocationCoordinate2D(latitude: 38.936840, longitude: -76.467484),
            CLLocationCoordinate2D(latitude: 38.936844, longitude: -76.467415),
            CLLocationCoordinate2D(latitude: 38.936840, longitude: -76.467285),
            CLLocationCoordinate2D(latitude: 38.936825, longitude: -76.467216),
            CLLocationCoordinate2D(latitude: 38.936825, longitude: -76.467140), // Point 45
            CLLocationCoordinate2D(latitude: 38.936802, longitude: -76.467094),
            CLLocationCoordinate2D(latitude: 38.936790, longitude: -76.467010),
            CLLocationCoordinate2D(latitude: 38.936749, longitude: -76.466904),
            CLLocationCoordinate2D(latitude: 38.936733, longitude: -76.466812),
            CLLocationCoordinate2D(latitude: 38.936726, longitude: -76.466705), // Point 50
            CLLocationCoordinate2D(latitude: 38.936695, longitude: -76.466560),
            CLLocationCoordinate2D(latitude: 38.936653, longitude: -76.466415),
            CLLocationCoordinate2D(latitude: 38.936657, longitude: -76.466331),
            CLLocationCoordinate2D(latitude: 38.936607, longitude: -76.466301),
            CLLocationCoordinate2D(latitude: 38.936543, longitude: -76.466133), // Point 55
            CLLocationCoordinate2D(latitude: 38.936459, longitude: -76.466095),
            CLLocationCoordinate2D(latitude: 38.936466, longitude: -76.466080),
            CLLocationCoordinate2D(latitude: 38.936493, longitude: -76.465919),
            CLLocationCoordinate2D(latitude: 38.936470, longitude: -76.465843),
            CLLocationCoordinate2D(latitude: 38.936451, longitude: -76.465782), // Point 60
            CLLocationCoordinate2D(latitude: 38.936409, longitude: -76.465607),
            CLLocationCoordinate2D(latitude: 38.936420, longitude: -76.465599),
            CLLocationCoordinate2D(latitude: 38.936420, longitude: -76.465523),
            CLLocationCoordinate2D(latitude: 38.936424, longitude: -76.465446),
            CLLocationCoordinate2D(latitude: 38.936462, longitude: -76.465317), // Point 65
            CLLocationCoordinate2D(latitude: 38.936478, longitude: -76.465256),
            //CLLocationCoordinate2D(latitude: 38.936478, longitude: -76.465256),
            CLLocationCoordinate2D(latitude: 38.936485, longitude: -76.465256),
            CLLocationCoordinate2D(latitude: 38.936497, longitude: -76.465248),
            //CLLocationCoordinate2D(latitude: 38.936504, longitude: -76.465248), // Point 70
            CLLocationCoordinate2D(latitude: 38.936508, longitude: -76.465248),
            CLLocationCoordinate2D(latitude: 38.936512, longitude: -76.465248),
            CLLocationCoordinate2D(latitude: 38.936516, longitude: -76.465248),
            CLLocationCoordinate2D(latitude: 38.936516, longitude: -76.465240),
            CLLocationCoordinate2D(latitude: 38.936520, longitude: -76.465240), // Point 75
            //CLLocationCoordinate2D(latitude: 38.936520, longitude: -76.465240),
            CLLocationCoordinate2D(latitude: 38.936527, longitude: -76.465233),
            CLLocationCoordinate2D(latitude: 38.936535, longitude: -76.465233)
        ]
        
        let PondViewTrailLocations = [ // 32 to 40
            CLLocationCoordinate2D(latitude: 38.936401, longitude: -76.464851),
            CLLocationCoordinate2D(latitude: 38.936420, longitude: -76.464874),
            CLLocationCoordinate2D(latitude: 38.936451, longitude: -76.464821),
            CLLocationCoordinate2D(latitude: 38.936481, longitude: -76.464752),
            CLLocationCoordinate2D(latitude: 38.936489, longitude: -76.464684), // Point 5
            CLLocationCoordinate2D(latitude: 38.936489, longitude: -76.464668),
            CLLocationCoordinate2D(latitude: 38.936501, longitude: -76.464684),
            //CLLocationCoordinate2D(latitude: 38.936523, longitude: -76.464684),
            CLLocationCoordinate2D(latitude: 38.936535, longitude: -76.464684),
            CLLocationCoordinate2D(latitude: 38.936539, longitude: -76.464676), // Point 10
            CLLocationCoordinate2D(latitude: 38.936546, longitude: -76.464653),
            CLLocationCoordinate2D(latitude: 38.936550, longitude: -76.464645),
            CLLocationCoordinate2D(latitude: 38.936565, longitude: -76.464577),
            CLLocationCoordinate2D(latitude: 38.936569, longitude: -76.464539),
            CLLocationCoordinate2D(latitude: 38.936565, longitude: -76.464539), // Point 15
            CLLocationCoordinate2D(latitude: 38.936543, longitude: -76.464546),
            CLLocationCoordinate2D(latitude: 38.936539, longitude: -76.464539),
            //CLLocationCoordinate2D(latitude: 38.936539, longitude: -76.464539),
            CLLocationCoordinate2D(latitude: 38.936543, longitude: -76.464539),
            CLLocationCoordinate2D(latitude: 38.936535, longitude: -76.464531), // Point 20
            CLLocationCoordinate2D(latitude: 38.936394, longitude: -76.464455),
            CLLocationCoordinate2D(latitude: 38.936394, longitude: -76.464447),
            CLLocationCoordinate2D(latitude: 38.936398, longitude: -76.464447),
            CLLocationCoordinate2D(latitude: 38.936394, longitude: -76.464432),
            CLLocationCoordinate2D(latitude: 38.936401, longitude: -76.464409), // Point 25
            CLLocationCoordinate2D(latitude: 38.936398, longitude: -76.464340),
            //CLLocationCoordinate2D(latitude: 38.936398, longitude: -76.464340),
            CLLocationCoordinate2D(latitude: 38.936398, longitude: -76.464340),
            CLLocationCoordinate2D(latitude: 38.936413, longitude: -76.464287),
            CLLocationCoordinate2D(latitude: 38.936413, longitude: -76.464233), // Point 30
            CLLocationCoordinate2D(latitude: 38.936409, longitude: -76.464211),
            CLLocationCoordinate2D(latitude: 38.936405, longitude: -76.464218),
            CLLocationCoordinate2D(latitude: 38.936405, longitude: -76.464218),
            CLLocationCoordinate2D(latitude: 38.936409, longitude: -76.464211),
            CLLocationCoordinate2D(latitude: 38.936440, longitude: -76.464233), // Point 35
            CLLocationCoordinate2D(latitude: 38.936443, longitude: -76.464241),
            CLLocationCoordinate2D(latitude: 38.936462, longitude: -76.464241),
            CLLocationCoordinate2D(latitude: 38.936459, longitude: -76.464241),
            //CLLocationCoordinate2D(latitude: 38.936459, longitude: -76.464241),
            CLLocationCoordinate2D(latitude: 38.936459, longitude: -76.464233), // Point 40
            CLLocationCoordinate2D(latitude: 38.936470, longitude: -76.464218),
            CLLocationCoordinate2D(latitude: 38.936501, longitude: -76.464149),
            CLLocationCoordinate2D(latitude: 38.936516, longitude: -76.464134),
            CLLocationCoordinate2D(latitude: 38.936520, longitude: -76.464119),
            CLLocationCoordinate2D(latitude: 38.936520, longitude: -76.464104), // Point 45
            CLLocationCoordinate2D(latitude: 38.936535, longitude: -76.464066),
            //CLLocationCoordinate2D(latitude: 38.936535, longitude: -76.464066),
            //CLLocationCoordinate2D(latitude: 38.936535, longitude: -76.464066),
            //CLLocationCoordinate2D(latitude: 38.936535, longitude: -76.464058),
            CLLocationCoordinate2D(latitude: 38.936535, longitude: -76.464058), // Point 50
            CLLocationCoordinate2D(latitude: 38.936539, longitude: -76.464050),
            CLLocationCoordinate2D(latitude: 38.936535, longitude: -76.464050),
            CLLocationCoordinate2D(latitude: 38.936539, longitude: -76.464043),
            //CLLocationCoordinate2D(latitude: 38.936539, longitude: -76.464043),
            //CLLocationCoordinate2D(latitude: 38.936539, longitude: -76.464035), // Point 55
            //CLLocationCoordinate2D(latitude: 38.936539, longitude: -76.464035),
            CLLocationCoordinate2D(latitude: 38.936539, longitude: -76.464027),
            CLLocationCoordinate2D(latitude: 38.936543, longitude: -76.464020),
            CLLocationCoordinate2D(latitude: 38.936558, longitude: -76.463982),
            CLLocationCoordinate2D(latitude: 38.936562, longitude: -76.463974), // Point 60
            CLLocationCoordinate2D(latitude: 38.936565, longitude: -76.463959),
            CLLocationCoordinate2D(latitude: 38.936569, longitude: -76.463951),
            CLLocationCoordinate2D(latitude: 38.936569, longitude: -76.463936),
            //CLLocationCoordinate2D(latitude: 38.936569, longitude: -76.463936),
            CLLocationCoordinate2D(latitude: 38.936581, longitude: -76.463928), // Point 65
            CLLocationCoordinate2D(latitude: 38.936569, longitude: -76.463936),
            CLLocationCoordinate2D(latitude: 38.936573, longitude: -76.463936),
            //CLLocationCoordinate2D(latitude: 38.936573, longitude: -76.463936),
            CLLocationCoordinate2D(latitude: 38.936577, longitude: -76.463928),
            CLLocationCoordinate2D(latitude: 38.936581, longitude: -76.463921), // Point 70
            CLLocationCoordinate2D(latitude: 38.936584, longitude: -76.463921),
            CLLocationCoordinate2D(latitude: 38.936588, longitude: -76.463898),
            CLLocationCoordinate2D(latitude: 38.936588, longitude: -76.463890),
            //CLLocationCoordinate2D(latitude: 38.936588, longitude: -76.463890),
            CLLocationCoordinate2D(latitude: 38.936600, longitude: -76.463875), // Point 75
            CLLocationCoordinate2D(latitude: 38.936600, longitude: -76.463829),
            //CLLocationCoordinate2D(latitude: 38.936600, longitude: -76.463829),
            CLLocationCoordinate2D(latitude: 38.936604, longitude: -76.463821),
            //CLLocationCoordinate2D(latitude: 38.936604, longitude: -76.463814),
            CLLocationCoordinate2D(latitude: 38.936604, longitude: -76.463814), // Point 80
            CLLocationCoordinate2D(latitude: 38.936600, longitude: -76.463806),
            CLLocationCoordinate2D(latitude: 38.936600, longitude: -76.463791),
            CLLocationCoordinate2D(latitude: 38.936623, longitude: -76.463646),
            //CLLocationCoordinate2D(latitude: 38.936623, longitude: -76.463638),
            CLLocationCoordinate2D(latitude: 38.936623, longitude: -76.463631), // Point 85
            CLLocationCoordinate2D(latitude: 38.936642, longitude: -76.463585),
            CLLocationCoordinate2D(latitude: 38.936630, longitude: -76.463570),
            //CLLocationCoordinate2D(latitude: 38.936634, longitude: -76.463570),
            //CLLocationCoordinate2D(latitude: 38.936638, longitude: -76.463570),
            CLLocationCoordinate2D(latitude: 38.936642, longitude: -76.463570), // Point 90
            CLLocationCoordinate2D(latitude: 38.936649, longitude: -76.463562),
            CLLocationCoordinate2D(latitude: 38.936661, longitude: -76.463554),
            CLLocationCoordinate2D(latitude: 38.936668, longitude: -76.463547),
            CLLocationCoordinate2D(latitude: 38.936684, longitude: -76.463524),
            CLLocationCoordinate2D(latitude: 38.936695, longitude: -76.463493), // Point 95
            CLLocationCoordinate2D(latitude: 38.936699, longitude: -76.463486),
            CLLocationCoordinate2D(latitude: 38.936729, longitude: -76.463440),
            CLLocationCoordinate2D(latitude: 38.936737, longitude: -76.463432),
            CLLocationCoordinate2D(latitude: 38.936752, longitude: -76.463379),
            CLLocationCoordinate2D(latitude: 38.936756, longitude: -76.463387), // Point 100
            
        ]
        
        let InspirationTrailLocations = [
            CLLocationCoordinate2D(latitude: 38.934784, longitude: -76.466255),
            CLLocationCoordinate2D(latitude: 38.934742, longitude: -76.466248),
            CLLocationCoordinate2D(latitude: 38.934742, longitude: -76.466125),
            CLLocationCoordinate2D(latitude: 38.934734, longitude: -76.466095),
            CLLocationCoordinate2D(latitude: 38.934731, longitude: -76.466049), // Point 5
            CLLocationCoordinate2D(latitude: 38.934753, longitude: -76.466026),
            CLLocationCoordinate2D(latitude: 38.934761, longitude: -76.466019),
            CLLocationCoordinate2D(latitude: 38.934765, longitude: -76.465996),
            CLLocationCoordinate2D(latitude: 38.934765, longitude: -76.465973),
            CLLocationCoordinate2D(latitude: 38.934750, longitude: -76.465950), // Point 10
            CLLocationCoordinate2D(latitude: 38.934753, longitude: -76.465958),
            CLLocationCoordinate2D(latitude: 38.934738, longitude: -76.465935),
            CLLocationCoordinate2D(latitude: 38.934734, longitude: -76.465919),
            CLLocationCoordinate2D(latitude: 38.934734, longitude: -76.465912),
            CLLocationCoordinate2D(latitude: 38.934715, longitude: -76.465904), // Point 15
            CLLocationCoordinate2D(latitude: 38.934711, longitude: -76.465912),
            CLLocationCoordinate2D(latitude: 38.934711, longitude: -76.465904),
            CLLocationCoordinate2D(latitude: 38.934689, longitude: -76.465874),
            CLLocationCoordinate2D(latitude: 38.934669, longitude: -76.465866),
            CLLocationCoordinate2D(latitude: 38.934635, longitude: -76.465843), // Point 20
            CLLocationCoordinate2D(latitude: 38.934624, longitude: -76.465813),
            CLLocationCoordinate2D(latitude: 38.934643, longitude: -76.465759),
            CLLocationCoordinate2D(latitude: 38.934650, longitude: -76.465729), // Point 25
            CLLocationCoordinate2D(latitude: 38.934643, longitude: -76.465714),
            CLLocationCoordinate2D(latitude: 38.934643, longitude: -76.465675),
            CLLocationCoordinate2D(latitude: 38.934643, longitude: -76.465668),
            CLLocationCoordinate2D(latitude: 38.934628, longitude: -76.465652),
            CLLocationCoordinate2D(latitude: 38.934620, longitude: -76.465630), // Point 30
            CLLocationCoordinate2D(latitude: 38.934616, longitude: -76.465614),
            CLLocationCoordinate2D(latitude: 38.934612, longitude: -76.465576),
            CLLocationCoordinate2D(latitude: 38.934597, longitude: -76.465569),
            CLLocationCoordinate2D(latitude: 38.934593, longitude: -76.465553),
            CLLocationCoordinate2D(latitude: 38.934589, longitude: -76.465530), // Point 35
            CLLocationCoordinate2D(latitude: 38.934601, longitude: -76.465530),
            CLLocationCoordinate2D(latitude: 38.934601, longitude: -76.465401),
            CLLocationCoordinate2D(latitude: 38.934589, longitude: -76.465385),
            CLLocationCoordinate2D(latitude: 38.934593, longitude: -76.465370),
            CLLocationCoordinate2D(latitude: 38.934589, longitude: -76.465355), // Point 45
            CLLocationCoordinate2D(latitude: 38.934597, longitude: -76.465324),
            CLLocationCoordinate2D(latitude: 38.934605, longitude: -76.465309),
            CLLocationCoordinate2D(latitude: 38.934593, longitude: -76.465294),
            CLLocationCoordinate2D(latitude: 38.934589, longitude: -76.465286),
            CLLocationCoordinate2D(latitude: 38.934593, longitude: -76.465263), // Point 50
            CLLocationCoordinate2D(latitude: 38.934601, longitude: -76.465240),
            CLLocationCoordinate2D(latitude: 38.934608, longitude: -76.465225),
            CLLocationCoordinate2D(latitude: 38.934616, longitude: -76.465210),
            CLLocationCoordinate2D(latitude: 38.934605, longitude: -76.465187),
            CLLocationCoordinate2D(latitude: 38.934601, longitude: -76.465172), // Point 55
            CLLocationCoordinate2D(latitude: 38.934589, longitude: -76.465141),
            CLLocationCoordinate2D(latitude: 38.934586, longitude: -76.465126),
            CLLocationCoordinate2D(latitude: 38.934589, longitude: -76.465103),
            CLLocationCoordinate2D(latitude: 38.934589, longitude: -76.465073),
            CLLocationCoordinate2D(latitude: 38.934578, longitude: -76.465050), // Point 60
            CLLocationCoordinate2D(latitude: 38.934574, longitude: -76.465042),
            CLLocationCoordinate2D(latitude: 38.934551, longitude: -76.464989),
            CLLocationCoordinate2D(latitude: 38.934544, longitude: -76.464966),
            CLLocationCoordinate2D(latitude: 38.934544, longitude: -76.464951),
            CLLocationCoordinate2D(latitude: 38.934536, longitude: -76.464943), // Point 65
            CLLocationCoordinate2D(latitude: 38.934540, longitude: -76.464935),
            CLLocationCoordinate2D(latitude: 38.934528, longitude: -76.464928),
            CLLocationCoordinate2D(latitude: 38.934532, longitude: -76.464920),
            CLLocationCoordinate2D(latitude: 38.934521, longitude: -76.464912),
            CLLocationCoordinate2D(latitude: 38.934517, longitude: -76.464882), // Point 70
            CLLocationCoordinate2D(latitude: 38.934517, longitude: -76.464874),
            CLLocationCoordinate2D(latitude: 38.934513, longitude: -76.464851),
            CLLocationCoordinate2D(latitude: 38.934513, longitude: -76.464836),
            CLLocationCoordinate2D(latitude: 38.934494, longitude: -76.464821),
            CLLocationCoordinate2D(latitude: 38.934494, longitude: -76.464806), // Point 75
            CLLocationCoordinate2D(latitude: 38.934479, longitude: -76.464798),
            CLLocationCoordinate2D(latitude: 38.934464, longitude: -76.464798),
            CLLocationCoordinate2D(latitude: 38.934441, longitude: -76.464775),
            CLLocationCoordinate2D(latitude: 38.934433, longitude: -76.464767),
            CLLocationCoordinate2D(latitude: 38.934422, longitude: -76.464745), // Point 80
            CLLocationCoordinate2D(latitude: 38.934391, longitude: -76.464729),
            CLLocationCoordinate2D(latitude: 38.934387, longitude: -76.464729),
            CLLocationCoordinate2D(latitude: 38.934380, longitude: -76.464729),
            CLLocationCoordinate2D(latitude: 38.934361, longitude: -76.464714),
            CLLocationCoordinate2D(latitude: 38.934349, longitude: -76.464706), // Point 85
            CLLocationCoordinate2D(latitude: 38.934338, longitude: -76.464699),
            CLLocationCoordinate2D(latitude: 38.934322, longitude: -76.464691),
            CLLocationCoordinate2D(latitude: 38.934307, longitude: -76.464691),
            CLLocationCoordinate2D(latitude: 38.934311, longitude: -76.464668),
            CLLocationCoordinate2D(latitude: 38.934315, longitude: -76.464661), // Point 90
            CLLocationCoordinate2D(latitude: 38.934303, longitude: -76.464653),
            CLLocationCoordinate2D(latitude: 38.934307, longitude: -76.464668),
            CLLocationCoordinate2D(latitude: 38.934315, longitude: -76.464661),
            CLLocationCoordinate2D(latitude: 38.934307, longitude: -76.464661),
            CLLocationCoordinate2D(latitude: 38.934292, longitude: -76.464638), // Point 95
            CLLocationCoordinate2D(latitude: 38.934277, longitude: -76.464622),
            CLLocationCoordinate2D(latitude: 38.934269, longitude: -76.464615),
            CLLocationCoordinate2D(latitude: 38.934261, longitude: -76.464592),
            CLLocationCoordinate2D(latitude: 38.934250, longitude: -76.464577),
            CLLocationCoordinate2D(latitude: 38.934216, longitude: -76.464554), // Point 100
            CLLocationCoordinate2D(latitude: 38.934216, longitude: -76.464546),
            CLLocationCoordinate2D(latitude: 38.934204, longitude: -76.464539),
            CLLocationCoordinate2D(latitude: 38.934196, longitude: -76.464531),
            CLLocationCoordinate2D(latitude: 38.934189, longitude: -76.464523),
            CLLocationCoordinate2D(latitude: 38.934193, longitude: -76.464493), // Point 105
            CLLocationCoordinate2D(latitude: 38.934189, longitude: -76.464485),
            CLLocationCoordinate2D(latitude: 38.934181, longitude: -76.464485),
            CLLocationCoordinate2D(latitude: 38.934170, longitude: -76.464478),
            CLLocationCoordinate2D(latitude: 38.934155, longitude: -76.464462),
            CLLocationCoordinate2D(latitude: 38.934155, longitude: -76.464447), // Point 110
            CLLocationCoordinate2D(latitude: 38.934147, longitude: -76.464417),
            CLLocationCoordinate2D(latitude: 38.934143, longitude: -76.464417),
            CLLocationCoordinate2D(latitude: 38.934124, longitude: -76.464386),
            //CLLocationCoordinate2D(latitude: 38.934124, longitude: -76.464386), // Point 115
            CLLocationCoordinate2D(latitude: 38.934116, longitude: -76.464386),
            CLLocationCoordinate2D(latitude: 38.934113, longitude: -76.464371),
            CLLocationCoordinate2D(latitude: 38.934097, longitude: -76.464363),
            CLLocationCoordinate2D(latitude: 38.934082, longitude: -76.464325),
            CLLocationCoordinate2D(latitude: 38.934074, longitude: -76.464333), // Point 120
            CLLocationCoordinate2D(latitude: 38.934059, longitude: -76.464317),
            CLLocationCoordinate2D(latitude: 38.934059, longitude: -76.464302),
            CLLocationCoordinate2D(latitude: 38.934055, longitude: -76.464302),
            CLLocationCoordinate2D(latitude: 38.934040, longitude: -76.464287),
            CLLocationCoordinate2D(latitude: 38.934032, longitude: -76.464279), // Point 125
            CLLocationCoordinate2D(latitude: 38.934013, longitude: -76.464256),
            CLLocationCoordinate2D(latitude: 38.933979, longitude: -76.464241),
            CLLocationCoordinate2D(latitude: 38.933968, longitude: -76.464226),
            CLLocationCoordinate2D(latitude: 38.933922, longitude: -76.464195),
            CLLocationCoordinate2D(latitude: 38.933914, longitude: -76.464188), // Point 130
            CLLocationCoordinate2D(latitude: 38.933895, longitude: -76.464180),
            CLLocationCoordinate2D(latitude: 38.933887, longitude: -76.464157),
            CLLocationCoordinate2D(latitude: 38.933884, longitude: -76.464157),
            CLLocationCoordinate2D(latitude: 38.933876, longitude: -76.464134),
            CLLocationCoordinate2D(latitude: 38.933868, longitude: -76.464127), // Point 135
            CLLocationCoordinate2D(latitude: 38.933876, longitude: -76.464134),
            CLLocationCoordinate2D(latitude: 38.933868, longitude: -76.464111),
            CLLocationCoordinate2D(latitude: 38.933849, longitude: -76.464073),
            CLLocationCoordinate2D(latitude: 38.933842, longitude: -76.464043), // Point 140
            CLLocationCoordinate2D(latitude: 38.933853, longitude: -76.464043),
            CLLocationCoordinate2D(latitude: 38.933853, longitude: -76.464035),
            CLLocationCoordinate2D(latitude: 38.933838, longitude: -76.464035),
            CLLocationCoordinate2D(latitude: 38.933830, longitude: -76.464012),
            CLLocationCoordinate2D(latitude: 38.933819, longitude: -76.463997), // Point 145
            CLLocationCoordinate2D(latitude: 38.933804, longitude: -76.463966),
            CLLocationCoordinate2D(latitude: 38.933796, longitude: -76.463951),
            CLLocationCoordinate2D(latitude: 38.933781, longitude: -76.463936),
            CLLocationCoordinate2D(latitude: 38.933773, longitude: -76.463928), // Point 150
            CLLocationCoordinate2D(latitude: 38.933769, longitude: -76.463921),
            CLLocationCoordinate2D(latitude: 38.933762, longitude: -76.463913),
            CLLocationCoordinate2D(latitude: 38.933754, longitude: -76.463905),
            CLLocationCoordinate2D(latitude: 38.933739, longitude: -76.463898),
            CLLocationCoordinate2D(latitude: 38.933735, longitude: -76.463882), // Point 155
            CLLocationCoordinate2D(latitude: 38.933727, longitude: -76.463875),
            CLLocationCoordinate2D(latitude: 38.933716, longitude: -76.463875),
            CLLocationCoordinate2D(latitude: 38.933708, longitude: -76.463867),
            CLLocationCoordinate2D(latitude: 38.933704, longitude: -76.463875),
            CLLocationCoordinate2D(latitude: 38.933678, longitude: -76.463821), // Point 160
            CLLocationCoordinate2D(latitude: 38.933678, longitude: -76.463806),
            CLLocationCoordinate2D(latitude: 38.933670, longitude: -76.463799),
            CLLocationCoordinate2D(latitude: 38.933647, longitude: -76.463776),
            CLLocationCoordinate2D(latitude: 38.933636, longitude: -76.463760),
            CLLocationCoordinate2D(latitude: 38.933632, longitude: -76.463760), // Point 165
            CLLocationCoordinate2D(latitude: 38.933609, longitude: -76.463760),
            CLLocationCoordinate2D(latitude: 38.933590, longitude: -76.463737),
            CLLocationCoordinate2D(latitude: 38.933571, longitude: -76.463707),
            CLLocationCoordinate2D(latitude: 38.933556, longitude: -76.463699),
            CLLocationCoordinate2D(latitude: 38.933552, longitude: -76.463699), // Point 170
            CLLocationCoordinate2D(latitude: 38.933540, longitude: -76.463692),
            CLLocationCoordinate2D(latitude: 38.933529, longitude: -76.463692),
            CLLocationCoordinate2D(latitude: 38.933517, longitude: -76.463676),
            CLLocationCoordinate2D(latitude: 38.933510, longitude: -76.463669),
            CLLocationCoordinate2D(latitude: 38.933502, longitude: -76.463654), // Point 175
            CLLocationCoordinate2D(latitude: 38.933483, longitude: -76.463646),
            CLLocationCoordinate2D(latitude: 38.933468, longitude: -76.463631),
            CLLocationCoordinate2D(latitude: 38.933464, longitude: -76.463638),
            CLLocationCoordinate2D(latitude: 38.933449, longitude: -76.463608), // Point 180
            CLLocationCoordinate2D(latitude: 38.933441, longitude: -76.463608),
            CLLocationCoordinate2D(latitude: 38.933430, longitude: -76.463593),
            CLLocationCoordinate2D(latitude: 38.933422, longitude: -76.463570),
            CLLocationCoordinate2D(latitude: 38.933414, longitude: -76.463562),
            CLLocationCoordinate2D(latitude: 38.933414, longitude: -76.463570), // Point 185
            CLLocationCoordinate2D(latitude: 38.933407, longitude: -76.463562),
            CLLocationCoordinate2D(latitude: 38.933403, longitude: -76.463554),
            CLLocationCoordinate2D(latitude: 38.933399, longitude: -76.463554),
            //CLLocationCoordinate2D(latitude: 38.933399, longitude: -76.463554), // Point 190
            CLLocationCoordinate2D(latitude: 38.933380, longitude: -76.463547),
            CLLocationCoordinate2D(latitude: 38.933342, longitude: -76.463539),
            CLLocationCoordinate2D(latitude: 38.933323, longitude: -76.463524) // Last Point 194
        ]
        
        let InspirationTrailLocations2 = [ // Combine with Inspiration Trail
            CLLocationCoordinate2D(latitude: 38.934235, longitude: -76.464584),
            CLLocationCoordinate2D(latitude: 38.934319, longitude: -76.464745),
            CLLocationCoordinate2D(latitude: 38.934341, longitude: -76.464714),
            CLLocationCoordinate2D(latitude: 38.934376, longitude: -76.464706),
            CLLocationCoordinate2D(latitude: 38.934376, longitude: -76.464676), // Point 5
            CLLocationCoordinate2D(latitude: 38.934387, longitude: -76.464676),
            CLLocationCoordinate2D(latitude: 38.934372, longitude: -76.464661),
            CLLocationCoordinate2D(latitude: 38.934383, longitude: -76.464630),
            CLLocationCoordinate2D(latitude: 38.934395, longitude: -76.464615),
            CLLocationCoordinate2D(latitude: 38.934425, longitude: -76.464561), // Point 10
            CLLocationCoordinate2D(latitude: 38.934418, longitude: -76.464569),
            CLLocationCoordinate2D(latitude: 38.934418, longitude: -76.464561),
            CLLocationCoordinate2D(latitude: 38.934437, longitude: -76.464577),
            CLLocationCoordinate2D(latitude: 38.934448, longitude: -76.464561),
            CLLocationCoordinate2D(latitude: 38.934456, longitude: -76.464554), // Point 15
            CLLocationCoordinate2D(latitude: 38.934452, longitude: -76.464561),
            CLLocationCoordinate2D(latitude: 38.934444, longitude: -76.464569),
            CLLocationCoordinate2D(latitude: 38.934441, longitude: -76.464584),
            CLLocationCoordinate2D(latitude: 38.934444, longitude: -76.464584),
            //CLLocationCoordinate2D(latitude: 38.934444, longitude: -76.464584), // Point 20
            CLLocationCoordinate2D(latitude: 38.934456, longitude: -76.464577),
            CLLocationCoordinate2D(latitude: 38.934467, longitude: -76.464584),
            CLLocationCoordinate2D(latitude: 38.934479, longitude: -76.464554),
            CLLocationCoordinate2D(latitude: 38.934479, longitude: -76.464554),
            CLLocationCoordinate2D(latitude: 38.934444, longitude: -76.464607), // Point 25
            CLLocationCoordinate2D(latitude: 38.934452, longitude: -76.464607),
            CLLocationCoordinate2D(latitude: 38.934467, longitude: -76.464622),
            CLLocationCoordinate2D(latitude: 38.934475, longitude: -76.464615), // Point 30
            CLLocationCoordinate2D(latitude: 38.934479, longitude: -76.464607),
            CLLocationCoordinate2D(latitude: 38.934490, longitude: -76.464600),
            CLLocationCoordinate2D(latitude: 38.934502, longitude: -76.464600),
            CLLocationCoordinate2D(latitude: 38.934517, longitude: -76.464600),
            CLLocationCoordinate2D(latitude: 38.934540, longitude: -76.464584), // Point 35
            CLLocationCoordinate2D(latitude: 38.934555, longitude: -76.464584),
            CLLocationCoordinate2D(latitude: 38.934566, longitude: -76.464577),
            CLLocationCoordinate2D(latitude: 38.934578, longitude: -76.464577),
            CLLocationCoordinate2D(latitude: 38.934593, longitude: -76.464546),
            CLLocationCoordinate2D(latitude: 38.934608, longitude: -76.464539), // Point 40
            CLLocationCoordinate2D(latitude: 38.934612, longitude: -76.464539),
            CLLocationCoordinate2D(latitude: 38.934624, longitude: -76.464546),
            CLLocationCoordinate2D(latitude: 38.934643, longitude: -76.464546),
            CLLocationCoordinate2D(latitude: 38.934666, longitude: -76.464546),
            CLLocationCoordinate2D(latitude: 38.934696, longitude: -76.464531), // Point 45
            CLLocationCoordinate2D(latitude: 38.934719, longitude: -76.464539),
            CLLocationCoordinate2D(latitude: 38.934742, longitude: -76.464546),
            CLLocationCoordinate2D(latitude: 38.934757, longitude: -76.464531),
            CLLocationCoordinate2D(latitude: 38.934788, longitude: -76.464531),
            CLLocationCoordinate2D(latitude: 38.934792, longitude: -76.464523), // Point 50
            CLLocationCoordinate2D(latitude: 38.934811, longitude: -76.464523),
            CLLocationCoordinate2D(latitude: 38.934818, longitude: -76.464523),
            CLLocationCoordinate2D(latitude: 38.934826, longitude: -76.464508),
            CLLocationCoordinate2D(latitude: 38.934834, longitude: -76.464516), // Point 55
            CLLocationCoordinate2D(latitude: 38.934837, longitude: -76.464508), // Point 60
            CLLocationCoordinate2D(latitude: 38.934849, longitude: -76.464478),
            CLLocationCoordinate2D(latitude: 38.934849, longitude: -76.464447),
            CLLocationCoordinate2D(latitude: 38.934856, longitude: -76.464439),
            CLLocationCoordinate2D(latitude: 38.934879, longitude: -76.464447),
            CLLocationCoordinate2D(latitude: 38.934906, longitude: -76.464417), // Point 65
            CLLocationCoordinate2D(latitude: 38.934940, longitude: -76.464424),
            CLLocationCoordinate2D(latitude: 38.934948, longitude: -76.464417),
            CLLocationCoordinate2D(latitude: 38.934967, longitude: -76.464432),
            CLLocationCoordinate2D(latitude: 38.934971, longitude: -76.464447),
            CLLocationCoordinate2D(latitude: 38.934978, longitude: -76.464462), // Point 70
            CLLocationCoordinate2D(latitude: 38.935001, longitude: -76.464485),
            CLLocationCoordinate2D(latitude: 38.935013, longitude: -76.464500),
            CLLocationCoordinate2D(latitude: 38.935009, longitude: -76.464493),
            CLLocationCoordinate2D(latitude: 38.935013, longitude: -76.464500),
            CLLocationCoordinate2D(latitude: 38.935032, longitude: -76.464508), // Point 75
            CLLocationCoordinate2D(latitude: 38.935062, longitude: -76.464523),
            CLLocationCoordinate2D(latitude: 38.935104, longitude: -76.464546),
            CLLocationCoordinate2D(latitude: 38.935135, longitude: -76.464569),
            CLLocationCoordinate2D(latitude: 38.935146, longitude: -76.464584),
            CLLocationCoordinate2D(latitude: 38.935150, longitude: -76.464607), // Point 80
            CLLocationCoordinate2D(latitude: 38.935165, longitude: -76.464622),
            CLLocationCoordinate2D(latitude: 38.935173, longitude: -76.464615),
            CLLocationCoordinate2D(latitude: 38.935188, longitude: -76.464615),
            CLLocationCoordinate2D(latitude: 38.935219, longitude: -76.464607), // Point 85
            CLLocationCoordinate2D(latitude: 38.935230, longitude: -76.464607),
            CLLocationCoordinate2D(latitude: 38.935265, longitude: -76.464607),
            CLLocationCoordinate2D(latitude: 38.935284, longitude: -76.464600),
            CLLocationCoordinate2D(latitude: 38.935303, longitude: -76.464600),
            CLLocationCoordinate2D(latitude: 38.935310, longitude: -76.464592), // Point 90
            CLLocationCoordinate2D(latitude: 38.935352, longitude: -76.464577),
            CLLocationCoordinate2D(latitude: 38.935371, longitude: -76.464577),
            CLLocationCoordinate2D(latitude: 38.935379, longitude: -76.464569),
            CLLocationCoordinate2D(latitude: 38.935383, longitude: -76.464569),
            CLLocationCoordinate2D(latitude: 38.935390, longitude: -76.464561), // Point 95
            CLLocationCoordinate2D(latitude: 38.935398, longitude: -76.464554),
            CLLocationCoordinate2D(latitude: 38.935410, longitude: -76.464546),
            CLLocationCoordinate2D(latitude: 38.935425, longitude: -76.464539),
            CLLocationCoordinate2D(latitude: 38.935455, longitude: -76.464523), // Point 100
            CLLocationCoordinate2D(latitude: 38.935493, longitude: -76.464516),
            CLLocationCoordinate2D(latitude: 38.935509, longitude: -76.464508),
            CLLocationCoordinate2D(latitude: 38.935524, longitude: -76.464500),
            CLLocationCoordinate2D(latitude: 38.935555, longitude: -76.464523),
            CLLocationCoordinate2D(latitude: 38.935562, longitude: -76.464531), // Point 105
            CLLocationCoordinate2D(latitude: 38.935562, longitude: -76.464531),
            CLLocationCoordinate2D(latitude: 38.935581, longitude: -76.464531),
            CLLocationCoordinate2D(latitude: 38.935604, longitude: -76.464531),
            CLLocationCoordinate2D(latitude: 38.935638, longitude: -76.464523),
            CLLocationCoordinate2D(latitude: 38.935642, longitude: -76.464523), // Point 110
            CLLocationCoordinate2D(latitude: 38.935646, longitude: -76.464523),
            CLLocationCoordinate2D(latitude: 38.935658, longitude: -76.464508),
            CLLocationCoordinate2D(latitude: 38.935669, longitude: -76.464500),
            CLLocationCoordinate2D(latitude: 38.935669, longitude: -76.464493),
            CLLocationCoordinate2D(latitude: 38.935688, longitude: -76.464508), // Point 115
            CLLocationCoordinate2D(latitude: 38.935699, longitude: -76.464500),
            CLLocationCoordinate2D(latitude: 38.935715, longitude: -76.464478),
            CLLocationCoordinate2D(latitude: 38.935730, longitude: -76.464485),
            CLLocationCoordinate2D(latitude: 38.935745, longitude: -76.464493),
            CLLocationCoordinate2D(latitude: 38.935772, longitude: -76.464478), // Point 120
            CLLocationCoordinate2D(latitude: 38.935783, longitude: -76.464478),
            CLLocationCoordinate2D(latitude: 38.935799, longitude: -76.464478),
            CLLocationCoordinate2D(latitude: 38.935802, longitude: -76.464432)
            
        ]
        
        let KassParkToFarmhouseTrailLocations = [
            CLLocationCoordinate2D(latitude: 38.939617, longitude: -76.462967),
            CLLocationCoordinate2D(latitude: 38.939610, longitude: -76.462982),
            CLLocationCoordinate2D(latitude: 38.939613, longitude: -76.462997),
            CLLocationCoordinate2D(latitude: 38.939617, longitude: -76.462997),
            CLLocationCoordinate2D(latitude: 38.939617, longitude: -76.463013), // Point 5
            CLLocationCoordinate2D(latitude: 38.939625, longitude: -76.463043),
            CLLocationCoordinate2D(latitude: 38.939629, longitude: -76.463043),
            CLLocationCoordinate2D(latitude: 38.939636, longitude: -76.463051),
            CLLocationCoordinate2D(latitude: 38.939644, longitude: -76.463058),
            CLLocationCoordinate2D(latitude: 38.939640, longitude: -76.463074), // Point 10
            CLLocationCoordinate2D(latitude: 38.939644, longitude: -76.463097),
            CLLocationCoordinate2D(latitude: 38.939655, longitude: -76.463112),
            CLLocationCoordinate2D(latitude: 38.939663, longitude: -76.463112),
            CLLocationCoordinate2D(latitude: 38.939667, longitude: -76.463127),
            CLLocationCoordinate2D(latitude: 38.939674, longitude: -76.463135), // Point 15
            CLLocationCoordinate2D(latitude: 38.939671, longitude: -76.463135),
            CLLocationCoordinate2D(latitude: 38.939667, longitude: -76.463135),
            CLLocationCoordinate2D(latitude: 38.939671, longitude: -76.463150),
            CLLocationCoordinate2D(latitude: 38.939678, longitude: -76.463165),
            //CLLocationCoordinate2D(latitude: 38.939678, longitude: -76.463165), // Point 20
            CLLocationCoordinate2D(latitude: 38.939682, longitude: -76.463173),
            CLLocationCoordinate2D(latitude: 38.939682, longitude: -76.463181),
            CLLocationCoordinate2D(latitude: 38.939686, longitude: -76.463196),
            CLLocationCoordinate2D(latitude: 38.939716, longitude: -76.463234),
            CLLocationCoordinate2D(latitude: 38.939716, longitude: -76.463249), // Point 25
            CLLocationCoordinate2D(latitude: 38.939716, longitude: -76.463272),
            CLLocationCoordinate2D(latitude: 38.939728, longitude: -76.463287),
            CLLocationCoordinate2D(latitude: 38.939732, longitude: -76.463303),
            CLLocationCoordinate2D(latitude: 38.939720, longitude: -76.463326),
            CLLocationCoordinate2D(latitude: 38.939720, longitude: -76.463341), // Point 30
            CLLocationCoordinate2D(latitude: 38.939693, longitude: -76.463379),
            CLLocationCoordinate2D(latitude: 38.939674, longitude: -76.463402),
            CLLocationCoordinate2D(latitude: 38.939671, longitude: -76.463425),
            CLLocationCoordinate2D(latitude: 38.939667, longitude: -76.463440),
            CLLocationCoordinate2D(latitude: 38.939671, longitude: -76.463463), // Point 35
            CLLocationCoordinate2D(latitude: 38.939686, longitude: -76.463470),
            CLLocationCoordinate2D(latitude: 38.939697, longitude: -76.463486),
            CLLocationCoordinate2D(latitude: 38.939697, longitude: -76.463501),
            CLLocationCoordinate2D(latitude: 38.939709, longitude: -76.463509),
            CLLocationCoordinate2D(latitude: 38.939720, longitude: -76.463531), // Point 40
            CLLocationCoordinate2D(latitude: 38.939728, longitude: -76.463531),
            CLLocationCoordinate2D(latitude: 38.939739, longitude: -76.463539),
            CLLocationCoordinate2D(latitude: 38.939747, longitude: -76.463554),
            CLLocationCoordinate2D(latitude: 38.939751, longitude: -76.463593),
            CLLocationCoordinate2D(latitude: 38.939751, longitude: -76.463585), // Point 45
            CLLocationCoordinate2D(latitude: 38.939751, longitude: -76.463600),
            //CLLocationCoordinate2D(latitude: 38.939751, longitude: -76.463600),
            CLLocationCoordinate2D(latitude: 38.939751, longitude: -76.463615),
            CLLocationCoordinate2D(latitude: 38.939747, longitude: -76.463638),
            CLLocationCoordinate2D(latitude: 38.939743, longitude: -76.463638), // Point 50
            CLLocationCoordinate2D(latitude: 38.939751, longitude: -76.463661),
            CLLocationCoordinate2D(latitude: 38.939754, longitude: -76.463676),
            CLLocationCoordinate2D(latitude: 38.939747, longitude: -76.463715),
            CLLocationCoordinate2D(latitude: 38.939751, longitude: -76.463722),
            CLLocationCoordinate2D(latitude: 38.939747, longitude: -76.463760), // Point 55
            CLLocationCoordinate2D(latitude: 38.939747, longitude: -76.463783),
            CLLocationCoordinate2D(latitude: 38.939751, longitude: -76.463799),
            CLLocationCoordinate2D(latitude: 38.939747, longitude: -76.463829),
            CLLocationCoordinate2D(latitude: 38.939754, longitude: -76.463837),
            CLLocationCoordinate2D(latitude: 38.939754, longitude: -76.463860), // Point 60
            CLLocationCoordinate2D(latitude: 38.939751, longitude: -76.463875),
            CLLocationCoordinate2D(latitude: 38.939747, longitude: -76.463882),
            CLLocationCoordinate2D(latitude: 38.939751, longitude: -76.463898),
            CLLocationCoordinate2D(latitude: 38.939743, longitude: -76.463913),
            CLLocationCoordinate2D(latitude: 38.939747, longitude: -76.463913), // Point 65
            CLLocationCoordinate2D(latitude: 38.939739, longitude: -76.463913),
            CLLocationCoordinate2D(latitude: 38.939747, longitude: -76.463921),
            CLLocationCoordinate2D(latitude: 38.939751, longitude: -76.463936),
            CLLocationCoordinate2D(latitude: 38.939739, longitude: -76.463966),
            CLLocationCoordinate2D(latitude: 38.939732, longitude: -76.463989), // Point 70
            CLLocationCoordinate2D(latitude: 38.939720, longitude: -76.464005),
            CLLocationCoordinate2D(latitude: 38.939716, longitude: -76.464020),
            CLLocationCoordinate2D(latitude: 38.939713, longitude: -76.464027),
            CLLocationCoordinate2D(latitude: 38.939705, longitude: -76.464035),
            CLLocationCoordinate2D(latitude: 38.939713, longitude: -76.464050), // Point 75
            CLLocationCoordinate2D(latitude: 38.939705, longitude: -76.464073),
            //CLLocationCoordinate2D(latitude: 38.939705, longitude: -76.464088),
            CLLocationCoordinate2D(latitude: 38.939705, longitude: -76.464096),
            CLLocationCoordinate2D(latitude: 38.939701, longitude: -76.464104),
            CLLocationCoordinate2D(latitude: 38.939701, longitude: -76.464111), // Point 80
            CLLocationCoordinate2D(latitude: 38.939697, longitude: -76.464127),
            CLLocationCoordinate2D(latitude: 38.939701, longitude: -76.464134),
            CLLocationCoordinate2D(latitude: 38.939697, longitude: -76.464149),
            CLLocationCoordinate2D(latitude: 38.939693, longitude: -76.464165),
            CLLocationCoordinate2D(latitude: 38.939697, longitude: -76.464180), // Point 85
            CLLocationCoordinate2D(latitude: 38.939697, longitude: -76.464211),
            CLLocationCoordinate2D(latitude: 38.939693, longitude: -76.464218),
            CLLocationCoordinate2D(latitude: 38.939693, longitude: -76.464249),
            CLLocationCoordinate2D(latitude: 38.939690, longitude: -76.464241),
            CLLocationCoordinate2D(latitude: 38.939701, longitude: -76.464264), // Point 90
            CLLocationCoordinate2D(latitude: 38.939713, longitude: -76.464264),
            CLLocationCoordinate2D(latitude: 38.939716, longitude: -76.464272),
            CLLocationCoordinate2D(latitude: 38.939713, longitude: -76.464272),
            CLLocationCoordinate2D(latitude: 38.939713, longitude: -76.464287),
            CLLocationCoordinate2D(latitude: 38.939720, longitude: -76.464302), // Point 95
            CLLocationCoordinate2D(latitude: 38.939732, longitude: -76.464340),
            CLLocationCoordinate2D(latitude: 38.939739, longitude: -76.464355),
            CLLocationCoordinate2D(latitude: 38.939754, longitude: -76.464363),
            CLLocationCoordinate2D(latitude: 38.939762, longitude: -76.464386),
            CLLocationCoordinate2D(latitude: 38.939766, longitude: -76.464417), // Point 100
            CLLocationCoordinate2D(latitude: 38.939774, longitude: -76.464432),
            CLLocationCoordinate2D(latitude: 38.939770, longitude: -76.464478),
            CLLocationCoordinate2D(latitude: 38.939781, longitude: -76.464485),
            CLLocationCoordinate2D(latitude: 38.939793, longitude: -76.464500),
            CLLocationCoordinate2D(latitude: 38.939796, longitude: -76.464516), // Point 105
            CLLocationCoordinate2D(latitude: 38.939804, longitude: -76.464539),
            CLLocationCoordinate2D(latitude: 38.939804, longitude: -76.464561),
            CLLocationCoordinate2D(latitude: 38.939796, longitude: -76.464569),
            CLLocationCoordinate2D(latitude: 38.939796, longitude: -76.464577),
            CLLocationCoordinate2D(latitude: 38.939800, longitude: -76.464569), // Point 110
            CLLocationCoordinate2D(latitude: 38.939796, longitude: -76.464584),
            CLLocationCoordinate2D(latitude: 38.939789, longitude: -76.464592),
            CLLocationCoordinate2D(latitude: 38.939781, longitude: -76.464584),
            CLLocationCoordinate2D(latitude: 38.939777, longitude: -76.464592),
            CLLocationCoordinate2D(latitude: 38.939774, longitude: -76.464592), // Point 115
            CLLocationCoordinate2D(latitude: 38.939774, longitude: -76.464600),
            //CLLocationCoordinate2D(latitude: 38.939774, longitude: -76.464600),
            CLLocationCoordinate2D(latitude: 38.939766, longitude: -76.464600),
            CLLocationCoordinate2D(latitude: 38.939766, longitude: -76.464607),
            CLLocationCoordinate2D(latitude: 38.939770, longitude: -76.464615), // Point 120
            CLLocationCoordinate2D(latitude: 38.939758, longitude: -76.464638),
            CLLocationCoordinate2D(latitude: 38.939758, longitude: -76.464668),
            CLLocationCoordinate2D(latitude: 38.939751, longitude: -76.464691),
            CLLocationCoordinate2D(latitude: 38.939732, longitude: -76.464722),
            CLLocationCoordinate2D(latitude: 38.939724, longitude: -76.464737), // Point 125
            CLLocationCoordinate2D(latitude: 38.939720, longitude: -76.464760),
            CLLocationCoordinate2D(latitude: 38.939720, longitude: -76.464767),
            CLLocationCoordinate2D(latitude: 38.939705, longitude: -76.464775),
            CLLocationCoordinate2D(latitude: 38.939701, longitude: -76.464813),
            CLLocationCoordinate2D(latitude: 38.939697, longitude: -76.464828), // Point 130
            CLLocationCoordinate2D(latitude: 38.939697, longitude: -76.464844),
            CLLocationCoordinate2D(latitude: 38.939693, longitude: -76.464867),
            CLLocationCoordinate2D(latitude: 38.939693, longitude: -76.464882),
            CLLocationCoordinate2D(latitude: 38.939690, longitude: -76.464897),
            CLLocationCoordinate2D(latitude: 38.939686, longitude: -76.464928), // Point 135
            CLLocationCoordinate2D(latitude: 38.939690, longitude: -76.464943),
            CLLocationCoordinate2D(latitude: 38.939690, longitude: -76.464958),
            CLLocationCoordinate2D(latitude: 38.939686, longitude: -76.464973),
            CLLocationCoordinate2D(latitude: 38.939674, longitude: -76.464973),
            //CLLocationCoordinate2D(latitude: 38.939674, longitude: -76.464981), // Point 140
            CLLocationCoordinate2D(latitude: 38.939674, longitude: -76.464989),
            CLLocationCoordinate2D(latitude: 38.939678, longitude: -76.464989),
            CLLocationCoordinate2D(latitude: 38.939682, longitude: -76.465004),
            CLLocationCoordinate2D(latitude: 38.939701, longitude: -76.465027),
            CLLocationCoordinate2D(latitude: 38.939709, longitude: -76.465050), // Point 145
            CLLocationCoordinate2D(latitude: 38.939709, longitude: -76.465057),
            CLLocationCoordinate2D(latitude: 38.939716, longitude: -76.465073),
            CLLocationCoordinate2D(latitude: 38.939724, longitude: -76.465088),
            CLLocationCoordinate2D(latitude: 38.939747, longitude: -76.465111),
            CLLocationCoordinate2D(latitude: 38.939754, longitude: -76.465126), // Point 150
            CLLocationCoordinate2D(latitude: 38.939777, longitude: -76.465141),
            CLLocationCoordinate2D(latitude: 38.939804, longitude: -76.465141),
            CLLocationCoordinate2D(latitude: 38.939812, longitude: -76.465149),
            CLLocationCoordinate2D(latitude: 38.939812, longitude: -76.465157),
            CLLocationCoordinate2D(latitude: 38.939808, longitude: -76.465149), // Point 155
            CLLocationCoordinate2D(latitude: 38.939816, longitude: -76.465172),
            //CLLocationCoordinate2D(latitude: 38.939816, longitude: -76.465172),
            //CLLocationCoordinate2D(latitude: 38.939816, longitude: -76.465172),
            CLLocationCoordinate2D(latitude: 38.939812, longitude: -76.465179),
            CLLocationCoordinate2D(latitude: 38.939823, longitude: -76.465202), // Point 160
            CLLocationCoordinate2D(latitude: 38.939831, longitude: -76.465210),
            CLLocationCoordinate2D(latitude: 38.939846, longitude: -76.465218),
            CLLocationCoordinate2D(latitude: 38.939861, longitude: -76.465218),
            CLLocationCoordinate2D(latitude: 38.939877, longitude: -76.465210),
            CLLocationCoordinate2D(latitude: 38.939896, longitude: -76.465225), // Point 165
            CLLocationCoordinate2D(latitude: 38.939899, longitude: -76.465233),
            CLLocationCoordinate2D(latitude: 38.939919, longitude: -76.465248),
            CLLocationCoordinate2D(latitude: 38.939926, longitude: -76.465263),
            CLLocationCoordinate2D(latitude: 38.939938, longitude: -76.465263),
            CLLocationCoordinate2D(latitude: 38.939949, longitude: -76.465271), // Point 170
            CLLocationCoordinate2D(latitude: 38.939960, longitude: -76.465279),
            CLLocationCoordinate2D(latitude: 38.939964, longitude: -76.465294),
            CLLocationCoordinate2D(latitude: 38.939964, longitude: -76.465302),
            CLLocationCoordinate2D(latitude: 38.939972, longitude: -76.465317),
            CLLocationCoordinate2D(latitude: 38.939980, longitude: -76.465317), // Point 175
            CLLocationCoordinate2D(latitude: 38.939987, longitude: -76.465309),
            CLLocationCoordinate2D(latitude: 38.940010, longitude: -76.465317),
            CLLocationCoordinate2D(latitude: 38.940018, longitude: -76.465317),
            CLLocationCoordinate2D(latitude: 38.940022, longitude: -76.465324),
            CLLocationCoordinate2D(latitude: 38.940025, longitude: -76.465332), // Point 180
            CLLocationCoordinate2D(latitude: 38.940025, longitude: -76.465340),
            CLLocationCoordinate2D(latitude: 38.940029, longitude: -76.465347),
            CLLocationCoordinate2D(latitude: 38.940052, longitude: -76.465355),
            CLLocationCoordinate2D(latitude: 38.940060, longitude: -76.465363),
            CLLocationCoordinate2D(latitude: 38.940071, longitude: -76.465370), // Point 185
            CLLocationCoordinate2D(latitude: 38.940083, longitude: -76.465363),
            CLLocationCoordinate2D(latitude: 38.940071, longitude: -76.465370)
        ]
        
        let FarmhousetoDeerExclosureCoordinates = [
            CLLocationCoordinate2D(latitude: 38.940155, longitude: -76.464661),
            CLLocationCoordinate2D(latitude: 38.940144, longitude: -76.464668), // Point 95
            CLLocationCoordinate2D(latitude: 38.940132, longitude: -76.464676),
            CLLocationCoordinate2D(latitude: 38.940128, longitude: -76.464676),
            CLLocationCoordinate2D(latitude: 38.940128, longitude: -76.464684),
            CLLocationCoordinate2D(latitude: 38.940125, longitude: -76.464684),
            CLLocationCoordinate2D(latitude: 38.940109, longitude: -76.464676), // Point 100
            CLLocationCoordinate2D(latitude: 38.940121, longitude: -76.464684),
            CLLocationCoordinate2D(latitude: 38.940109, longitude: -76.464676),
            //CLLocationCoordinate2D(latitude: 38.940109, longitude: -76.464676),
            //CLLocationCoordinate2D(latitude: 38.940105, longitude: -76.464676),
            //CLLocationCoordinate2D(latitude: 38.940105, longitude: -76.464676), // Point 105
            CLLocationCoordinate2D(latitude: 38.940102, longitude: -76.464676),
            //CLLocationCoordinate2D(latitude: 38.940102, longitude: -76.464676),
            CLLocationCoordinate2D(latitude: 38.940098, longitude: -76.464684),
            CLLocationCoordinate2D(latitude: 38.940083, longitude: -76.464684),
            //CLLocationCoordinate2D(latitude: 38.940083, longitude: -76.464684), // Point 110
            CLLocationCoordinate2D(latitude: 38.940075, longitude: -76.464691),
            CLLocationCoordinate2D(latitude: 38.940067, longitude: -76.464691),
            //CLLocationCoordinate2D(latitude: 38.940067, longitude: -76.464691),
            CLLocationCoordinate2D(latitude: 38.940060, longitude: -76.464691),
            CLLocationCoordinate2D(latitude: 38.940048, longitude: -76.464699), // Point 115
            //CLLocationCoordinate2D(latitude: 38.940048, longitude: -76.464699),
            CLLocationCoordinate2D(latitude: 38.940044, longitude: -76.464699),
            //CLLocationCoordinate2D(latitude: 38.940044, longitude: -76.464699),
            CLLocationCoordinate2D(latitude: 38.940037, longitude: -76.464714),
            CLLocationCoordinate2D(latitude: 38.940037, longitude: -76.464722), // Point 120
            //CLLocationCoordinate2D(latitude: 38.940037, longitude: -76.464722),
            CLLocationCoordinate2D(latitude: 38.940029, longitude: -76.464729),
            //CLLocationCoordinate2D(latitude: 38.940029, longitude: -76.464729),
            CLLocationCoordinate2D(latitude: 38.940029, longitude: -76.464737),
            CLLocationCoordinate2D(latitude: 38.940025, longitude: -76.464745), // Point 125
            //CLLocationCoordinate2D(latitude: 38.940025, longitude: -76.464745),
            //CLLocationCoordinate2D(latitude: 38.939953, longitude: -76.464890), // Possible Error
            CLLocationCoordinate2D(latitude: 38.940014, longitude: -76.464767),
            CLLocationCoordinate2D(latitude: 38.940006, longitude: -76.464775),
            //CLLocationCoordinate2D(latitude: 38.940006, longitude: -76.464775),
            CLLocationCoordinate2D(latitude: 38.939995, longitude: -76.464775), // Point 130
            CLLocationCoordinate2D(latitude: 38.939991, longitude: -76.464783),
            //CLLocationCoordinate2D(latitude: 38.939991, longitude: -76.464783),
            CLLocationCoordinate2D(latitude: 38.939983, longitude: -76.464806),
            CLLocationCoordinate2D(latitude: 38.939976, longitude: -76.464828),
            //CLLocationCoordinate2D(latitude: 38.939960, longitude: -76.464844), // Point 135 // Possible Error
            //CLLocationCoordinate2D(latitude: 38.939976, longitude: -76.464828),
            //CLLocationCoordinate2D(latitude: 38.939953, longitude: -76.464867), // Possible error
            //CLLocationCoordinate2D(latitude: 38.939953, longitude: -76.464890),
            CLLocationCoordinate2D(latitude: 38.939953, longitude: -76.464890),
            CLLocationCoordinate2D(latitude: 38.939957, longitude: -76.464912), // Point 140
            CLLocationCoordinate2D(latitude: 38.939960, longitude: -76.464935),
            //CLLocationCoordinate2D(latitude: 38.939960, longitude: -76.464935),
            CLLocationCoordinate2D(latitude: 38.939972, longitude: -76.464958),
            CLLocationCoordinate2D(latitude: 38.939987, longitude: -76.464973),
            CLLocationCoordinate2D(latitude: 38.940002, longitude: -76.464996), // Point 145
            CLLocationCoordinate2D(latitude: 38.940010, longitude: -76.465019),
            //CLLocationCoordinate2D(latitude: 38.940002, longitude: -76.464996), Possible Error
            CLLocationCoordinate2D(latitude: 38.940014, longitude: -76.465034),
            //CLLocationCoordinate2D(latitude: 38.940014, longitude: -76.465034),
            CLLocationCoordinate2D(latitude: 38.940025, longitude: -76.465057), // Point 150
            CLLocationCoordinate2D(latitude: 38.940033, longitude: -76.465080),
            //CLLocationCoordinate2D(latitude: 38.940033, longitude: -76.465080),
            CLLocationCoordinate2D(latitude: 38.940037, longitude: -76.465103),
            CLLocationCoordinate2D(latitude: 38.940033, longitude: -76.465111),
            //CLLocationCoordinate2D(latitude: 38.940033, longitude: -76.465111), // Point 155
            CLLocationCoordinate2D(latitude: 38.940056, longitude: -76.465141),
            CLLocationCoordinate2D(latitude: 38.940060, longitude: -76.465149),
            CLLocationCoordinate2D(latitude: 38.940056, longitude: -76.465172),
            //CLLocationCoordinate2D(latitude: 38.940056, longitude: -76.465172),
            //CLLocationCoordinate2D(latitude: 38.940056, longitude: -76.465172), // Point 160
            CLLocationCoordinate2D(latitude: 38.940063, longitude: -76.465179),
            CLLocationCoordinate2D(latitude: 38.940067, longitude: -76.465187),
            //CLLocationCoordinate2D(latitude: 38.940067, longitude: -76.465187),
            CLLocationCoordinate2D(latitude: 38.940071, longitude: -76.465187),
            CLLocationCoordinate2D(latitude: 38.940075, longitude: -76.465195), // Point 165
            //CLLocationCoordinate2D(latitude: 38.940075, longitude: -76.465195),
            CLLocationCoordinate2D(latitude: 38.940083, longitude: -76.465202),
            CLLocationCoordinate2D(latitude: 38.940086, longitude: -76.465210),
            CLLocationCoordinate2D(latitude: 38.940090, longitude: -76.465210),
            CLLocationCoordinate2D(latitude: 38.940094, longitude: -76.465218), // Point 170
            //CLLocationCoordinate2D(latitude: 38.940094, longitude: -76.465218),
            CLLocationCoordinate2D(latitude: 38.940094, longitude: -76.465233),
            CLLocationCoordinate2D(latitude: 38.940090, longitude: -76.465248),
            CLLocationCoordinate2D(latitude: 38.940094, longitude: -76.465256),
            //CLLocationCoordinate2D(latitude: 38.940094, longitude: -76.465256), // Point 175
            CLLocationCoordinate2D(latitude: 38.940098, longitude: -76.465263),
            //CLLocationCoordinate2D(latitude: 38.940098, longitude: -76.465263),
            CLLocationCoordinate2D(latitude: 38.940102, longitude: -76.465279),
            CLLocationCoordinate2D(latitude: 38.940105, longitude: -76.465302),
            //CLLocationCoordinate2D(latitude: 38.940105, longitude: -76.465302), // Point 180
            CLLocationCoordinate2D(latitude: 38.940094, longitude: -76.465302),
            CLLocationCoordinate2D(latitude: 38.940090, longitude: -76.465309)
            
        ]
        
        let FarraguttoFarmhouseTrail = [
            CLLocationCoordinate2D(latitude: 38.938793, longitude: -76.465057),
            CLLocationCoordinate2D(latitude: 38.938801, longitude: -76.465065),
            //CLLocationCoordinate2D(latitude: 38.938801, longitude: -76.465065),
            CLLocationCoordinate2D(latitude: 38.938805, longitude: -76.465073),
            CLLocationCoordinate2D(latitude: 38.938797, longitude: -76.465088), // Point 5
            //CLLocationCoordinate2D(latitude: 38.938805, longitude: -76.465088),
            CLLocationCoordinate2D(latitude: 38.938808, longitude: -76.465088),
            CLLocationCoordinate2D(latitude: 38.938824, longitude: -76.465080),
            CLLocationCoordinate2D(latitude: 38.938816, longitude: -76.465065),
            CLLocationCoordinate2D(latitude: 38.938812, longitude: -76.465065), // Point 10
            CLLocationCoordinate2D(latitude: 38.938805, longitude: -76.465073),
            CLLocationCoordinate2D(latitude: 38.938801, longitude: -76.465073),
            CLLocationCoordinate2D(latitude: 38.938805, longitude: -76.465080),
            //CLLocationCoordinate2D(latitude: 38.938816, longitude: -76.465080),
            CLLocationCoordinate2D(latitude: 38.938820, longitude: -76.465080), // Point 15
            //CLLocationCoordinate2D(latitude: 38.938820, longitude: -76.465080),
            CLLocationCoordinate2D(latitude: 38.938828, longitude: -76.465073),
            CLLocationCoordinate2D(latitude: 38.938835, longitude: -76.465073),
            CLLocationCoordinate2D(latitude: 38.938835, longitude: -76.465088),
            CLLocationCoordinate2D(latitude: 38.938850, longitude: -76.465096), // Point 20
            CLLocationCoordinate2D(latitude: 38.938862, longitude: -76.465103),
            CLLocationCoordinate2D(latitude: 38.938862, longitude: -76.465103),
            CLLocationCoordinate2D(latitude: 38.938869, longitude: -76.465118),
            CLLocationCoordinate2D(latitude: 38.938873, longitude: -76.465103),
            //CLLocationCoordinate2D(latitude: 38.938877, longitude: -76.465103), // Point 25
            //CLLocationCoordinate2D(latitude: 38.938881, longitude: -76.465103),
            CLLocationCoordinate2D(latitude: 38.938885, longitude: -76.465103),
            CLLocationCoordinate2D(latitude: 38.938896, longitude: -76.465088),
            CLLocationCoordinate2D(latitude: 38.938904, longitude: -76.465080),
            CLLocationCoordinate2D(latitude: 38.938934, longitude: -76.465073), // Point 30
            CLLocationCoordinate2D(latitude: 38.938946, longitude: -76.465088),
            CLLocationCoordinate2D(latitude: 38.938953, longitude: -76.465088),
            CLLocationCoordinate2D(latitude: 38.938984, longitude: -76.465050),
            CLLocationCoordinate2D(latitude: 38.938992, longitude: -76.465042),
            CLLocationCoordinate2D(latitude: 38.938999, longitude: -76.465034), // Point 35
            CLLocationCoordinate2D(latitude: 38.939007, longitude: -76.465027),
            CLLocationCoordinate2D(latitude: 38.939018, longitude: -76.465042),
            CLLocationCoordinate2D(latitude: 38.939018, longitude: -76.465034),
            CLLocationCoordinate2D(latitude: 38.939014, longitude: -76.465027),
            //CLLocationCoordinate2D(latitude: 38.939018, longitude: -76.465027), // Point 40
            CLLocationCoordinate2D(latitude: 38.939026, longitude: -76.465027),
            CLLocationCoordinate2D(latitude: 38.939045, longitude: -76.465012),
            //CLLocationCoordinate2D(latitude: 38.939045, longitude: -76.465012),
            CLLocationCoordinate2D(latitude: 38.939049, longitude: -76.465012),
            CLLocationCoordinate2D(latitude: 38.939049, longitude: -76.465004), // Point 45
            CLLocationCoordinate2D(latitude: 38.939056, longitude: -76.464996),
            CLLocationCoordinate2D(latitude: 38.939072, longitude: -76.465012),
            CLLocationCoordinate2D(latitude: 38.939083, longitude: -76.465019),
            CLLocationCoordinate2D(latitude: 38.939102, longitude: -76.465019),
            CLLocationCoordinate2D(latitude: 38.939117, longitude: -76.465012), // Point 50
            CLLocationCoordinate2D(latitude: 38.939152, longitude: -76.465050),
            //CLLocationCoordinate2D(latitude: 38.939159, longitude: -76.465050),
            CLLocationCoordinate2D(latitude: 38.939163, longitude: -76.465050),
            CLLocationCoordinate2D(latitude: 38.939167, longitude: -76.465042),
            CLLocationCoordinate2D(latitude: 38.939171, longitude: -76.465042), // Point 55
            CLLocationCoordinate2D(latitude: 38.939182, longitude: -76.465034),
            CLLocationCoordinate2D(latitude: 38.939190, longitude: -76.465034),
            CLLocationCoordinate2D(latitude: 38.939201, longitude: -76.465042),
            CLLocationCoordinate2D(latitude: 38.939205, longitude: -76.465050),
            CLLocationCoordinate2D(latitude: 38.939228, longitude: -76.465065), // Point 60
            CLLocationCoordinate2D(latitude: 38.939240, longitude: -76.465065),
            CLLocationCoordinate2D(latitude: 38.939247, longitude: -76.465073),
            CLLocationCoordinate2D(latitude: 38.939247, longitude: -76.465065),
            CLLocationCoordinate2D(latitude: 38.939255, longitude: -76.465073),
            CLLocationCoordinate2D(latitude: 38.939262, longitude: -76.465080), // Point 65
            CLLocationCoordinate2D(latitude: 38.939278, longitude: -76.465088),
            CLLocationCoordinate2D(latitude: 38.939281, longitude: -76.465111),
            CLLocationCoordinate2D(latitude: 38.939285, longitude: -76.465126),
            CLLocationCoordinate2D(latitude: 38.939289, longitude: -76.465126),
            CLLocationCoordinate2D(latitude: 38.939301, longitude: -76.465118), // Point 70
            //CLLocationCoordinate2D(latitude: 38.939308, longitude: -76.465118),
            CLLocationCoordinate2D(latitude: 38.939323, longitude: -76.465118),
            CLLocationCoordinate2D(latitude: 38.939342, longitude: -76.465134),
            //CLLocationCoordinate2D(latitude: 38.939346, longitude: -76.465134),
            CLLocationCoordinate2D(latitude: 38.939354, longitude: -76.465134), // Point 75
            CLLocationCoordinate2D(latitude: 38.939369, longitude: -76.465164),
            CLLocationCoordinate2D(latitude: 38.939396, longitude: -76.465179),
            CLLocationCoordinate2D(latitude: 38.939411, longitude: -76.465195),
            CLLocationCoordinate2D(latitude: 38.939426, longitude: -76.465202),
            CLLocationCoordinate2D(latitude: 38.939434, longitude: -76.465218), // Point 80
            CLLocationCoordinate2D(latitude: 38.939442, longitude: -76.465225),
            CLLocationCoordinate2D(latitude: 38.939453, longitude: -76.465225),
            CLLocationCoordinate2D(latitude: 38.939465, longitude: -76.465202),
            //CLLocationCoordinate2D(latitude: 38.939484, longitude: -76.465202),
            //CLLocationCoordinate2D(latitude: 38.939499, longitude: -76.465202), // Point 85
            CLLocationCoordinate2D(latitude: 38.939510, longitude: -76.465202),
            CLLocationCoordinate2D(latitude: 38.939522, longitude: -76.465210),
            //CLLocationCoordinate2D(latitude: 38.939526, longitude: -76.465210),
            CLLocationCoordinate2D(latitude: 38.939548, longitude: -76.465210),
            CLLocationCoordinate2D(latitude: 38.939575, longitude: -76.465202), // Point 90
            CLLocationCoordinate2D(latitude: 38.939575, longitude: -76.465187),
            CLLocationCoordinate2D(latitude: 38.939590, longitude: -76.465179),
            CLLocationCoordinate2D(latitude: 38.939606, longitude: -76.465187),
            CLLocationCoordinate2D(latitude: 38.939621, longitude: -76.465157),
            CLLocationCoordinate2D(latitude: 38.939632, longitude: -76.465149), // Point 95
            CLLocationCoordinate2D(latitude: 38.939644, longitude: -76.465134),
            CLLocationCoordinate2D(latitude: 38.939671, longitude: -76.465118),
            CLLocationCoordinate2D(latitude: 38.939682, longitude: -76.465111),
            CLLocationCoordinate2D(latitude: 38.939693, longitude: -76.465118),
            CLLocationCoordinate2D(latitude: 38.939709, longitude: -76.465134), // Point 100
            CLLocationCoordinate2D(latitude: 38.939724, longitude: -76.465141),
            CLLocationCoordinate2D(latitude: 38.939735, longitude: -76.465149),
            CLLocationCoordinate2D(latitude: 38.939739, longitude: -76.465141),
            CLLocationCoordinate2D(latitude: 38.939754, longitude: -76.465141),
            CLLocationCoordinate2D(latitude: 38.939770, longitude: -76.465134), // Point 105
            CLLocationCoordinate2D(latitude: 38.939777, longitude: -76.465126),
            CLLocationCoordinate2D(latitude: 38.939781, longitude: -76.465118),
            CLLocationCoordinate2D(latitude: 38.939796, longitude: -76.465126),
            CLLocationCoordinate2D(latitude: 38.939804, longitude: -76.465141),
            CLLocationCoordinate2D(latitude: 38.939823, longitude: -76.465157), // Point 110
            CLLocationCoordinate2D(latitude: 38.939827, longitude: -76.465164),
            //CLLocationCoordinate2D(latitude: 38.939835, longitude: -76.465164),
            CLLocationCoordinate2D(latitude: 38.939838, longitude: -76.465164),
            CLLocationCoordinate2D(latitude: 38.939850, longitude: -76.465172),
            CLLocationCoordinate2D(latitude: 38.939857, longitude: -76.465179), // Point 115
            CLLocationCoordinate2D(latitude: 38.939861, longitude: -76.465187),
            CLLocationCoordinate2D(latitude: 38.939865, longitude: -76.465187),
            //CLLocationCoordinate2D(latitude: 38.939865, longitude: -76.465187),
            CLLocationCoordinate2D(latitude: 38.939865, longitude: -76.465195),
            CLLocationCoordinate2D(latitude: 38.939869, longitude: -76.465202), // Point 120
            CLLocationCoordinate2D(latitude: 38.939880, longitude: -76.465218),
            CLLocationCoordinate2D(latitude: 38.939873, longitude: -76.465240),
            CLLocationCoordinate2D(latitude: 38.939880, longitude: -76.465248),
            CLLocationCoordinate2D(latitude: 38.939884, longitude: -76.465256),
            CLLocationCoordinate2D(latitude: 38.939899, longitude: -76.465271), // Point 125
            CLLocationCoordinate2D(latitude: 38.939911, longitude: -76.465279),
            CLLocationCoordinate2D(latitude: 38.939915, longitude: -76.465286),
            CLLocationCoordinate2D(latitude: 38.939926, longitude: -76.465286),
            CLLocationCoordinate2D(latitude: 38.939934, longitude: -76.465302),
            CLLocationCoordinate2D(latitude: 38.939938, longitude: -76.465309), // Point 130
            CLLocationCoordinate2D(latitude: 38.939957, longitude: -76.465324),
            CLLocationCoordinate2D(latitude: 38.939964, longitude: -76.465332),
            CLLocationCoordinate2D(latitude: 38.939968, longitude: -76.465340),
            CLLocationCoordinate2D(latitude: 38.939983, longitude: -76.465340),
            CLLocationCoordinate2D(latitude: 38.940014, longitude: -76.465363), // Point 135
            CLLocationCoordinate2D(latitude: 38.940025, longitude: -76.465363),
            CLLocationCoordinate2D(latitude: 38.940041, longitude: -76.465393),
            CLLocationCoordinate2D(latitude: 38.940052, longitude: -76.465408),
            CLLocationCoordinate2D(latitude: 38.940056, longitude: -76.465424),
            //CLLocationCoordinate2D(latitude: 38.940056, longitude: -76.465424), // Point 140
            //CLLocationCoordinate2D(latitude: 38.940056, longitude: -76.465424),
            
        ]
        
        let FishermanTrailLocations = [
            CLLocationCoordinate2D(latitude: 38.936455, longitude: -76.470009),
            CLLocationCoordinate2D(latitude: 38.936455, longitude: -76.470001),
            //CLLocationCoordinate2D(latitude: 38.936455, longitude: -76.470001),
            //CLLocationCoordinate2D(latitude: 38.936455, longitude: -76.470001),
            CLLocationCoordinate2D(latitude: 38.936466, longitude: -76.470016), // Point 5/6
            CLLocationCoordinate2D(latitude: 38.936470, longitude: -76.470009),
            CLLocationCoordinate2D(latitude: 38.936466, longitude: -76.470001),
            CLLocationCoordinate2D(latitude: 38.936470, longitude: -76.470001),
            CLLocationCoordinate2D(latitude: 38.936466, longitude: -76.470016), // Point 7/8
            CLLocationCoordinate2D(latitude: 38.936485, longitude: -76.469978), // Point 10
            CLLocationCoordinate2D(latitude: 38.936501, longitude: -76.469963),
            CLLocationCoordinate2D(latitude: 38.936504, longitude: -76.469933),
            CLLocationCoordinate2D(latitude: 38.936527, longitude: -76.469971),
            //CLLocationCoordinate2D(latitude: 38.936527, longitude: -76.469971),
            CLLocationCoordinate2D(latitude: 38.936520, longitude: -76.469963), // Point 15
            CLLocationCoordinate2D(latitude: 38.936516, longitude: -76.469971),
            //CLLocationCoordinate2D(latitude: 38.936516, longitude: -76.469971),
            CLLocationCoordinate2D(latitude: 38.936523, longitude: -76.469986),
            //CLLocationCoordinate2D(latitude: 38.936523, longitude: -76.469986),
            CLLocationCoordinate2D(latitude: 38.936535, longitude: -76.470001), // Point 20
            CLLocationCoordinate2D(latitude: 38.936531, longitude: -76.470001),
            CLLocationCoordinate2D(latitude: 38.936523, longitude: -76.470032),
            CLLocationCoordinate2D(latitude: 38.936523, longitude: -76.470032), // 23/24 are flipped
            CLLocationCoordinate2D(latitude: 38.936527, longitude: -76.470055),
            CLLocationCoordinate2D(latitude: 38.936531, longitude: -76.470070), // Point 25
            CLLocationCoordinate2D(latitude: 38.936535, longitude: -76.470093),
            //CLLocationCoordinate2D(latitude: 38.936531, longitude: -76.470078), // 26/27
            CLLocationCoordinate2D(latitude: 38.936539, longitude: -76.470100),
            CLLocationCoordinate2D(latitude: 38.936546, longitude: -76.470116),
            CLLocationCoordinate2D(latitude: 38.936543, longitude: -76.470116), // Point 30
            CLLocationCoordinate2D(latitude: 38.936543, longitude: -76.470123),
            CLLocationCoordinate2D(latitude: 38.936546, longitude: -76.470123),
            CLLocationCoordinate2D(latitude: 38.936554, longitude: -76.470123),
            CLLocationCoordinate2D(latitude: 38.936562, longitude: -76.470131),
            CLLocationCoordinate2D(latitude: 38.936577, longitude: -76.470139), // Point 35
            CLLocationCoordinate2D(latitude: 38.936581, longitude: -76.470139),
            CLLocationCoordinate2D(latitude: 38.936588, longitude: -76.470131),
            //CLLocationCoordinate2D(latitude: 38.936592, longitude: -76.470131),
            //CLLocationCoordinate2D(latitude: 38.936588, longitude: -76.470131),
            CLLocationCoordinate2D(latitude: 38.936592, longitude: -76.470131), // Point 40
            //CLLocationCoordinate2D(latitude: 38.936592, longitude: -76.470131),
            CLLocationCoordinate2D(latitude: 38.936596, longitude: -76.470131),
            //CLLocationCoordinate2D(latitude: 38.936596, longitude: -76.470131),
            CLLocationCoordinate2D(latitude: 38.936596, longitude: -76.470123),
            CLLocationCoordinate2D(latitude: 38.936600, longitude: -76.470116), // Point 45
            CLLocationCoordinate2D(latitude: 38.936600, longitude: -76.470108),
            CLLocationCoordinate2D(latitude: 38.936604, longitude: -76.470108),
            CLLocationCoordinate2D(latitude: 38.936604, longitude: -76.470093),
            CLLocationCoordinate2D(latitude: 38.936615, longitude: -76.470078),
            CLLocationCoordinate2D(latitude: 38.936630, longitude: -76.470070), // Point 50
            //CLLocationCoordinate2D(latitude: 38.936630, longitude: -76.470070),
            //CLLocationCoordinate2D(latitude: 38.936630, longitude: -76.470070),
            //CLLocationCoordinate2D(latitude: 38.936630, longitude: -76.470070),
            CLLocationCoordinate2D(latitude: 38.936634, longitude: -76.470070),
            //CLLocationCoordinate2D(latitude: 38.936634, longitude: -76.470070), // Point 55
            //CLLocationCoordinate2D(latitude: 38.936634, longitude: -76.470070),
            CLLocationCoordinate2D(latitude: 38.936642, longitude: -76.470070),
            CLLocationCoordinate2D(latitude: 38.936642, longitude: -76.470062),
            CLLocationCoordinate2D(latitude: 38.936646, longitude: -76.470055),
            //CLLocationCoordinate2D(latitude: 38.936646, longitude: -76.470055), // Point 60
            CLLocationCoordinate2D(latitude: 38.936642, longitude: -76.470039),
            CLLocationCoordinate2D(latitude: 38.936642, longitude: -76.470024),
            CLLocationCoordinate2D(latitude: 38.936653, longitude: -76.470016),
            CLLocationCoordinate2D(latitude: 38.936657, longitude: -76.470016),
            CLLocationCoordinate2D(latitude: 38.936657, longitude: -76.470009), // Point 65
            CLLocationCoordinate2D(latitude: 38.936661, longitude: -76.470001),
            CLLocationCoordinate2D(latitude: 38.936668, longitude: -76.470001),
            CLLocationCoordinate2D(latitude: 38.936680, longitude: -76.469978),
            CLLocationCoordinate2D(latitude: 38.936684, longitude: -76.469971),
            //CLLocationCoordinate2D(latitude: 38.936684, longitude: -76.469971), // Point 70
            //CLLocationCoordinate2D(latitude: 38.936684, longitude: -76.469971),
            CLLocationCoordinate2D(latitude: 38.936687, longitude: -76.469933),
            CLLocationCoordinate2D(latitude: 38.936695, longitude: -76.469917),
            CLLocationCoordinate2D(latitude: 38.936699, longitude: -76.469902),
            //CLLocationCoordinate2D(latitude: 38.936699, longitude: -76.469902), // Point 75
            //CLLocationCoordinate2D(latitude: 38.936699, longitude: -76.469902),
            CLLocationCoordinate2D(latitude: 38.936699, longitude: -76.469887),
            CLLocationCoordinate2D(latitude: 38.936707, longitude: -76.469879),
            CLLocationCoordinate2D(latitude: 38.936710, longitude: -76.469864),
            //CLLocationCoordinate2D(latitude: 38.936710, longitude: -76.469864), // Point 80
            //CLLocationCoordinate2D(latitude: 38.936710, longitude: -76.469864),
            //CLLocationCoordinate2D(latitude: 38.936710, longitude: -76.469864),
            CLLocationCoordinate2D(latitude: 38.936714, longitude: -76.469856),
            //CLLocationCoordinate2D(latitude: 38.936714, longitude: -76.469856),
            CLLocationCoordinate2D(latitude: 38.936726, longitude: -76.469849), // Point 85
            CLLocationCoordinate2D(latitude: 38.936741, longitude: -76.469833),
            CLLocationCoordinate2D(latitude: 38.936779, longitude: -76.469818),
            CLLocationCoordinate2D(latitude: 38.936787, longitude: -76.469810),
            CLLocationCoordinate2D(latitude: 38.936806, longitude: -76.469795),
            //CLLocationCoordinate2D(latitude: 38.936806, longitude: -76.469795), // Point 90
            CLLocationCoordinate2D(latitude: 38.936806, longitude: -76.469788),
            CLLocationCoordinate2D(latitude: 38.936810, longitude: -76.469788),
            //CLLocationCoordinate2D(latitude: 38.936810, longitude: -76.469788),
            //CLLocationCoordinate2D(latitude: 38.936810, longitude: -76.469788),
            CLLocationCoordinate2D(latitude: 38.936813, longitude: -76.469788), // Point 95
            CLLocationCoordinate2D(latitude: 38.936817, longitude: -76.469765),
            CLLocationCoordinate2D(latitude: 38.936829, longitude: -76.469742),
            CLLocationCoordinate2D(latitude: 38.936832, longitude: -76.469734),
            CLLocationCoordinate2D(latitude: 38.936844, longitude: -76.469719),
            CLLocationCoordinate2D(latitude: 38.936855, longitude: -76.469704), // Point 100
            CLLocationCoordinate2D(latitude: 38.936867, longitude: -76.469696),
            CLLocationCoordinate2D(latitude: 38.936874, longitude: -76.469650),
            CLLocationCoordinate2D(latitude: 38.936882, longitude: -76.469635),
            CLLocationCoordinate2D(latitude: 38.936882, longitude: -76.469612),
            CLLocationCoordinate2D(latitude: 38.936886, longitude: -76.469597), // Point 105
            CLLocationCoordinate2D(latitude: 38.936890, longitude: -76.469543),
            CLLocationCoordinate2D(latitude: 38.936897, longitude: -76.469528),
            CLLocationCoordinate2D(latitude: 38.936901, longitude: -76.469513),
            CLLocationCoordinate2D(latitude: 38.936924, longitude: -76.469482),
            CLLocationCoordinate2D(latitude: 38.936920, longitude: -76.469475), // Point 110
            //CLLocationCoordinate2D(latitude: 38.936920, longitude: -76.469475),
            CLLocationCoordinate2D(latitude: 38.936928, longitude: -76.469467),
            CLLocationCoordinate2D(latitude: 38.936928, longitude: -76.469460),
            CLLocationCoordinate2D(latitude: 38.936943, longitude: -76.469444),
            CLLocationCoordinate2D(latitude: 38.936947, longitude: -76.469444), // Point 115
            //CLLocationCoordinate2D(latitude: 38.936947, longitude: -76.469444),
            //CLLocationCoordinate2D(latitude: 38.936947, longitude: -76.469444),
            //CLLocationCoordinate2D(latitude: 38.936947, longitude: -76.469444),
            //CLLocationCoordinate2D(latitude: 38.936947, longitude: -76.469444),
            //CLLocationCoordinate2D(latitude: 38.936947, longitude: -76.469444), // Point 120
            //CLLocationCoordinate2D(latitude: 38.936947, longitude: -76.469444),
            //CLLocationCoordinate2D(latitude: 38.936947, longitude: -76.469444),
            //CLLocationCoordinate2D(latitude: 38.936947, longitude: -76.469444),
            CLLocationCoordinate2D(latitude: 38.936951, longitude: -76.469444),
            CLLocationCoordinate2D(latitude: 38.936954, longitude: -76.469437), // Point 125
            //CLLocationCoordinate2D(latitude: 38.936954, longitude: -76.469437),
            //CLLocationCoordinate2D(latitude: 38.936954, longitude: -76.469444),
            //CLLocationCoordinate2D(latitude: 38.936954, longitude: -76.469437),
            CLLocationCoordinate2D(latitude: 38.936958, longitude: -76.469421),
            CLLocationCoordinate2D(latitude: 38.936966, longitude: -76.469406), // Point 130
            CLLocationCoordinate2D(latitude: 38.936970, longitude: -76.469391),
            CLLocationCoordinate2D(latitude: 38.936974, longitude: -76.469376),
            CLLocationCoordinate2D(latitude: 38.936977, longitude: -76.469368),
            CLLocationCoordinate2D(latitude: 38.936985, longitude: -76.469353),
            CLLocationCoordinate2D(latitude: 38.936989, longitude: -76.469337), // Point 135
            CLLocationCoordinate2D(latitude: 38.937012, longitude: -76.469315),
            CLLocationCoordinate2D(latitude: 38.937019, longitude: -76.469307),
            CLLocationCoordinate2D(latitude: 38.937031, longitude: -76.469276),
            //CLLocationCoordinate2D(latitude: 38.937057, longitude: -76.469284), // Possible Error
            //CLLocationCoordinate2D(latitude: 38.937054, longitude: -76.469284), // Point 140 Possible Error
            CLLocationCoordinate2D(latitude: 38.937054, longitude: -76.469269),
            CLLocationCoordinate2D(latitude: 38.937057, longitude: -76.469261),
            CLLocationCoordinate2D(latitude: 38.937061, longitude: -76.469246),
            //CLLocationCoordinate2D(latitude: 38.937077, longitude: -76.469254), // Possible Error
            CLLocationCoordinate2D(latitude: 38.937073, longitude: -76.469261), // Point 145
            CLLocationCoordinate2D(latitude: 38.937080, longitude: -76.469261),
            CLLocationCoordinate2D(latitude: 38.937092, longitude: -76.469254),
            CLLocationCoordinate2D(latitude: 38.937099, longitude: -76.469238),
            //CLLocationCoordinate2D(latitude: 38.937099, longitude: -76.469238),
            CLLocationCoordinate2D(latitude: 38.937103, longitude: -76.469238), // Point 150
            CLLocationCoordinate2D(latitude: 38.937103, longitude: -76.469215),
            CLLocationCoordinate2D(latitude: 38.937111, longitude: -76.469185),
            //CLLocationCoordinate2D(latitude: 38.937111, longitude: -76.469177),
            CLLocationCoordinate2D(latitude: 38.937111, longitude: -76.469154),
            CLLocationCoordinate2D(latitude: 38.937107, longitude: -76.469147), // Point 155
            CLLocationCoordinate2D(latitude: 38.937119, longitude: -76.469124),
            CLLocationCoordinate2D(latitude: 38.937122, longitude: -76.469093),
            CLLocationCoordinate2D(latitude: 38.937126, longitude: -76.469078),
            CLLocationCoordinate2D(latitude: 38.937134, longitude: -76.469063),
            CLLocationCoordinate2D(latitude: 38.937141, longitude: -76.469048), // Point 160
            CLLocationCoordinate2D(latitude: 38.937153, longitude: -76.469025),
            CLLocationCoordinate2D(latitude: 38.937153, longitude: -76.469017),
            //CLLocationCoordinate2D(latitude: 38.937153, longitude: -76.469017),
            //CLLocationCoordinate2D(latitude: 38.937153, longitude: -76.469017),
            CLLocationCoordinate2D(latitude: 38.937157, longitude: -76.469009), // Point 165
            //CLLocationCoordinate2D(latitude: 38.937157, longitude: -76.469009),
            //CLLocationCoordinate2D(latitude: 38.937157, longitude: -76.469009),
            CLLocationCoordinate2D(latitude: 38.937160, longitude: -76.469009),
            //CLLocationCoordinate2D(latitude: 38.937160, longitude: -76.469009),
            //CLLocationCoordinate2D(latitude: 38.937160, longitude: -76.469009), // Point 170
            CLLocationCoordinate2D(latitude: 38.937176, longitude: -76.469017),
            CLLocationCoordinate2D(latitude: 38.937180, longitude: -76.469017),
            CLLocationCoordinate2D(latitude: 38.937180, longitude: -76.469009),
            CLLocationCoordinate2D(latitude: 38.937187, longitude: -76.468994),
            CLLocationCoordinate2D(latitude: 38.937191, longitude: -76.468987), // Point 175
            CLLocationCoordinate2D(latitude: 38.937191, longitude: -76.468979),
            CLLocationCoordinate2D(latitude: 38.937195, longitude: -76.468979),
            //CLLocationCoordinate2D(latitude: 38.937195, longitude: -76.468979),
            //CLLocationCoordinate2D(latitude: 38.937195, longitude: -76.468979),
            //CLLocationCoordinate2D(latitude: 38.937195, longitude: -76.468979), // Point 180
            //CLLocationCoordinate2D(latitude: 38.937195, longitude: -76.468979),
            CLLocationCoordinate2D(latitude: 38.937199, longitude: -76.468971),
            CLLocationCoordinate2D(latitude: 38.937222, longitude: -76.468941),
            //CLLocationCoordinate2D(latitude: 38.937244, longitude: -76.468941),
            CLLocationCoordinate2D(latitude: 38.937248, longitude: -76.468941), // Point 185
            // Coordinate with large gap
            //CLLocationCoordinate2D(latitude: 38.937248, longitude: -76.468941),
            //CLLocationCoordinate2D(latitude: 38.937248, longitude: -76.468941),
            CLLocationCoordinate2D(latitude: 38.937447, longitude: -76.468910),
            //CLLocationCoordinate2D(latitude: 38.937447, longitude: -76.468910),
            //CLLocationCoordinate2D(latitude: 38.937447, longitude: -76.468910), // Point 190
            CLLocationCoordinate2D(latitude: 38.937447, longitude: -76.468918),
            //CLLocationCoordinate2D(latitude: 38.937447, longitude: -76.468918),
            //CLLocationCoordinate2D(latitude: 38.937443, longitude: -76.468918),
            //CLLocationCoordinate2D(latitude: 38.937447, longitude: -76.468918),
            CLLocationCoordinate2D(latitude: 38.937450, longitude: -76.468910), // Point 195
            CLLocationCoordinate2D(latitude: 38.937454, longitude: -76.468903),
            CLLocationCoordinate2D(latitude: 38.937466, longitude: -76.468895),
            //CLLocationCoordinate2D(latitude: 38.937466, longitude: -76.468895),
            //CLLocationCoordinate2D(latitude: 38.937466, longitude: -76.468895),
            //CLLocationCoordinate2D(latitude: 38.937466, longitude: -76.468895), // Point 200
            //CLLocationCoordinate2D(latitude: 38.937466, longitude: -76.468895),
            //CLLocationCoordinate2D(latitude: 38.937466, longitude: -76.468895),
            //CLLocationCoordinate2D(latitude: 38.937466, longitude: -76.468895),
            CLLocationCoordinate2D(latitude: 38.937477, longitude: -76.468903),
            CLLocationCoordinate2D(latitude: 38.937485, longitude: -76.468925), // Point 205
            //CLLocationCoordinate2D(latitude: 38.937481, longitude: -76.468918), // Possible Error
            //CLLocationCoordinate2D(latitude: 38.937485, longitude: -76.468918),
//            CLLocationCoordinate2D(latitude: 38.937489, longitude: -76.468918),
            //CLLocationCoordinate2D(latitude: 38.937481, longitude: -76.468918),
            //CLLocationCoordinate2D(latitude: 38.937481, longitude: -76.468918), // Point 210
//            CLLocationCoordinate2D(latitude: 38.937572, longitude: -76.468781),
//            CLLocationCoordinate2D(latitude: 38.937569, longitude: -76.468788),
//            CLLocationCoordinate2D(latitude: 38.937565, longitude: -76.468788),
//            CLLocationCoordinate2D(latitude: 38.937572, longitude: -76.468811), // Possible Error
            CLLocationCoordinate2D(latitude: 38.937576, longitude: -76.468834), // Point 215
            CLLocationCoordinate2D(latitude: 38.937576, longitude: -76.468842),
            CLLocationCoordinate2D(latitude: 38.937580, longitude: -76.468842),
            CLLocationCoordinate2D(latitude: 38.937580, longitude: -76.468849),
            CLLocationCoordinate2D(latitude: 38.937584, longitude: -76.468834),
            //CLLocationCoordinate2D(latitude: 38.937584, longitude: -76.468834), // Point 220
            //CLLocationCoordinate2D(latitude: 38.937584, longitude: -76.468834),
            //CLLocationCoordinate2D(latitude: 38.937584, longitude: -76.468834),
            //CLLocationCoordinate2D(latitude: 38.937584, longitude: -76.468834),
            //CLLocationCoordinate2D(latitude: 38.937584, longitude: -76.468834),
            //CLLocationCoordinate2D(latitude: 38.937584, longitude: -76.468834), // Point 225
            //CLLocationCoordinate2D(latitude: 38.937584, longitude: -76.468834),
            CLLocationCoordinate2D(latitude: 38.937607, longitude: -76.468811),
            CLLocationCoordinate2D(latitude: 38.937611, longitude: -76.468788),
            CLLocationCoordinate2D(latitude: 38.937614, longitude: -76.468773),
            CLLocationCoordinate2D(latitude: 38.937630, longitude: -76.468765), // Point 230
            CLLocationCoordinate2D(latitude: 38.937649, longitude: -76.468742),
            CLLocationCoordinate2D(latitude: 38.937649, longitude: -76.468735),
            //CLLocationCoordinate2D(latitude: 38.937649, longitude: -76.468735),
            //CLLocationCoordinate2D(latitude: 38.937649, longitude: -76.468735),
            CLLocationCoordinate2D(latitude: 38.937653, longitude: -76.468727), // Point 235
            CLLocationCoordinate2D(latitude: 38.937660, longitude: -76.468727),
            //CLLocationCoordinate2D(latitude: 38.937660, longitude: -76.468727),
            CLLocationCoordinate2D(latitude: 38.937660, longitude: -76.468735),
            //CLLocationCoordinate2D(latitude: 38.937660, longitude: -76.468735),
            CLLocationCoordinate2D(latitude: 38.937660, longitude: -76.468735), // Point 240
            CLLocationCoordinate2D(latitude: 38.937668, longitude: -76.468727),
            CLLocationCoordinate2D(latitude: 38.937672, longitude: -76.468735),
            //CLLocationCoordinate2D(latitude: 38.937672, longitude: -76.468735),
            //CLLocationCoordinate2D(latitude: 38.937672, longitude: -76.468735),
            CLLocationCoordinate2D(latitude: 38.937695, longitude: -76.468750), // Point 245
            CLLocationCoordinate2D(latitude: 38.937698, longitude: -76.468750),
            CLLocationCoordinate2D(latitude: 38.937698, longitude: -76.468758),
            //CLLocationCoordinate2D(latitude: 38.937698, longitude: -76.468758),
            CLLocationCoordinate2D(latitude: 38.937702, longitude: -76.468758),
            CLLocationCoordinate2D(latitude: 38.937748, longitude: -76.468758), // Point 250
            //CLLocationCoordinate2D(latitude: 38.937756, longitude: -76.468674), // Possible Error
            //CLLocationCoordinate2D(latitude: 38.937744, longitude: -76.468674),
            //CLLocationCoordinate2D(latitude: 38.937744, longitude: -76.468674),
            //CLLocationCoordinate2D(latitude: 38.937763, longitude: -76.468674), // Possible Error
            CLLocationCoordinate2D(latitude: 38.937782, longitude: -76.468727), // Point 255
            CLLocationCoordinate2D(latitude: 38.937840, longitude: -76.468742),
            CLLocationCoordinate2D(latitude: 38.937840, longitude: -76.468735),
            //CLLocationCoordinate2D(latitude: 38.937840, longitude: -76.468735),
            CLLocationCoordinate2D(latitude: 38.937840, longitude: -76.468727),
            CLLocationCoordinate2D(latitude: 38.937840, longitude: -76.468719), // Point 260
            //CLLocationCoordinate2D(latitude: 38.937840, longitude: -76.468719),
            //CLLocationCoordinate2D(latitude: 38.937840, longitude: -76.468719),
            //CLLocationCoordinate2D(latitude: 38.937840, longitude: -76.468719),
            CLLocationCoordinate2D(latitude: 38.937836, longitude: -76.468727),
            CLLocationCoordinate2D(latitude: 38.937832, longitude: -76.468712), // Point 265
            CLLocationCoordinate2D(latitude: 38.937836, longitude: -76.468712),
            CLLocationCoordinate2D(latitude: 38.937847, longitude: -76.468719),
            //CLLocationCoordinate2D(latitude: 38.937866, longitude: -76.468719),
            //CLLocationCoordinate2D(latitude: 38.937878, longitude: -76.468719),
            CLLocationCoordinate2D(latitude: 38.937889, longitude: -76.468719), // Point 270
            CLLocationCoordinate2D(latitude: 38.937897, longitude: -76.468735),
            CLLocationCoordinate2D(latitude: 38.937901, longitude: -76.468750),
            CLLocationCoordinate2D(latitude: 38.937916, longitude: -76.468765),
            CLLocationCoordinate2D(latitude: 38.937931, longitude: -76.468758),
            CLLocationCoordinate2D(latitude: 38.937943, longitude: -76.468750), // Point 275
            CLLocationCoordinate2D(latitude: 38.937950, longitude: -76.468742),
            CLLocationCoordinate2D(latitude: 38.937958, longitude: -76.468758),
            CLLocationCoordinate2D(latitude: 38.937988, longitude: -76.468773),
            CLLocationCoordinate2D(latitude: 38.938000, longitude: -76.468773),
            CLLocationCoordinate2D(latitude: 38.938007, longitude: -76.468781), // Point 280
            CLLocationCoordinate2D(latitude: 38.938034, longitude: -76.468803),
            CLLocationCoordinate2D(latitude: 38.938038, longitude: -76.468811),
            //CLLocationCoordinate2D(latitude: 38.938038, longitude: -76.468819),
            CLLocationCoordinate2D(latitude: 38.938038, longitude: -76.468826),
            CLLocationCoordinate2D(latitude: 38.938053, longitude: -76.468826), // Point 285
            CLLocationCoordinate2D(latitude: 38.938061, longitude: -76.468826),
            CLLocationCoordinate2D(latitude: 38.938065, longitude: -76.468842),
            CLLocationCoordinate2D(latitude: 38.938068, longitude: -76.468849),
            CLLocationCoordinate2D(latitude: 38.938076, longitude: -76.468849),
            CLLocationCoordinate2D(latitude: 38.938087, longitude: -76.468857), // Point 290
            CLLocationCoordinate2D(latitude: 38.938095, longitude: -76.468872),
            CLLocationCoordinate2D(latitude: 38.938099, longitude: -76.468880),
            //CLLocationCoordinate2D(latitude: 38.938099, longitude: -76.468880),
            CLLocationCoordinate2D(latitude: 38.938103, longitude: -76.468880),
            //CLLocationCoordinate2D(latitude: 38.938103, longitude: -76.468880), // Point 295
            //CLLocationCoordinate2D(latitude: 38.938107, longitude: -76.468880),
            CLLocationCoordinate2D(latitude: 38.938110, longitude: -76.468880),
            //CLLocationCoordinate2D(latitude: 38.938110, longitude: -76.468880),
            CLLocationCoordinate2D(latitude: 38.938114, longitude: -76.468872),
            CLLocationCoordinate2D(latitude: 38.938126, longitude: -76.468887), // Point 300
            CLLocationCoordinate2D(latitude: 38.938129, longitude: -76.468895),
            //CLLocationCoordinate2D(latitude: 38.938129, longitude: -76.468895),
            CLLocationCoordinate2D(latitude: 38.938141, longitude: -76.468887),
            CLLocationCoordinate2D(latitude: 38.938141, longitude: -76.468895),
            CLLocationCoordinate2D(latitude: 38.938137, longitude: -76.468910), // Point 305
            //CLLocationCoordinate2D(latitude: 38.938137, longitude: -76.468910),
            CLLocationCoordinate2D(latitude: 38.938145, longitude: -76.468933),
            CLLocationCoordinate2D(latitude: 38.938152, longitude: -76.468933),
            CLLocationCoordinate2D(latitude: 38.938225, longitude: -76.468857),
            //CLLocationCoordinate2D(latitude: 38.938225, longitude: -76.468857), // Point 310
            CLLocationCoordinate2D(latitude: 38.938225, longitude: -76.468849),
            CLLocationCoordinate2D(latitude: 38.938232, longitude: -76.468842),
            CLLocationCoordinate2D(latitude: 38.938236, longitude: -76.468842),
            CLLocationCoordinate2D(latitude: 38.938236, longitude: -76.468834),
            CLLocationCoordinate2D(latitude: 38.938255, longitude: -76.468811), // Point 315
            CLLocationCoordinate2D(latitude: 38.938278, longitude: -76.468834),
            //CLLocationCoordinate2D(latitude: 38.938278, longitude: -76.468834),
            CLLocationCoordinate2D(latitude: 38.938286, longitude: -76.468826),
            //CLLocationCoordinate2D(latitude: 38.938286, longitude: -76.468826),
            CLLocationCoordinate2D(latitude: 38.938290, longitude: -76.468826), // Point 320
            CLLocationCoordinate2D(latitude: 38.938301, longitude: -76.468842),
            CLLocationCoordinate2D(latitude: 38.938313, longitude: -76.468819),
            CLLocationCoordinate2D(latitude: 38.938324, longitude: -76.468819),
            CLLocationCoordinate2D(latitude: 38.938328, longitude: -76.468826),
            //CLLocationCoordinate2D(latitude: 38.938328, longitude: -76.468826), // Point 325
            CLLocationCoordinate2D(latitude: 38.938332, longitude: -76.468834),
            CLLocationCoordinate2D(latitude: 38.938374, longitude: -76.468872),
            //CLLocationCoordinate2D(latitude: 38.938374, longitude: -76.468872),
            CLLocationCoordinate2D(latitude: 38.938377, longitude: -76.468872),
            CLLocationCoordinate2D(latitude: 38.938381, longitude: -76.468880), // Point 330
            CLLocationCoordinate2D(latitude: 38.938381, longitude: -76.468872),
            CLLocationCoordinate2D(latitude: 38.938385, longitude: -76.468872),
            //CLLocationCoordinate2D(latitude: 38.938377, longitude: -76.468880), // Possible Error
            //CLLocationCoordinate2D(latitude: 38.938377, longitude: -76.468880),
            //CLLocationCoordinate2D(latitude: 38.938377, longitude: -76.468880), // Point 335
            //CLLocationCoordinate2D(latitude: 38.938381, longitude: -76.468880),
            CLLocationCoordinate2D(latitude: 38.938385, longitude: -76.468880),
            CLLocationCoordinate2D(latitude: 38.938385, longitude: -76.468872),
            CLLocationCoordinate2D(latitude: 38.938389, longitude: -76.468872),
            //CLLocationCoordinate2D(latitude: 38.938389, longitude: -76.468872), // Point 340
            CLLocationCoordinate2D(latitude: 38.938393, longitude: -76.468872),
            CLLocationCoordinate2D(latitude: 38.938404, longitude: -76.468864),
            CLLocationCoordinate2D(latitude: 38.938419, longitude: -76.468834),
            CLLocationCoordinate2D(latitude: 38.938435, longitude: -76.468826),
            CLLocationCoordinate2D(latitude: 38.938454, longitude: -76.468803), // Point 345
            CLLocationCoordinate2D(latitude: 38.938473, longitude: -76.468811),
            CLLocationCoordinate2D(latitude: 38.938496, longitude: -76.468803),
            CLLocationCoordinate2D(latitude: 38.938499, longitude: -76.468796),
            CLLocationCoordinate2D(latitude: 38.938507, longitude: -76.468788),
            CLLocationCoordinate2D(latitude: 38.938519, longitude: -76.468773), // Point 350
            CLLocationCoordinate2D(latitude: 38.938530, longitude: -76.468758),
            CLLocationCoordinate2D(latitude: 38.938549, longitude: -76.468750),
            CLLocationCoordinate2D(latitude: 38.938560, longitude: -76.468742),
            CLLocationCoordinate2D(latitude: 38.938560, longitude: -76.468750),
            CLLocationCoordinate2D(latitude: 38.938572, longitude: -76.468750), // Point 355
            CLLocationCoordinate2D(latitude: 38.938576, longitude: -76.468758),
            CLLocationCoordinate2D(latitude: 38.938576, longitude: -76.468750),
            CLLocationCoordinate2D(latitude: 38.938587, longitude: -76.468742),
            //CLLocationCoordinate2D(latitude: 38.938595, longitude: -76.468742),
            //CLLocationCoordinate2D(latitude: 38.938595, longitude: -76.468742), // Point 360
            CLLocationCoordinate2D(latitude: 38.938602, longitude: -76.468742),
            CLLocationCoordinate2D(latitude: 38.938618, longitude: -76.468735),
            //CLLocationCoordinate2D(latitude: 38.938614, longitude: -76.468735),
            //CLLocationCoordinate2D(latitude: 38.938629, longitude: -76.468735),
            //CLLocationCoordinate2D(latitude: 38.938641, longitude: -76.468735), // Point 365
            //CLLocationCoordinate2D(latitude: 38.938644, longitude: -76.468735),
            CLLocationCoordinate2D(latitude: 38.938648, longitude: -76.468735),
            CLLocationCoordinate2D(latitude: 38.938648, longitude: -76.468727),
            CLLocationCoordinate2D(latitude: 38.938652, longitude: -76.468727),
            //CLLocationCoordinate2D(latitude: 38.938652, longitude: -76.468727), // Point 370
            CLLocationCoordinate2D(latitude: 38.938663, longitude: -76.468735),
            CLLocationCoordinate2D(latitude: 38.938683, longitude: -76.468758),
            CLLocationCoordinate2D(latitude: 38.938686, longitude: -76.468765),
            CLLocationCoordinate2D(latitude: 38.938698, longitude: -76.468750),
            CLLocationCoordinate2D(latitude: 38.938713, longitude: -76.468719), // Point 375
            CLLocationCoordinate2D(latitude: 38.938721, longitude: -76.468712),
            CLLocationCoordinate2D(latitude: 38.938728, longitude: -76.468719),
            CLLocationCoordinate2D(latitude: 38.938736, longitude: -76.468712),
            CLLocationCoordinate2D(latitude: 38.938744, longitude: -76.468704),
            CLLocationCoordinate2D(latitude: 38.938747, longitude: -76.468719), // Point 380
            CLLocationCoordinate2D(latitude: 38.938751, longitude: -76.468712),
            CLLocationCoordinate2D(latitude: 38.938778, longitude: -76.468735)
            //CLLocationCoordinate2D(latitude: 38.938778, longitude: -76.468735)
            //CLLocationCoordinate2D(latitude: 38.938778, longitude: -76.468735)
        ]
        
        let HulltoWainwrightCutThroughTrailLocations = [
            CLLocationCoordinate2D(latitude: 38.937550, longitude: -76.462051),
            CLLocationCoordinate2D(latitude: 38.937546, longitude: -76.462051),
            CLLocationCoordinate2D(latitude: 38.937588, longitude: -76.462090),
            CLLocationCoordinate2D(latitude: 38.937572, longitude: -76.462090),
            CLLocationCoordinate2D(latitude: 38.937565, longitude: -76.462082), // Point 5
            CLLocationCoordinate2D(latitude: 38.937565, longitude: -76.462082),
            CLLocationCoordinate2D(latitude: 38.937561, longitude: -76.462090),
            CLLocationCoordinate2D(latitude: 38.937557, longitude: -76.462090),
            CLLocationCoordinate2D(latitude: 38.937553, longitude: -76.462082),
            CLLocationCoordinate2D(latitude: 38.937542, longitude: -76.462105), // Point 10
            CLLocationCoordinate2D(latitude: 38.937527, longitude: -76.462135),
            CLLocationCoordinate2D(latitude: 38.937500, longitude: -76.462151),
            CLLocationCoordinate2D(latitude: 38.937481, longitude: -76.462181),
            CLLocationCoordinate2D(latitude: 38.937489, longitude: -76.462234),
            CLLocationCoordinate2D(latitude: 38.937450, longitude: -76.462234), // Point 15
            CLLocationCoordinate2D(latitude: 38.937450, longitude: -76.462257),
            CLLocationCoordinate2D(latitude: 38.937450, longitude: -76.462303),
            CLLocationCoordinate2D(latitude: 38.937447, longitude: -76.462318),
            CLLocationCoordinate2D(latitude: 38.937435, longitude: -76.462326),
            CLLocationCoordinate2D(latitude: 38.937450, longitude: -76.462334), // Point 20
            CLLocationCoordinate2D(latitude: 38.937447, longitude: -76.462341),
            CLLocationCoordinate2D(latitude: 38.937443, longitude: -76.462349),
            CLLocationCoordinate2D(latitude: 38.937443, longitude: -76.462357),
            CLLocationCoordinate2D(latitude: 38.937450, longitude: -76.462341),
            CLLocationCoordinate2D(latitude: 38.937447, longitude: -76.462341), // Point 25
            CLLocationCoordinate2D(latitude: 38.937435, longitude: -76.462341),
            CLLocationCoordinate2D(latitude: 38.937428, longitude: -76.462349),
            CLLocationCoordinate2D(latitude: 38.937428, longitude: -76.462357),
            CLLocationCoordinate2D(latitude: 38.937428, longitude: -76.462357), // Point 30
            CLLocationCoordinate2D(latitude: 38.937435, longitude: -76.462372),
            CLLocationCoordinate2D(latitude: 38.937424, longitude: -76.462395),
            CLLocationCoordinate2D(latitude: 38.937420, longitude: -76.462395),
            CLLocationCoordinate2D(latitude: 38.937420, longitude: -76.462402), // Point 35
            CLLocationCoordinate2D(latitude: 38.937416, longitude: -76.462402),
            CLLocationCoordinate2D(latitude: 38.937408, longitude: -76.462418), // Point 40
            CLLocationCoordinate2D(latitude: 38.937393, longitude: -76.462440),
            CLLocationCoordinate2D(latitude: 38.937378, longitude: -76.462456),
            CLLocationCoordinate2D(latitude: 38.937370, longitude: -76.462471), // Point 45
            CLLocationCoordinate2D(latitude: 38.937351, longitude: -76.462471),
            CLLocationCoordinate2D(latitude: 38.937351, longitude: -76.462479),
            CLLocationCoordinate2D(latitude: 38.937347, longitude: -76.462479), // Point 50
            CLLocationCoordinate2D(latitude: 38.937344, longitude: -76.462479),
            CLLocationCoordinate2D(latitude: 38.937344, longitude: -76.462486), // Point 55
            CLLocationCoordinate2D(latitude: 38.937321, longitude: -76.462517),
            CLLocationCoordinate2D(latitude: 38.937317, longitude: -76.462540),
            CLLocationCoordinate2D(latitude: 38.937317, longitude: -76.462547),
            CLLocationCoordinate2D(latitude: 38.937317, longitude: -76.462555),
            CLLocationCoordinate2D(latitude: 38.937313, longitude: -76.462555), // Point 60
            CLLocationCoordinate2D(latitude: 38.937309, longitude: -76.462555),
            CLLocationCoordinate2D(latitude: 38.937305, longitude: -76.462563),
            CLLocationCoordinate2D(latitude: 38.937302, longitude: -76.462563), // Point 65
            CLLocationCoordinate2D(latitude: 38.937298, longitude: -76.462570),
            CLLocationCoordinate2D(latitude: 38.937260, longitude: -76.462608),
            CLLocationCoordinate2D(latitude: 38.937244, longitude: -76.462608),
            CLLocationCoordinate2D(latitude: 38.937222, longitude: -76.462608),
            CLLocationCoordinate2D(latitude: 38.937214, longitude: -76.462608), // Point 70
            CLLocationCoordinate2D(latitude: 38.937206, longitude: -76.462608),
            CLLocationCoordinate2D(latitude: 38.937195, longitude: -76.462608),
            CLLocationCoordinate2D(latitude: 38.937187, longitude: -76.462616),
            CLLocationCoordinate2D(latitude: 38.937180, longitude: -76.462624), // Point 75
            CLLocationCoordinate2D(latitude: 38.937168, longitude: -76.462631),
            CLLocationCoordinate2D(latitude: 38.937160, longitude: -76.462639),
            CLLocationCoordinate2D(latitude: 38.937149, longitude: -76.462646),
            CLLocationCoordinate2D(latitude: 38.937145, longitude: -76.462654),
            CLLocationCoordinate2D(latitude: 38.937141, longitude: -76.462662),
            CLLocationCoordinate2D(latitude: 38.937138, longitude: -76.462669),
            CLLocationCoordinate2D(latitude: 38.937134, longitude: -76.462669),
            CLLocationCoordinate2D(latitude: 38.937115, longitude: -76.462685),
            CLLocationCoordinate2D(latitude: 38.937084, longitude: -76.462692), // Point 85
            CLLocationCoordinate2D(latitude: 38.937092, longitude: -76.462715),
            CLLocationCoordinate2D(latitude: 38.937084, longitude: -76.462730),
            CLLocationCoordinate2D(latitude: 38.937073, longitude: -76.462723),
            CLLocationCoordinate2D(latitude: 38.937069, longitude: -76.462730),
            CLLocationCoordinate2D(latitude: 38.937065, longitude: -76.462730),
            CLLocationCoordinate2D(latitude: 38.937054, longitude: -76.462738),
            CLLocationCoordinate2D(latitude: 38.937050, longitude: -76.462746),
            CLLocationCoordinate2D(latitude: 38.937046, longitude: -76.462753),
            CLLocationCoordinate2D(latitude: 38.937042, longitude: -76.462761), // Point 95
            CLLocationCoordinate2D(latitude: 38.937042, longitude: -76.462769),
            CLLocationCoordinate2D(latitude: 38.937023, longitude: -76.462791),
            CLLocationCoordinate2D(latitude: 38.937023, longitude: -76.462799),
            CLLocationCoordinate2D(latitude: 38.936985, longitude: -76.462845), // Point 100
            CLLocationCoordinate2D(latitude: 38.936981, longitude: -76.462852),
            CLLocationCoordinate2D(latitude: 38.936977, longitude: -76.462860),
            CLLocationCoordinate2D(latitude: 38.936970, longitude: -76.462860),
            CLLocationCoordinate2D(latitude: 38.936966, longitude: -76.462868), // Point 105
            CLLocationCoordinate2D(latitude: 38.936958, longitude: -76.462875),
            CLLocationCoordinate2D(latitude: 38.936947, longitude: -76.462875),
            CLLocationCoordinate2D(latitude: 38.936935, longitude: -76.462891),
            CLLocationCoordinate2D(latitude: 38.936932, longitude: -76.462891),
            CLLocationCoordinate2D(latitude: 38.936932, longitude: -76.462898), // Point 110
            CLLocationCoordinate2D(latitude: 38.936924, longitude: -76.462914),
            CLLocationCoordinate2D(latitude: 38.936905, longitude: -76.462975),
            CLLocationCoordinate2D(latitude: 38.936901, longitude: -76.462975),
            CLLocationCoordinate2D(latitude: 38.936905, longitude: -76.463020),
            CLLocationCoordinate2D(latitude: 38.936886, longitude: -76.463066), // Point 115
            CLLocationCoordinate2D(latitude: 38.936871, longitude: -76.463089),
            CLLocationCoordinate2D(latitude: 38.936859, longitude: -76.463097),
            CLLocationCoordinate2D(latitude: 38.936836, longitude: -76.463181)
        ]
        
        let SteamEngineLocations = [
            //CLLocationCoordinate2D(latitude: 38.937088, longitude: -76.467758), // Possibly an inaccurate point
            CLLocationCoordinate2D(latitude: 38.936893, longitude: -76.467590),
            //CLLocationCoordinate2D(latitude: 38.936893, longitude: -76.467583),
            CLLocationCoordinate2D(latitude: 38.936893, longitude: -76.467567),
            CLLocationCoordinate2D(latitude: 38.936928, longitude: -76.467552), // Point 5
            CLLocationCoordinate2D(latitude: 38.936966, longitude: -76.467476),
            CLLocationCoordinate2D(latitude: 38.936970, longitude: -76.467453),
            CLLocationCoordinate2D(latitude: 38.937008, longitude: -76.467438),
            CLLocationCoordinate2D(latitude: 38.937031, longitude: -76.467430),
            CLLocationCoordinate2D(latitude: 38.937035, longitude: -76.467407), // Point 10
            CLLocationCoordinate2D(latitude: 38.937061, longitude: -76.467346),
            CLLocationCoordinate2D(latitude: 38.937065, longitude: -76.467323),
            CLLocationCoordinate2D(latitude: 38.937069, longitude: -76.467331),
            CLLocationCoordinate2D(latitude: 38.937073, longitude: -76.467323),
            CLLocationCoordinate2D(latitude: 38.937092, longitude: -76.467331), // Point 15
            CLLocationCoordinate2D(latitude: 38.937099, longitude: -76.467339),
            CLLocationCoordinate2D(latitude: 38.937107, longitude: -76.467339),
            CLLocationCoordinate2D(latitude: 38.937122, longitude: -76.467354),
            CLLocationCoordinate2D(latitude: 38.937134, longitude: -76.467361),
            CLLocationCoordinate2D(latitude: 38.937138, longitude: -76.467361), // Point 20
            CLLocationCoordinate2D(latitude: 38.937157, longitude: -76.467361),
            CLLocationCoordinate2D(latitude: 38.937180, longitude: -76.467369),
            CLLocationCoordinate2D(latitude: 38.937191, longitude: -76.467377),
            CLLocationCoordinate2D(latitude: 38.937206, longitude: -76.467384),
            CLLocationCoordinate2D(latitude: 38.937233, longitude: -76.467415), // Point 25
            //CLLocationCoordinate2D(latitude: 38.937233, longitude: -76.467415),
            CLLocationCoordinate2D(latitude: 38.937233, longitude: -76.467422),
            CLLocationCoordinate2D(latitude: 38.937271, longitude: -76.467453),
            //CLLocationCoordinate2D(latitude: 38.937271, longitude: -76.467453),
            CLLocationCoordinate2D(latitude: 38.937271, longitude: -76.467461), // Point 30
            CLLocationCoordinate2D(latitude: 38.937271, longitude: -76.467468),
            CLLocationCoordinate2D(latitude: 38.937286, longitude: -76.467484),
            CLLocationCoordinate2D(latitude: 38.937309, longitude: -76.467476),
            CLLocationCoordinate2D(latitude: 38.937332, longitude: -76.467468),
            CLLocationCoordinate2D(latitude: 38.937386, longitude: -76.467499), // Point 35
            CLLocationCoordinate2D(latitude: 38.937405, longitude: -76.467506),
            CLLocationCoordinate2D(latitude: 38.937428, longitude: -76.467484),
            CLLocationCoordinate2D(latitude: 38.937450, longitude: -76.467461),
            CLLocationCoordinate2D(latitude: 38.937523, longitude: -76.467491),
            CLLocationCoordinate2D(latitude: 38.937534, longitude: -76.467468), // Point 40
            CLLocationCoordinate2D(latitude: 38.937538, longitude: -76.467461),
            CLLocationCoordinate2D(latitude: 38.937550, longitude: -76.467438),
            CLLocationCoordinate2D(latitude: 38.937565, longitude: -76.467377),
            CLLocationCoordinate2D(latitude: 38.937599, longitude: -76.467323),
            CLLocationCoordinate2D(latitude: 38.937603, longitude: -76.467300), // Point 45
            CLLocationCoordinate2D(latitude: 38.937668, longitude: -76.467247),
            CLLocationCoordinate2D(latitude: 38.937672, longitude: -76.467232),
            CLLocationCoordinate2D(latitude: 38.937691, longitude: -76.467209),
            CLLocationCoordinate2D(latitude: 38.937737, longitude: -76.467117),
            CLLocationCoordinate2D(latitude: 38.937752, longitude: -76.467087), // Point 50
            CLLocationCoordinate2D(latitude: 38.937771, longitude: -76.467079),
            CLLocationCoordinate2D(latitude: 38.937794, longitude: -76.467056),
            CLLocationCoordinate2D(latitude: 38.937828, longitude: -76.467010),
            CLLocationCoordinate2D(latitude: 38.937832, longitude: -76.466988),
            CLLocationCoordinate2D(latitude: 38.937843, longitude: -76.466965), // Point 55
            CLLocationCoordinate2D(latitude: 38.937859, longitude: -76.466919),
            CLLocationCoordinate2D(latitude: 38.937862, longitude: -76.466881),
            CLLocationCoordinate2D(latitude: 38.937889, longitude: -76.466843),
            CLLocationCoordinate2D(latitude: 38.937904, longitude: -76.466835),
            CLLocationCoordinate2D(latitude: 38.937920, longitude: -76.466835), // Point 60
            CLLocationCoordinate2D(latitude: 38.937931, longitude: -76.466843),
            CLLocationCoordinate2D(latitude: 38.937920, longitude: -76.466843),
            CLLocationCoordinate2D(latitude: 38.937931, longitude: -76.466843),
        ]
        
        let BGERightOfWayCoordinates = [
            CLLocationCoordinate2D(latitude: 38.939978, longitude: -76.461958),
            CLLocationCoordinate2D(latitude: 38.938339, longitude: -76.462283)
        ]
        
        switch buttonPressed {
        case 0:
            let polyLine = MKPolyline(coordinates: PondViewTrailLocations, count: PondViewTrailLocations.count)
            mapView.addOverlay(polyLine)
            let polyLine1 = MKPolyline(coordinates: WalnutDriveTrailLocations, count: WalnutDriveTrailLocations.count)
            mapView.addOverlay(polyLine1)
            let polyLine2 = MKPolyline(coordinates: KassParkToFarmhouseTrailLocations, count: KassParkToFarmhouseTrailLocations.count)
            mapView.addOverlay(polyLine2)
            let polyLine21 = MKPolyline(coordinates: FarmhousetoDeerExclosureCoordinates, count: FarmhousetoDeerExclosureCoordinates.count)
            mapView.addOverlay(polyLine21)
            let polyLine22 = MKPolyline(coordinates: FarraguttoFarmhouseTrail, count: FarraguttoFarmhouseTrail.count)
            mapView.addOverlay(polyLine22)
            let polyLine31 = MKPolyline(coordinates: InspirationTrailLocations, count: InspirationTrailLocations.count)
            mapView.addOverlay(polyLine31)
            let polyLine32 = MKPolyline(coordinates: InspirationTrailLocations2, count: InspirationTrailLocations2.count)
            mapView.addOverlay(polyLine32)
            let polyLine4 = MKPolyline(coordinates: FishermanTrailLocations, count: FishermanTrailLocations.count)
            mapView.addOverlay(polyLine4)
            let polyLine5 = MKPolyline(coordinates: HulltoWainwrightCutThroughTrailLocations, count: HulltoWainwrightCutThroughTrailLocations.count)
            mapView.addOverlay(polyLine5)
            let polyLine6 = MKPolyline(coordinates: SteamEngineLocations, count: SteamEngineLocations.count)
            mapView.addOverlay(polyLine6)
            let polyLine7 = MKPolyline(coordinates: BGERightOfWayCoordinates, count: BGERightOfWayCoordinates.count)
            mapView.addOverlay(polyLine7)
        case 1:
            let polyLine = MKPolyline(coordinates: PondViewTrailLocations, count: PondViewTrailLocations.count)
            mapView.addOverlay(polyLine)
        case 2:
            let polyLine = MKPolyline(coordinates: WalnutDriveTrailLocations, count: WalnutDriveTrailLocations.count)
            mapView.addOverlay(polyLine)
        case 3:
            let polyLine = MKPolyline(coordinates: KassParkToFarmhouseTrailLocations, count: KassParkToFarmhouseTrailLocations.count)
            mapView.addOverlay(polyLine)
            let polyLine1 = MKPolyline(coordinates: FarraguttoFarmhouseTrail, count: FarraguttoFarmhouseTrail.count)
            mapView.addOverlay(polyLine1)
        case 4:
            let polyLine = MKPolyline(coordinates: InspirationTrailLocations, count: InspirationTrailLocations.count)
            mapView.addOverlay(polyLine)
            let polyLine1 = MKPolyline(coordinates: InspirationTrailLocations2, count: InspirationTrailLocations2.count)
            mapView.addOverlay(polyLine1)
        case 5:
            let polyLine = MKPolyline(coordinates: FishermanTrailLocations, count: FishermanTrailLocations.count)
            mapView.addOverlay(polyLine)
        case 6:
            let polyLine = MKPolyline(coordinates: HulltoWainwrightCutThroughTrailLocations, count: HulltoWainwrightCutThroughTrailLocations.count)
            mapView.addOverlay(polyLine)
        case 7:
            let polyLine = MKPolyline(coordinates: SteamEngineLocations, count: SteamEngineLocations.count)
            mapView.addOverlay(polyLine)
        case 8:
            let polyLine = MKPolyline(coordinates: FarmhousetoDeerExclosureCoordinates, count: FarmhousetoDeerExclosureCoordinates.count)
            mapView.addOverlay(polyLine)
        default: break
        }
    }

    func addAnnotations() {
//        let QRCodeLocations = [
//            CLLocationCoordinate2D(latitude: 38.939694, longitude: -76.462972), // Trailhead at ball field
//            CLLocationCoordinate2D(latitude: 38.938583, longitude: -76.464139), // Vine management example
//            CLLocationCoordinate2D(latitude: 38.940111, longitude: -76.465278), // Farmstead
//            CLLocationCoordinate2D(latitude: 38.940333, longitude: -76.464528), // Deer Exclosure near Farm Hill
//            CLLocationCoordinate2D(latitude: 38.938889, longitude: -76.451667), // Trailhead, Fisherman Trail
//            CLLocationCoordinate2D(latitude: 38.938139, longitude: -76.450333), // Trailhead, Steam Engine Trail
//            CLLocationCoordinate2D(latitude: 38.937444, longitude: -76.451028), // Steam Engine photoshopped on to Rail Line Remnant in Woods, taken from camera perspective point:
//            CLLocationCoordinate2D(latitude: 38.937194, longitude: -76.466278), // Hollow tree near Herndon Ave
//            CLLocationCoordinate2D(latitude: 38.936500, longitude: -76.465111), // Trailhead, Walnut Drive
//            CLLocationCoordinate2D(latitude: 38.936417, longitude: -76.464806), // Trailhead on Herndon Ave., Pond View Path
//            CLLocationCoordinate2D(latitude: 38.935917, longitude: -76.464472), // Trailhead on Herndon Ave., To Inspiration Point
//            CLLocationCoordinate2D(latitude: 38.935917, longitude: -76.464472), // Trailhead on Hull Ave., Pond view Path
//            CLLocationCoordinate2D(latitude: 38.937694, longitude: -76.462194), // Trailhead on Wainwright Ave. Little Cut Trail
//            CLLocationCoordinate2D(latitude: 38.936861, longitude: -76.463306), // Trailhead on Hull Ave., Little Cut Trail
//            CLLocationCoordinate2D(latitude: 38.937056, longitude: -76.463111) // Hollow Tree just off Little Cut Trail with evidence of humanoid activity
//        ]
//        let QRCodeNames = [
//            "Trailhead", "Vine Management", "Farmstead", "Deer Exclosure", "Trail Head", "Trail Head", "Steam Engine", "Hollow Tree", "Trail Head", "Trail Head", "Trail Head", "Trail Head", "Trail Head", "Trail Head", "Hollow Tree"
//        ]

//        for index in (0...14) {
//            let QRCodeLocation = MKPointAnnotation()
//                    QRCodeLocation.title = QRCodeNames[index]
//                    QRCodeLocation.coordinate = QRCodeLocations[index]
//                    mapView.addAnnotation(QRCodeLocation)
//        }
        
        let AllTrailLabels = [
            CLLocationCoordinate2D(latitude: 38.936401, longitude: -76.464851), // Pond View
            CLLocationCoordinate2D(latitude: 38.937378, longitude: -76.469925), // Walnut Drive
            CLLocationCoordinate2D(latitude: 38.939617, longitude: -76.462967), // Kass Park
            CLLocationCoordinate2D(latitude: 38.934784, longitude: -76.466255), // Inspiration Point
            CLLocationCoordinate2D(latitude: 38.936329, longitude: -76.470055), // Fisherman
            CLLocationCoordinate2D(latitude: 38.937550, longitude: -76.462051), // HulltoWainwright
            CLLocationCoordinate2D(latitude: 38.937088, longitude: -76.467758), // Steam Engine
            CLLocationCoordinate2D(latitude: 38.938339, longitude: -76.462283), // BGE Right of Way
            CLLocationCoordinate2D(latitude: 38.940155, longitude: -76.464661) // Farmhouse to Deer Exclosure
        ]
        let labels = [
            "Pond View Trail", "Walnut Drive Trail", "Kass Park-to-Farmhouse Trail", "Inspiration Point Trail", "Fisherman Trail", "Hull-to-Wainwright Cut-through Trail", "Steam Engine Trail", "BGE Right of Way", "Farmhouse to Deer Exclosure Trail"
        ]
        for index in (0...8) {
            let pinLocation = MKPointAnnotation()
                    pinLocation.title = labels[index]
                    pinLocation.coordinate = AllTrailLabels[index]
                    mapView.addAnnotation(pinLocation)
            }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor.yellow
            renderer.lineWidth = 5
            
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }

    @IBAction func didTapCenter(_ Location: CLLocation, _ sender: Any) {
        mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
        
    }
    
    @IBAction func didTapTrail(_ sender: UIButton) {
        switch buttonPressed {
        case 0: // All
            let center = CLLocationCoordinate2D(latitude: 38.936543, longitude: -76.466133) // Point 55 of Walnut Drive
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: center, span: span)
            mapView.setRegion(region, animated: true)
        case 1:
            let center = CLLocationCoordinate2D(latitude: 38.936535, longitude: -76.464058)
            let span = MKCoordinateSpan(latitudeDelta: 0.0018, longitudeDelta: 0.0018)
            let region = MKCoordinateRegion(center: center, span: span)
            mapView.setRegion(region, animated: true)
        case 2:
            let center = CLLocationCoordinate2D(latitude: 38.936852, longitude: -76.467552) // Point 30
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let region = MKCoordinateRegion(center: center, span: span)
            mapView.setRegion(region, animated: true)
        case 3:
            let center = CLLocationCoordinate2D(latitude: 38.939701, longitude: -76.464264)
            let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
            let region = MKCoordinateRegion(center: center, span: span)
            mapView.setRegion(region, animated: true)
        case 4:
            let center = CLLocationCoordinate2D(latitude: 38.934307, longitude: -76.464881)
            let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
            let region = MKCoordinateRegion(center: center, span: span)
            mapView.setRegion(region, animated: true)
        case 5:
            let center = CLLocationCoordinate2D(latitude: 38.937792, longitude: -76.469562)
            let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
            let region = MKCoordinateRegion(center: center, span: span)
            mapView.setRegion(region, animated: true)
        case 6:
            let center = CLLocationCoordinate2D(latitude: 38.937313, longitude: -76.462555)
            let span = MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015)
            let region = MKCoordinateRegion(center: center, span: span)
            mapView.setRegion(region, animated: true)
        case 7:
            let center = CLLocationCoordinate2D(latitude: 38.937531, longitude: -76.467221)
            let span = MKCoordinateSpan(latitudeDelta: 0.0012, longitudeDelta: 0.0012)
            let region = MKCoordinateRegion(center: center, span: span)
            mapView.setRegion(region, animated: true)
        case 8:
            let center = CLLocationCoordinate2D(latitude: 38.940002, longitude: -76.464996)
            let span = MKCoordinateSpan(latitudeDelta: 0.0009, longitudeDelta: 0.0009)
            let region = MKCoordinateRegion(center: center, span: span)
            mapView.setRegion(region, animated: true)
        default: break
        }
        
    }
    
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            mapView.mapType = .standard
        } else {
            mapView.mapType = .satellite
        }
    }
    
}
