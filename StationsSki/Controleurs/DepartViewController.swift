//
//  DepartViewController.swift
//  StationsSki
//
//  Created by Jean-Marc on 24/02/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import UIKit

//variables globales!!!!!!
var id: Int = 0
var nomS = ""
var pctO: Int = 0
var neigeH: Double = 0
var neigeB: Double = 0
var dateDerC: String = ""
var hauteurDerC: Double = 0

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

class DepartViewController: UIViewController {    
    
    var lesStations: [Station] = []
    var forecasts : APIForecast?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //chargement table des atations
        
        lesStations.append(Station(favorite: false, pays: "France", nom: "Les Angles", id: 54883735, pctopen: 90, lastsnow: "10/02/2019", newsnow: 0, uppersnow: 80, lowersnow: 20, conditions: "Neige printemps"))
        lesStations.append(Station(favorite: false, pays: "France", nom: "La Mongie", id: 333025, pctopen: 80, lastsnow: "28/02/2019", newsnow: 25, uppersnow: 120, lowersnow: 80, conditions: "Neige fraiche"))
        lesStations.append(Station(favorite: false, pays: "France", nom: "Fon Romeu", id: 54883703, pctopen: 85, lastsnow: "10/02/2019", newsnow: 0, uppersnow: 70, lowersnow: 20, conditions: "Neige printemps"))
        lesStations.append(Station(favorite: false, pays: "France", nom: "Avoriaz", id: 333002, pctopen: 100, lastsnow: "25/02/2019", newsnow: 40, uppersnow: 220, lowersnow: 150, conditions: "Neige fraiche"))
        lesStations.append(Station(favorite: false, pays: "Spain", nom: "Baqueria Beret", id: 54883400, pctopen: 95, lastsnow: "26/02/2019", newsnow: 20, uppersnow:200, lowersnow: 160, conditions: "Neige fraiche"))
        lesStations.append(Station(favorite: false, pays: "Switzland", nom: "Verbier", id: 13034, pctopen: 75, lastsnow: "15/02/2019", newsnow: 0, uppersnow: 240, lowersnow:170, conditions: "Neige dure"))
        lesStations.append(Station(favorite: false, pays: "Canada", nom: "Sun Peaks", id: 604042, pctopen: 100, lastsnow: "27/02/2019", newsnow:40, uppersnow:260, lowersnow:200, conditions: "Poudreuse profonde"))
        lesStations.append(Station(favorite: false, pays: "USA ", nom: "Crystal Mountain", id: 604007, pctopen: 100, lastsnow: "26/02/2019", newsnow: 20, uppersnow:230, lowersnow: 150, conditions: "Neige fraiche"))
        
        //lecture du forecast de la station favorite
        
        if let url = URL(string: "https://api.weatherunlocked.com/api/resortforecast/54883735?app_id=9a1bc4ca&app_key=157ca9c02a9f77ff1f68198ff3d53d55") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
               
                if error != nil {
                    print(error!.localizedDescription)
                }
                if data != nil {
                    do {
                        let responseJSON = try JSONDecoder().decode(APIForecast.self, from: data!)
                        self.forecasts = responseJSON
                    } catch {
                        print(error.localizedDescription)
                        
                    }
                } else {
                    print("Pas de donnees disponibles")
                }
          
                }.resume()
            
        } else {
            print("url invalide")
        }
       
        //lecture du snow report de la station favorite (si elle existe)
        
        APIHelper().getSnowReport() { (donnees, errorString) in
            if errorString != nil {
                print(errorString!)
            }
            if donnees != nil {
                self.lesStations.append(Station(favorite: true, pays: donnees!.resortcountry, nom: donnees!.resortname, id: donnees!.resortid, pctopen: donnees!.pctopen, lastsnow: donnees!.lastsnow, newsnow: donnees!.newsnow_cm, uppersnow: donnees!.uppersnow_cm, lowersnow: donnees!.lowersnow_cm, conditions: donnees!.conditions))
                
                id = donnees!.resortid
                nomS = donnees!.resortname
                pctO = donnees!.pctopen
                neigeH = donnees!.uppersnow_cm
                neigeB = donnees!.lowersnow_cm
                dateDerC = donnees!.lastsnow
                hauteurDerC = donnees!.newsnow_cm
                
                //self.majParametres()
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "liste", let vc = segue.destination as? ListeController {
            vc.lesStations = (sender as? [Station])!
        }
        
        if segue.identifier == "station", let vc = segue.destination as? StationController {
            vc.forecasts = (sender as? APIForecast)!
        }
    }
    
    @IBAction func favorite(_ sender: Any) {
        print("favorite")
         performSegue(withIdentifier: "station", sender: forecasts)
    }
    
    @IBAction func liste(_ sender: Any) {
        print("Liste")
        performSegue(withIdentifier: "liste", sender: lesStations)
    }
   
}
