//
//  APIHelper.swift
//  StationsSki
//
//  Created by Jean-Marc on 27/02/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import Foundation

typealias APIComplSnow = (_ donnees: APIWU?, _ errorDetail: String?) -> Void
typealias APIComplForecast = (_ donnees: APIForecast?, _ errorDetail: String?) -> Void

class APIHelper {
    
    /*
    App name
    JMS's App
    App ID
    974ff615
    Key
    b71291b735c33f74b8bd97a4ffbbabb8
    */
    
    
    let baseUrl = "https://api.weatherunlocked.com/"
    // Les Arcs   333011
    // Les Angles 54883735
    let urlSnow = "api/snowreport/54883735?app_id=9a1bc4ca&app_key=157ca9c02a9f77ff1f68198ff3d53d55"
    let urlForecast = "api/resortforecast/54883735?app_id=9a1bc4ca&app_key=157ca9c02a9f77ff1f68198ff3d53d55"
    
    func getSnowReport(completion: APIComplSnow?)  {
        
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
    
    func getForecast(completion: APIComplForecast?)  {
        
        if let url = URL(string: baseUrl + urlForecast) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    completion?(nil, error!.localizedDescription)
                }
                if data != nil {
                    do {
                        let responseJSON = try JSONDecoder().decode(APIForecast.self, from: data!)
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
