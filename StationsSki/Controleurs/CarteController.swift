//
//  CarteController.swift
//  StationsSki
//
//  Created by Jean-Marc on 08/03/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import UIKit
import MapKit

class CarteController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var nomStation: String = ""
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var userPosition : CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("carte nom station : \(nomStation)")
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        addAnnotations()
        
        //Deuxieme methode (voir MonAnnotationView)
        //on ajoute un observer de notification pour recuperer ce qu'envoie MonAnnotationView
        
        NotificationCenter.default.addObserver(self, selector: #selector(notifDetail), name: Notification.Name("detail"), object: nil)
        
        //Centrage de la carte
        
        setupMap(location: maPlace)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            if let maPosition = locations.last {
                userPosition = maPosition
            }
        }
    }
    
    func setupMap(location: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    @objc func notifDetail(notification: Notification ) {
        if let tit = notification.object as? String {
            print("Carte controller: je recoie une notification de titre : \(tit)")
            toDetail()
        }
    }
    
    func toDetail() {
        performSegue(withIdentifier: "detail", sender: nomS)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            if let controller = segue.destination as? DetailController {
                controller.station = sender as? String
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let monID = "reuseID"
        
        //ne pas traiter si c'est la position de l'utilisateur
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        if let anno = annotation as? MonAnnotation {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: monID)
            if annotationView == nil {
                
                annotationView = MonAnnotationView(controller: self, annotation: anno, reuseIdentifier: monID)
                              
                return annotationView
            } else {
                return annotationView
            }
        }
        return nil
    }
    
     let maPlace = CLLocationCoordinate2D(latitude: +42.57736590, longitude: +2.07401270)
    
    //Rigarda     (latitude: +42.62511770, longitude: +2.52934650)
    //Les Angles  (latitude: +42.57736590, longitude: +2.07401270)
    //Les Arcs    (latitude: +45.60312470, longitude: +6.77256470)
    
    func addAnnotations() {
        let annotation = MonAnnotation(coordonnees: maPlace, title: "Les Angles")
         mapView.addAnnotation(annotation)
    }

    @IBAction func segmentedControllTaped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: mapView.mapType  = MKMapType.standard  //on peut omettre MKMapType
        case 1: mapView.mapType = .satellite
        case 2: mapView.mapType = .hybrid
        default:
            return
        }
    }
    
    @IBAction func getPosition(_ sender: Any) {
        if userPosition != nil {
            setupMap(location: userPosition!.coordinate)
        }
    }
    
}


