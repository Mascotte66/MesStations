//
//  StationController.swift
//  StationsSki
//
//  Created by Jean-Marc on 25/02/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import UIKit

class StationController: UIViewController {
   
    @IBOutlet weak var nomStation: UILabel!
    @IBOutlet weak var pctOpen: UILabel!
    @IBOutlet weak var neigeHaut: UILabel!
    @IBOutlet weak var neigeBas: UILabel!
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
    
    @IBOutlet weak var titresView: UIView!
    @IBOutlet weak var temperaturesView: UIView!
    @IBOutlet weak var precipitationsView: UIView!
    @IBOutlet weak var ventsView: UIView!
    
    @IBOutlet weak var veTemperatures: TemperatureController!
    @IBOutlet weak var vePrecipitations: PrecipitationController!
    @IBOutlet weak var veVents: VentController!
    
    
    var laStation : Station?
    var forecasts : APIForecast?
    var prevsFormattees : PrevsFormattees?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titresView.layer.cornerRadius = 40
        temperaturesView.layer.cornerRadius = 40
        precipitationsView.layer.cornerRadius = 40
        ventsView.layer.cornerRadius = 40
        
       
        
        nomStation.text = laStation!.nom
        pctOpen.text = String(laStation!.pctopen)
        neigeHaut.text = String(laStation!.uppersnow)
        neigeBas.text = String(laStation!.lowersnow)
        if laStation!.lastsnow  != "" {dateDerChute.text = laStation!.lastsnow}
        else       {dateDerChute.text = "N/A"}
        hauteurDerChute.text = String(laStation!.newsnow)
        
        
        //aller chercher les forecasts sur le web
        
        if laStation?.id != 0 {
            
            //let prev = Forecasts(id: laStation!.id)
          
            Forecasts.shared.lireForecasts(id: laStation!.id) { (success, result) in
                if success, let prev = result {
                    
                    
                    self.icone1.image = UIImage(named: prev.nomIcone[3])
                    self.icone2.image = UIImage(named: prev.nomIcone[5])
                    self.icone3.image = UIImage(named: prev.nomIcone[11])
                    self.icone4.image = UIImage(named: prev.nomIcone[15])
                    self.icone5.image = UIImage(named: prev.nomIcone[19])
                    self.icone6.image = UIImage(named: prev.nomIcone[21])
                    self.icone7.image = UIImage(named: prev.nomIcone[27])
                    self.icone8.image = UIImage(named: prev.nomIcone[29])
                    self.icone9.image = UIImage(named: prev.nomIcone[35])
                    self.icone10.image = UIImage(named: prev.nomIcone[37])
                    self.icone11.image = UIImage(named: prev.nomIcone[43])
                    self.icone12.image = UIImage(named: prev.nomIcone[45])
                    
                    self.veTemperatures.pr = prev
                    self.vePrecipitations.pr = prev
                    self.veVents.pr = prev
                    
                }
            }
        }
    }
 
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "carte", let vc = segue.destination as? CarteController {
            vc.nomStation = (sender as? String)!
        }
    }
    
    @IBAction func accesSiteWeb(_ sender: Any) {
    }
    
    
    @IBAction func carteAccesStation(_ sender: Any) {
        
         performSegue(withIdentifier: "carte", sender: laStation?.nom)
    }
    
}
