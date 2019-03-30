//
//  TableStations.swift
//  StationsSki
//
//  Created by Suchier Jean-Marc on 19/03/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import Foundation

class TableStations {
    
    var lesStations: [Station] = []
    
    init() {
        
        lesStations.append(Station(favorite: false, pays: "France", nom: "Les Angles", id: 54883735, pctopen: 90, lastsnow: "10/02/2019", newsnow: 0, uppersnow: 80, lowersnow: 20, conditions: "Neige printemps", latitude: +42.57736590, longitude: +2.07401270))
         lesStations.append(Station(favorite: true, pays: "France", nom: "Les Arcs", id: 54883735, pctopen: 0, lastsnow: "00/00/0000", newsnow: 0, uppersnow: 0, lowersnow: 0, conditions: "     ", latitude: +45.60312470, longitude: +6.77256470))
        lesStations.append(Station(favorite: false, pays: "France", nom: "La Mongie", id: 333025, pctopen: 80, lastsnow: "28/02/2019", newsnow: 25, uppersnow: 120, lowersnow: 80, conditions: "Neige fraiche", latitude: +42.910, longitude: 0.1796))
        lesStations.append(Station(favorite: false, pays: "France", nom: "Fon Romeu", id: 54883703, pctopen: 85, lastsnow: "10/02/2019", newsnow: 0, uppersnow: 70, lowersnow: 20, conditions: "Neige printemps", latitude: 42.5056, longitude: 2.0417))
        lesStations.append(Station(favorite: false, pays: "France", nom: "Avoriaz", id: 333002, pctopen: 100, lastsnow: "25/02/2019", newsnow: 40, uppersnow: 220, lowersnow: 150, conditions: "Neige fraiche", latitude: 45.9348, longitude: 5.4738))
        lesStations.append(Station(favorite: false, pays: "Spain", nom: "Baqueria Beret", id: 54883400, pctopen: 95, lastsnow: "26/02/2019", newsnow: 20, uppersnow:200, lowersnow: 160, conditions: "Neige fraiche", latitude: 42.7000, longitude: 0.9333))
        lesStations.append(Station(favorite: false, pays: "Switzland", nom: "Verbier", id: 13034, pctopen: 75, lastsnow: "15/02/2019", newsnow: 0, uppersnow: 240, lowersnow:170, conditions: "Neige dure" , latitude: 42.268, longitude: 7.228))
        lesStations.append(Station(favorite: false, pays: "Canada", nom: "Sun Peaks", id: 604042, pctopen: 100, lastsnow: "27/02/2019", newsnow:40, uppersnow:260, lowersnow:200, conditions: "Poudreuse profonde" , latitude: 0, longitude: 0))
        lesStations.append(Station(favorite: false, pays: "USA ", nom: "Crystal Mountain", id: 604007, pctopen: 100, lastsnow: "26/02/2019", newsnow: 20, uppersnow:230, lowersnow: 150, conditions: "Neige fraiche", latitude: 0, longitude: 0))
    }
   
}
