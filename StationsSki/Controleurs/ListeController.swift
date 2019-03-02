//
//  ListeController.swift
//  StationsSki
//
//  Created by Jean-Marc on 25/02/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import UIKit
import Foundation

class ListeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var lesStations: [Station] = []
    
    @IBOutlet weak var titres: UIView!
    @IBOutlet weak var tableListeStations: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titres.layer.cornerRadius = 10
        tableListeStations.delegate = self
        tableListeStations.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lesStations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let station = lesStations[indexPath.row]
        if let cell = tableListeStations.dequeueReusableCell(withIdentifier: "laliste") as? CellListe {
            cell.station = station
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    @IBAction func choixFavorite(_ sender: Any) {
        print("choix")
    }
    
    @IBAction func ajouterStation(_ sender: Any) {
        print("ajout")
        
    }
    
    @IBAction func supprimerStation(_ sender: Any) {
        print("supprimer")
    }
    
}
