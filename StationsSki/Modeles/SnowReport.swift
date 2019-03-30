//
//  SnowReport.swift
//  StationsSki
//
//  Created by Suchier Jean-Marc on 30/03/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import Foundation

typealias APIComplSnow = (_ donnees: APIWU?, _ errorDetail: String?) -> Void

class SnowReport {
    
    //recherche sur web du snow report de la station
    
    //*** valable uniquement pour les Arcs
    let baseUrl = "https://api.weatherunlocked.com/"
    
    let urlSnow = "api/snowreport/333011?app_id=974ff615&app_key=b71291b735c33f74b8bd97a4ffbbabb8"
    
    private var task : URLSessionDataTask?
    
    //prour creer singleton de SnowReport
    
    static var shared = SnowReport()
    private init() {}
    
    func getSnowReport(completion: APIComplSnow?)  {
        
        if let url = URL(string: baseUrl + urlSnow) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                DispatchQueue.main.async {
                    if error != nil {
                        completion?(nil, error!.localizedDescription)
                    }
                    if data != nil {
                        do {
                            let responseJSON = try JSONDecoder().decode(APIWU.self, from: data!)
                            completion?(responseJSON, nil)
                        } catch {
                            completion?(nil, error.localizedDescription)
                            
                        }
                    } else {
                        completion?(nil, "Pas de donnees disponibles")
                    }
                    }
            }.resume()
            
        } else {
            completion?(nil, "url invalide")
        }
    }
}
