//
//  DepartViewController.swift
//  StationsSki
//
//  Created by Jean-Marc on 24/02/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import UIKit

class DepartViewController: UIViewController {
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
/*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "liste", let vc = segue.destination as? ListeController {
            vc.lesStations = (sender as? [Station])!
        }
    }
  */
    @IBAction func favorite(_ sender: Any) {
        print("favorite")
    }
    
    @IBAction func liste(_ sender: Any) {
        print("Liste")
        performSegue(withIdentifier: "liste", sender: nil)
    }
   

}
