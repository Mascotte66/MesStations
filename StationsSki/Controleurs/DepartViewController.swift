//
//  DepartViewController.swift
//  StationsSki
//
//  Created by Jean-Marc on 24/02/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import UIKit

class DepartViewController: UIViewController {
    
    var lesStations: [Station] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        
        DispatchQueue.main.async {
            APIHelper().getSnowReport() { (donnees, errorString) in
                if errorString != nil {
                    print(errorString!)
                }
                if donnees != nil {
                    self.lesStations.append(Station(favorite: true, pays: donnees!.resortcountry, nom: donnees!.resortname, id: donnees!.resortid, pctopen: donnees!.pctopen, lastsnow: donnees!.lastsnow, newsnow: donnees!.newsnow_cm, uppersnow: donnees!.uppersnow_cm, lowersnow: donnees!.lowersnow_cm, conditions: donnees!.conditions))
                }
            }
        }
        
        lesStations.append(Station(favorite: false, pays: "France", nom: "Les Angles", id: 54883735, pctopen: 90, lastsnow: "10/02/2019", newsnow: 0, uppersnow: 80, lowersnow: 20, conditions: "Neige printemps"))
        lesStations.append(Station(favorite: false, pays: "France", nom: "La Mongie", id: 333025, pctopen: 80, lastsnow: "28/02/2019", newsnow: 25, uppersnow: 120, lowersnow: 80, conditions: "Neige fraiche"))
        lesStations.append(Station(favorite: false, pays: "France", nom: "Fon Romeu", id: 54883703, pctopen: 85, lastsnow: "10/02/2019", newsnow: 0, uppersnow: 70, lowersnow: 20, conditions: "Neige printemps"))
        lesStations.append(Station(favorite: false, pays: "France", nom: "Avoriaz", id: 333002, pctopen: 100, lastsnow: "25/02/2019", newsnow: 40, uppersnow: 220, lowersnow: 150, conditions: "Neige fraiche"))
        lesStations.append(Station(favorite: false, pays: "Spain", nom: "Baqueria Beret", id: 54883400, pctopen: 95, lastsnow: "26/02/2019", newsnow: 20, uppersnow:200, lowersnow: 160, conditions: "Neige fraiche"))
        lesStations.append(Station(favorite: false, pays: "Switzland", nom: "Verbier", id: 13034, pctopen: 75, lastsnow: "15/02/2019", newsnow: 0, uppersnow: 240, lowersnow:170, conditions: "Neige dure"))
        lesStations.append(Station(favorite: false, pays: "Canada", nom: "Sun Peaks", id: 604042, pctopen: 100, lastsnow: "27/02/2019", newsnow:40, uppersnow:260, lowersnow:200, conditions: "Poudreuse profonde"))
        lesStations.append(Station(favorite: false, pays: "USA ", nom: "Crystal Mountain", id: 604007, pctopen: 100, lastsnow: "26/02/2019", newsnow: 20, uppersnow:230, lowersnow: 150, conditions: "Neige fraiche"))
        
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "liste", let vc = segue.destination as? ListeController {
            vc.lesStations = (sender as? [Station])!
        }
    }
 
    @IBAction func favorite(_ sender: Any) {
        print("favorite")
    }
    
    @IBAction func liste(_ sender: Any) {
        print("Liste")
        performSegue(withIdentifier: "liste", sender: lesStations)
    }
   

}
