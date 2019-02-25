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
    private var _image: UIImage?
    private var _location: String
    
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
    var image: UIImage? {
        get{
            return _image
        }
        set{
            _image = image
        }
    }
    var location: String {
        get{
            return _location
        }
        set{
            _location = location
        }
    }
    
    init(favorite: Bool, pays: String, nom: String, id: Int, image: UIImage?, location: String) {
        _favorite = favorite
        _pays = pays
        _nom = nom
        _id = id
        _image = image
        _location = location
    }
    
}
