//
//  ViewController.swift
//  LocationChallenge
//
//  Created by Pietro Russo on 29/03/17.
//  Copyright © 2017 Pietro Russo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    var lastLocation: Bool=false
    
    @IBAction func showUserLocation(_ sender: AnyObject) {
        map.showsUserLocation = !map.isUserLocationVisible
    }
    
    @IBAction func requestUserAuthorization(_ sender: AnyObject) {
        locationManager.requestWhenInUseAuthorization()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        map.showsUserLocation = true
        map.showsCompass = true
        map.showsScale = true
        map.delegate = self
        
    }
    
    
    
    override func loadView() {
        super.loadView()
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        map.addSubview(segmentedControl)
        segmentedControl.addTarget(self, action: #selector(MapController.mapTypeChanged(segmentedControl:)), for: .valueChanged)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 45)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        
    }
    
    func mapTypeChanged(segmentedControl: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            map.mapType = .standard
        case 1:
            map.mapType = .hybrid
        default:
            map.mapType = .satellite
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        requestLocationInUse()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.stopUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let locationManager = CLLocationManager()
    
    func requestLocationInUse(){
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted, .denied:
            self.openAlertToSettings(title:"Locazione non attiva!", description:"Per attivare andare su Impostazioni")
            break
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
            break
        }
        
    }
    
    private func openAlertToSettings(title:String, description:String){
        let alertController = UIAlertController(title: title, message:description, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title:"Cancella", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        let openAction = UIAlertAction(title:"Apri", style: .default){
            (action) in
            if let url = URL(string:UIApplicationOpenSettingsURLString){
                UIApplication.shared.open(url)
            }
        }
        alertController.addAction(openAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined: print("Not determined")
        case .restricted: print("Restricted")
        case .denied: print("Denied")
        case .authorizedWhenInUse: print("Authorized when in use")
        case .authorizedAlways: print("Authorized always")
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if(!lastLocation){
            userPosition(location: locations.last!)
            lastLocation=true
        }
        
        
        var place:CLPlacemark!
        
        //ciclofor
        CLGeocoder().geocodeAddressString("Fisciano", completionHandler: {(placemarks,error) in
            if(error==nil){
                place=placemarks![0]
                let puntoCercato = MKPointAnnotation()
                puntoCercato.coordinate = place.location!.coordinate
                puntoCercato.title = place.locality
                puntoCercato.subtitle = "SA"
                self.map.addAnnotation(puntoCercato)
            }
        })
        
        CLGeocoder().geocodeAddressString("Baronissi", completionHandler: {(placemarks,error) in
            if(error==nil){
                place=placemarks![0]
                let puntoCercato = MKPointAnnotation()
                puntoCercato.coordinate = place.location!.coordinate
                puntoCercato.title = place.locality
                puntoCercato.subtitle = "SA"
                self.map.addAnnotation(puntoCercato)
            }
        })
        
        CLGeocoder().geocodeAddressString("Via giovanni paolo II fisciano", completionHandler: {(placemarks,error) in
            if(error==nil){
                place=placemarks![0]
                let puntoCercato = MKPointAnnotation()
                puntoCercato.coordinate = place.location!.coordinate
                puntoCercato.title = place.locality
                puntoCercato.subtitle = "SA"
                self.map.addAnnotation(puntoCercato)
            }
        })
    }
    
    
    func userPosition(location:CLLocation){
        var position=location
        var placemark: CLPlacemark!
        CLGeocoder().reverseGeocodeLocation(position,completionHandler: { (placemarks, error) in
            placemark = placemarks![0]
            self.map.setRegion(MKCoordinateRegionMake(CLLocationCoordinate2DMake (placemark.location!.coordinate.latitude, placemark.location!.coordinate.longitude), MKCoordinateSpanMake(0.2, 0.2)), animated: true)
        })
    }
    private func address(_ p:CLPlacemark)->String{
        var ret=""
        if let n = p.name, let t = p.thoroughfare, n.contains(t){
            ret = "\(n), "
        }
        if let t = p.thoroughfare{
            if let st = p.subThoroughfare{
                ret = "\(ret)\(st)"
            }
            ret = "\(ret)\(t), "
        }
        if let c = p.country {
            if let aa = p.administrativeArea {
                if let l = p.locality {
                    ret = "\(ret)\(l)"
                }
                ret = "\(ret)\(aa), "
            }
            ret = "\(ret)\(c)"
        }
        if let pc = p.postalCode {
            ret = "\(ret) - \(pc)"
        }
        return ret
    }
    
}

