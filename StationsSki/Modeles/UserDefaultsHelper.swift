//
//  UserDefaultsHelper.swift
//  StationsSki
//
//  Created by Jean-Marc on 13/03/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import Foundation

class UserDefaultsHelper {
    
    private var _defaults = UserDefaults.standard
    
    //ecriture es forecasts
    func setForecasts(forecasts: APIForecast?) {
        guard let forc = forecasts else {return}
        
        _defaults.set(forc, forKey: "forecasts")
        _defaults.synchronize()
    }
    
    //lecture des forcasts
    func getForecats() -> APIForecast{
        return _defaults.object(forKey: "forecasts") as! APIForecast
    }
}
