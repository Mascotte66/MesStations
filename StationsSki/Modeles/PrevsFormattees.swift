//
//  PrevsFormattees.swift
//  StationsSki
//
//  Created by Suchier Jean-Marc on 27/03/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import Foundation

class PrevsFormattees {
    
    var indPrem: Int
    var indDer: Int
    
    var lesDates: [String]
    var nomIcone: [String]
    var tempBas: [Double]
    var tempHaut: [Double]
    var neige: [Double]
    var pluie: [Double]
    var vent: [Double]
    var rafales: [Double]
    
    init(indPrem: Int, indDer: Int, lesDates: [String], nomIcone: [String], tempBas: [Double], tempHaut: [Double], neige: [Double], pluie: [Double], vent: [Double], rafales : [Double]) {
        self.indPrem = indPrem
        self.indDer = indDer
        self.lesDates = lesDates
        self.nomIcone = nomIcone
        self.tempBas = tempBas
        self.tempHaut = tempHaut
        self.neige = neige
        self.pluie = pluie
        self.vent = vent
        self.rafales = rafales
    }
    
}
