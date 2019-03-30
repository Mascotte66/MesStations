//
//  Forecasts.swift
//  StationsSki
//
//  Created by Jean-Marc on 02/03/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import Foundation

class Forecasts {
    
    //recherche sur web des forecasts de la station, et conversion au format PrevsFormattees
    
    private var task: URLSessionDataTask?
    
    //prour creer singleton de Forecasts
    
    static var shared = Forecasts()
    private init() {}
    
    var forecasts: APIForecast?    
   
    func lireForecasts(id: Int, callback: @escaping (Bool, PrevsFormattees?) -> Void) {
        
        let urlLesAngles = URL(string: "https://api.weatherunlocked.com/api/resortforecast/54883735?app_id=9a1bc4ca&app_key=157ca9c02a9f77ff1f68198ff3d53d55")
        let urlLesArcs = URL(string: "https://api.weatherunlocked.com/api/resortforecast/333011?app_id=974ff615&app_key=b71291b735c33f74b8bd97a4ffbbabb8")
        
        var urlForecasts: URL?
        
        if id == 33301 {urlForecasts = urlLesArcs}
        if id == 54883735 {urlForecasts = urlLesAngles}
        
        
        if let url = urlForecasts {
        
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                DispatchQueue.main.async {
                    if error != nil {
                        print(error!.localizedDescription)
                        callback(false, nil)
                        return
                    }
                    if data != nil {
                        do {
                            let responseJSON = try JSONDecoder().decode(APIForecast.self, from: data!)
                            self.forecasts = responseJSON
                            
                            //convertir les forecasts lues en format PrevsFormattees
                            
                            callback(true, self.convertirDonnees())
                            return
                        } catch {
                            print(error.localizedDescription)
                            callback(false, nil)
                            return
                        }
                    } else {
                        print("Pas de donnees disponibles")
                        callback(false, nil)
                        return
                    }
                }
                }.resume()
            
        } else {
            print("url invalide")
            callback(false, nil)
        }
        
    }
    
    func convertirDonnees()  -> PrevsFormattees {
        
        var lesPrev: [Forecast] = []    //format APIForecast
        
        var indPrem: Int = 0
        var indDer: Int = 0
        
        var lesDates: [String] = []
        var nomIcone: [String] = []
        var tempBas: [Double] = []
        var tempHaut: [Double] = []
        var neige: [Double] = []
        var pluie: [Double] = []
        var vent: [Double] = []
        var rafales: [Double] = []
        
        
        
       
            
            lesPrev = forecasts!.forecast
            
            let nbDates = lesPrev.count
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
            
            return PrevsFormattees(indPrem: indPrem, indDer: indDer, lesDates: lesDates, nomIcone: nomIcone, tempBas: tempBas, tempHaut: tempHaut, neige: neige, pluie: pluie, vent: vent, rafales: rafales)
        
       
    }
    
}
