//
//  DepartViewController.swift
//  StationsSki
//
//  Created by Jean-Marc on 24/02/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import UIKit
/*
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
*/
class DepartViewController: UIViewController {    
    
    var lesStations: [Station] = []
    var forecasts : APIForecast?
    
    //let lectWeb = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //chargement table des atations
        lesStations = TableStations().lesStations
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "liste", let vc = segue.destination as? ListeController {
            vc.lesStations = (sender as? [Station])!
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
