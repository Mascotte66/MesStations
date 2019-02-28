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
 
    @IBOutlet weak var container: UIView!
  
    @IBOutlet weak var fav: UILabel!
    @IBOutlet weak var pays: UILabel!
    @IBOutlet weak var nom: UILabel!
    @IBOutlet weak var pctopen: UILabel!
    @IBOutlet weak var lastsnow: UILabel!
    @IBOutlet weak var newsnow: UILabel!
    @IBOutlet weak var uppersnow: UILabel!
    @IBOutlet weak var lowersnow: UILabel!
    @IBOutlet weak var conditions: UILabel!
    
    
    var station: Station? {
        
        didSet {
            if station != nil {
                if station!.favorite {
                    fav.text = "😄"
                } else {
                   fav.text = ""
                }
                container.layer.cornerRadius = 10
                pays.text = station!.pays
                nom.text = station!.nom
                pctopen.text = String(station!.pctopen)
                lastsnow.text = station!.lastsnow
                newsnow.text = String(station!.newsnow)
                uppersnow.text = String(station!.uppersnow)
                lowersnow.text = String(station!.lowersnow)
                conditions.text = station!.conditions
            }
        }
    }
}

