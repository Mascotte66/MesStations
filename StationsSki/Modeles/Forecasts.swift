//
//  Forecasts.swift
//  StationsSki
//
//  Created by Jean-Marc on 02/03/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import Foundation

class Forecasts {
    
    //analyse des records lus et formatage des tables
    
    var lesPrev: [Forecast]    
    
    init(forecasts: APIForecast) {
        
        nomS = forecasts.name
        lesPrev = forecasts.forecast
        
        let nbDates = forecasts.forecast.count
        print("nbDates: \(nbDates)")
        
        //calcul des indices deb et fin pour les graphes
        
        if lesPrev[0].time == "01:00" {indPrem = 0}
        if lesPrev[0].time == "04:00" {indPrem = 1}
        if lesPrev[0].time == "07:00" {indPrem = 2}
        if lesPrev[0].time == "10:00" {indPrem = 3}
        if lesPrev[0].time == "13:00" {indPrem = 4}
        if lesPrev[0].time == "16:00" {indPrem = 5}
        if lesPrev[0].time == "19:00" {indPrem = 6}
        if lesPrev[0].time == "22:00" {indPrem = 7}
        
        indDer = 47 - indPrem
        if indDer > nbDates - 1 {indDer = nbDates - 1}
        
        
        //chargement des tables
        
        for i in 0...indDer {
            
            if i < indPrem {
                lesDates.append("")
                nomIcone.append("")
                tempBas.append(0)
                tempHaut.append(0)
                neige.append(0)
                pluie.append(0)
                vent.append(0)
                rafales.append(0)
            } else {
                lesDates.append(lesPrev[i].date)
                nomIcone.append(lesPrev[i].upper.wx_icon)
                tempBas.append(lesPrev[i].base.temp_c!)
                tempHaut.append(lesPrev[i].upper.temp_c!)
                neige.append(lesPrev[i].snow_mm)
                pluie.append(lesPrev[i].rain_mm)
                vent.append(lesPrev[i].upper.windspd_kmh)
                rafales.append(lesPrev[i].upper.windgst_kmh ?? 0)
                
            }
        }
    }
}
