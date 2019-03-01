//
//  APIForecast.swift
//  StationsSki
//
//  Created by Jean-Marc on 01/03/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import Foundation

struct APIForecast : Decodable{
    var id: Int
    var name: String
    var country: String
    var continent: String
    var forecast: [Forecast]
}

struct  Forecast: Decodable {
    
    var date: String
    var time: String
    
    var lowcloud_pct: Int
    var midcloud_pct: Int
    var highcloud_pct: Int
    var totalcloud_pct: Int
    //var frzglvl_ft: Int
    var frzglvl_m: Int
    var precip_mm: Double
    //var precip_in: Double
    var rain_mm: Double
    //var rain_in: Double
    var snow_mm: Double
    //var snow_in: Double
    //var hum_pct: Int
    //var dewpoint_c: Double
    //var dewpoint_f: Double
    //var vis_km: Double
    //var vis_mi: Double
    //var slp_mb: Int
    //var slp_in: Double
    var base: Base
    //var mid: Mid
    var upper: Upper
}

struct Base: Decodable {
    var wx_desc: String
    var wx_code: Int
    var wx_icon: String
    var freshsnow_cm: Double
    //var freshsnow_in: Double
    var temp_c: Double?
    //var temp_f: Double
    //var feelslike_c: Double
    //var feelslike_f: Double
    //var winddir_deg: Double
    //var winddir_compass: String
    //var windspd_mph: Double
    var windspd_kmh: Double
    //var windspd_kts: Double
    //var windspd_ms: Double
    //var windgst_mph:Double
    var windgst_kmh: Double?
    //var windgst_kts: Double
    //var windgst_ms: Double
}

struct Mid: Decodable {
    var wx_desc: String
    var wx_code: Int
    var wx_icon: String
    var freshsnow_cm: Double
    //var freshsnow_in: Double
    var temp_c: Double?
    //var temp_f: Double
    //var feelslike_c: Double
    //var feelslike_f: Double
    //var winddir_deg: Double
    //var winddir_compass: String
    //var windspd_mph: Double
    var windspd_kmh: Double
    //var windspd_kts: Double
    //var windspd_ms: Double
    //var windgst_mph:Double
    var windgst_kmh: Double?
    //var windgst_kts: Double
    //var windgst_ms: Double
    
}

struct Upper: Decodable {
    var wx_desc: String
    var wx_code: Int
    var wx_icon: String
    var freshsnow_cm: Double
    //var freshsnow_in: Double
    var temp_c: Double?
    //var temp_f: Double
    //var feelslike_c: Double
    //var feelslike_f: Double
    //var winddir_deg: Double
    //var winddir_compass: String
    //var windspd_mph: Double
    var windspd_kmh: Double
    //var windspd_kts: Double
    //var windspd_ms: Double
    //var windgst_mph:Double
    var windgst_kmh: Double?
    //var windgst_kts: Double
    //var windgst_ms: Double
}

