//
//  Stations.swift
//  StationsSki
//
//  Created by Jean-Marc on 25/02/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//
import UIKit
import Foundation

class Station {
    
    private var _favorite: Bool
    private var _pays: String
    private var _nom: String
    private var _id: Int
    private var _pctopen: Int
    private var _lastsnow: String
    private var _newsnow: Double
    private var _uppersnow: Double
    private var _lowersnow: Double
    private var _conditions: String
    private var _latitude: Double
    private var _longitude: Double
    
    var favorite: Bool {
        get{
             return _favorite
        }
        set{
            _favorite = favorite
        }
    }
    var pays: String {
        get{
            return _pays
        }
        set{
            _pays = pays
        }
    }
    var nom: String {
        get{
            return _nom
        }
        set{
            _nom = nom
        }
    }
    var id: Int {
        get{
            return _id
        }
        set{
            _id = id
        }
    }
    var pctopen: Int {
        get{
            return _pctopen
        }
        set{
            _pctopen = pctopen
        }
    }
    var lastsnow: String {
        get{
            return _lastsnow
        }
        set{
            _lastsnow = lastsnow
        }
    }
    var newsnow: Double {
        get{
            return _newsnow
        }
        set{
            _newsnow = newsnow
        }
    }
    var uppersnow: Double {
        get{
            return _uppersnow
        }
        set{
            _uppersnow = uppersnow
        }
    }
    var lowersnow: Double {
        get{
            return _lowersnow
        }
        set{
            _lowersnow = lowersnow
        }
    }
    var conditions: String {
        get{
            return _conditions
        }
        set{
            _conditions = conditions
        }
    }
    
    var latitude: Double {
        get{
            return _latitude
        }
        set{
            _latitude = latitude
        }
    }
    
    var longitude: Double {
        get{
            return _longitude
        }
        set{
            _longitude = longitude
        }
    }
    
    init(favorite: Bool, pays: String, nom: String, id: Int, pctopen: Int, lastsnow: String, newsnow: Double, uppersnow: Double, lowersnow: Double, conditions: String, latitude: Double, longitude: Double) {
        _favorite = favorite
        _pays = pays
        _nom = nom
        _id = id
        _pctopen = pctopen
        _lastsnow = lastsnow
        _newsnow = newsnow
        _uppersnow = uppersnow
        _lowersnow = lowersnow
        _conditions = conditions
        _latitude = latitude
        _longitude = longitude
    }
    
}
