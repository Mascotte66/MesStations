//
//  DepartViewController.swift
//  StationsSki
//
//  Created by Jean-Marc on 24/02/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import UIKit

var lesStations: [Station] = []

class DepartViewController: UIViewController {
    
   
    var forecasts : APIForecast?
    
    //let lectWeb = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //chargement table des atations
        lesStations = TableStations().lesStations
        
        //recherche du snowreport des Arcs
        
        SnowReport.shared.getSnowReport { (report, erreur) in
            if erreur == nil {
                
                lesStations[1].pctopen = report!.pctopen
                lesStations[1].lastsnow = report!.lastsnow
                lesStations[1].newsnow = report!.newsnow_cm
                lesStations[1].uppersnow = report!.uppersnow_cm
                lesStations[1].lowersnow = report!.lowersnow_cm
                lesStations[1].conditions = report!.conditions
                
            }
        }        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "liste", let vc = segue.destination as? ListeController {
            //vc.lesStations = (sender as? [Station])!
        }
        
        if segue.identifier == "station", let vc = segue.destination as? StationController {
            vc.laStation = (sender as? Station)!
        }
    }
    
    @IBAction func favorite(_ sender: Any) {
        print("favorite")
        var ind = 999
        for i in 0...(lesStations.count - 1) {
            if lesStations[i].favorite == true {ind = i}
        }
        performSegue(withIdentifier: "station", sender: lesStations[ind])
    }
    
    @IBAction func liste(_ sender: Any) {
        print("Liste")
        performSegue(withIdentifier: "liste", sender: lesStations)
    }
    
}
