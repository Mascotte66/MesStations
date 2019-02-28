//
//  APIWU.swift
//  StationsSki
//
//  Created by Jean-Marc on 27/02/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import Foundation

struct APIWU: Decodable {
    var resortid: Int
    var resortname: String
    var resortcountry: String
    var newsnow_cm: Double
    //var newsnow_in:  Double
    var lowersnow_cm: Double
    //var lowersnow_in: Double
    var uppersnow_cm: Double
    var uppersnow_in: Double
    var pctopen: Int
    var lastsnow: String
    var reportdate: String
    var reporttime: String
    var conditions: String
}
