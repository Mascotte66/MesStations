//
//  Stations.swift
//  StationsSki
//
//  Created by Jean-Marc on 25/02/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//
import UIKit
import Foundation

class Station {
    
    var favorite: Bool
    var pays: String
    var nom: String
    var id: Int
    var pctopen: Int
    var lastsnow: String
    var newsnow: Double
    var uppersnow: Double
    var lowersnow: Double
    var conditions: String
    var latitude: Double
    var longitude: Double
    
    
    
    init(favorite: Bool, pays: String, nom: String, id: Int, pctopen: Int, lastsnow: String, newsnow: Double, uppersnow: Double, lowersnow: Double, conditions: String, latitude: Double, longitude: Double) {
        self.favorite = favorite
        self.pays = pays
        self.nom = nom
        self.id = id
        self.pctopen = pctopen
        self.lastsnow = lastsnow
        self.newsnow = newsnow
        self.uppersnow = uppersnow
        self.lowersnow = lowersnow
        self.conditions = conditions
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
