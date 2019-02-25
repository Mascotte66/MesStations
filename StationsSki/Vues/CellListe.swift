//
//  CellListe.swift
//  StationsSki
//
//  Created by Jean-Marc on 25/02/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import UIKit
import Foundation

class CellListe: UITableViewCell {    
 
    @IBOutlet weak var favorite: UIImageView!
    @IBOutlet weak var pays: UILabel!
    @IBOutlet weak var nom: UILabel!
    @IBOutlet weak var temps: UIImageView!
    @IBOutlet weak var temperatureHaut: UILabel!
    @IBOutlet weak var temperatureBas: UILabel!
    @IBOutlet weak var vent: UILabel!
    
    var station: Station? {
        
        didSet {
            if station != nil {
                if station!.favorite {
                    favorite.image = UIImage(named: "Ouverture")
                } else {
                    favorite.image = UIImage()
                }
                
                pays.text = station!.pays
                nom.text = station!.nom
                temps.image = UIImage(named: "Ouverture")
                temperatureHaut.text = "-10"
                temperatureBas.text = "04"
                vent.text = "20"
            }
        }
    }
}
