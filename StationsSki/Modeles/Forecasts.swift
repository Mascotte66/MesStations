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
        
        indDer = 47
        if indDer > nbDates - 1 {indDer = nbDates - 1}
        
        
        //chargement des tables
        
        for i in 0...indDer {
            
            if i < indPrem {
                //lesDates.append("")
                nomIcone.append("")
                tempBas.append(0)
                tempHaut.append(0)
                neige.append(0)
                pluie.append(0)
                vent.append(0)
                rafales.append(0)
            } else {
                let j = i - indPrem
                nomIcone.append(lesPrev[j].upper.wx_icon)
                tempBas.append(lesPrev[j].base.temp_c!)
                tempHaut.append(lesPrev[j].upper.temp_c!)
                neige.append(lesPrev[j].snow_mm/10)
                pluie.append(lesPrev[j].rain_mm)
                vent.append(lesPrev[j].upper.windspd_kmh)
                rafales.append(lesPrev[j].base.windgst_kmh ?? 0)
            }
        }
        
        //cas des dates
        for i in 0...5 {
            lesDates.append(lesPrev[indPrem + (i * 8)].date)
        }
        print("lesDates:  \(lesDates)")
        
        
    }
}
