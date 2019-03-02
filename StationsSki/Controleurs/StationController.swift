//
//  StationController.swift
//  StationsSki
//
//  Created by Jean-Marc on 25/02/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import UIKit

class StationController: UIViewController {
    
    var res : APIForecast?
    
    @IBOutlet weak var nomStation: UILabel!
    @IBOutlet weak var pctOpen: UILabel!
    @IBOutlet weak var neigeHaut: UIView!
    @IBOutlet weak var neigeBas: UIView!
    @IBOutlet weak var dateDerChute: UILabel!
    @IBOutlet weak var hauteurDerChute: UILabel!
    
    @IBOutlet weak var icone1: UIImageView!
    @IBOutlet weak var icone2: UIImageView!
    @IBOutlet weak var icone3: UIImageView!
    @IBOutlet weak var icone4: UIImageView!
    @IBOutlet weak var icone5: UIImageView!
    @IBOutlet weak var icone6: UIImageView!
    @IBOutlet weak var icone7: UIImageView!
    @IBOutlet weak var icone8: UIImageView!
    @IBOutlet weak var icone9: UIImageView!
    @IBOutlet weak var icone10: UIImageView!
    @IBOutlet weak var icone11: UIImageView!
    @IBOutlet weak var icone12: UIImageView!
    
    @IBOutlet weak var veTemperatures: TemperatureController!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        
       
         print("Nb: \(res!.forecast.count)")
         print(res!.name)
         print("Time: \(res!.forecast[0].time)")
         print(res!.forecast[0].frzglvl_m)
         print(res!.forecast[0].base.wx_icon)
         print(res!.forecast[0].base.temp_c)
         print(res!.forecast[0].upper.wx_icon)
         print(res!.forecast[0].upper.temp_c)
         print("Time: \(res!.forecast[3].time)")
         print(res!.forecast[3].frzglvl_m)
         print(res!.forecast[3].base.wx_icon)
         print(res!.forecast[3].base.temp_c)
         print(res!.forecast[3].upper.wx_icon)
         print(res!.forecast[3].upper.temp_c)
        
    }
    
    
    
}
