//
//  MonAnnotation.swift
//  StationsSki
//
//  Created by Jean-Marc on 11/03/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import UIKit
import MapKit

class MonAnnotation: NSObject, MKAnnotation {
    
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(coordonnees: CLLocationCoordinate2D, title: String) {
        self.coordinate = coordonnees
        self.title = title
    }
}

