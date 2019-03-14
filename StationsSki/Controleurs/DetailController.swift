//
//  DetailController.swift
//  StationsSki
//
//  Created by Jean-Marc on 14/03/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    @IBOutlet weak var maStation: UILabel!
    @IBOutlet weak var monTexte: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!    
    @IBOutlet weak var image4: UIImageView!
    
    var station: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        maStation.text = nomS
        monTexte.text = "Les Angles est une commune française située dans le département des Pyrénées-Orientales, en région Occitanie. Ses habitants sont appelés les Anglois, Anglesins ou Anglesencs.   \n     Superficie : 43,2 km²    \n    Population : 529 (2014) INSEE   \n     Heure locale : jeudi 12:28   \n     Météo : 4 °C, vent O à 16 km/h, 53 % d humidité"
        
        
        image1.image = UIImage(named: "image1")
        image2.image = UIImage(named: "image2")
        image3.image = UIImage(named: "image3")
        image4.image = UIImage(named: "image4")
        
    }
    

    
}
