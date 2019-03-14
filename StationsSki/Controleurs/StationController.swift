//
//  StationController.swift
//  StationsSki
//
//  Created by Jean-Marc on 25/02/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import UIKit

class StationController: UIViewController {    
    
    var forecasts : APIForecast?
    
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
    
    
    
    
    @IBOutlet weak var veTemperatures: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titresView.layer.cornerRadius = 40
        temperaturesView.layer.cornerRadius = 40
        precipitationsView.layer.cornerRadius = 40
        ventsView.layer.cornerRadius = 40
        
        let prev = Forecasts(forecasts: forecasts!)
        
        nomStation.text = nomS
        pctOpen.text = String(pctO)
        neigeHaut.text = String(neigeH)
        neigeBas.text = String(neigeB)
        if dateDerC  != "" {dateDerChute.text = dateDerC}
                else       {dateDerChute.text = "N/A"}
        hauteurDerChute.text = String(hauteurDerC)
        /*
        if indPrem == 0 {icone1.image = UIImage(named: nomIcone[0])}
        if indPrem <= 1 {icone2.image = UIImage(named: nomIcone[1])}
        if indPrem <= 2 {icone3.image = UIImage(named: nomIcone[2])}
        if indPrem <= 3 {icone4.image = UIImage(named: nomIcone[3])}
        if indPrem <= 4 {icone5.image = UIImage(named: nomIcone[4])}
        if indPrem <= 5 {icone6.image = UIImage(named: nomIcone[5])}
        if indPrem == 6 {icone7.image = UIImage(named: nomIcone[6])}
        if indPrem <= 7 {icone8.image = UIImage(named: nomIcone[7])}
        if indPrem <= 8 {icone9.image = UIImage(named: nomIcone[8])}
        if indPrem <= 9 {icone10.image = UIImage(named: nomIcone[9])}
        if indPrem <= 10 {icone11.image = UIImage(named: nomIcone[10])}
        if indPrem <= 11 {icone12.image = UIImage(named: nomIcone[11])}
      */
        
        icone1.image = UIImage(named: nomIcone[3])
        icone2.image = UIImage(named: nomIcone[5])
        icone3.image = UIImage(named: nomIcone[11])
        icone4.image = UIImage(named: nomIcone[15])
        icone5.image = UIImage(named: nomIcone[19])
        icone6.image = UIImage(named: nomIcone[21])
        icone7.image = UIImage(named: nomIcone[27])
        icone8.image = UIImage(named: nomIcone[29])
        icone9.image = UIImage(named: nomIcone[35])
        icone10.image = UIImage(named: nomIcone[37])
        icone11.image = UIImage(named: nomIcone[43])
        icone12.image = UIImage(named: nomIcone[45])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "carte", let vc = segue.destination as? CarteController {
            vc.nomStation = (sender as? String)!
        }
    }
    
    @IBAction func accesSiteWeb(_ sender: Any) {
    }
    
    
    @IBAction func carteAccesStation(_ sender: Any) {
        
         performSegue(withIdentifier: "carte", sender: nomS)
    }
    
}
