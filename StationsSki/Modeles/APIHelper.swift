//
//  APIHelper.swift
//  StationsSki
//
//  Created by Jean-Marc on 27/02/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import Foundation

typealias APICompletion = (_ donnees: APIWU?, _ errorDetail: String?) -> Void

class APIHelper {
    
    let baseUrl = "https://api.weatherunlocked.com/"
    let urlSnow = "api/snowreport/333011?app_id=9a1bc4ca&app_key=157ca9c02a9f77ff1f68198ff3d53d55"
    
    func getSnowReport(completion: APICompletion?)  {
        
        if let url = URL(string: baseUrl + urlSnow) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
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
            }.resume()
            
        } else {
            completion?(nil, "url invalide")
        }
    }
    
 
}
