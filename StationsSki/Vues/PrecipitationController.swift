//
//  PrecipitationController.swift
//  StationsSki
//
//  Created by Jean-Marc on 05/03/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import UIKit

class PrecipitationController: UIView {
    
    var pr = PrevsFormattees(indPrem: 0, indDer: 0, lesDates: [], nomIcone: [], tempBas: [], tempHaut: [], neige: [], pluie: [], vent: [], rafales: []) {
        didSet {
            print("precipitations set")
             self.setNeedsDisplay()
            
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.layer.cornerRadius = 20
        
        let bounds: CGRect  = self.bounds
        let xMax = bounds.width
        let yMax = bounds.height
        let margeH = xMax / 20
        let margeV = yMax / 10
        let pasInt = (xMax - (2 * margeH)) / 48
        
        
        let hUtile = yMax - (2 * margeV)
        var coef: CGFloat = 0.0
        
        
        var typeG = ""
        
        if pr.indDer > 0 {
            
            //determiner les precipitations max
            var pHigh = 10.0
            
            for i in (pr.indPrem)...(pr.indDer) {
                if pr.neige[i] + pr.pluie[i] > 20 {pr.neige[i] = 20 - pr.pluie[i]}
                let totP = pr.neige[i] + pr.pluie[i]
                if totP < pHigh {pHigh = totP}
            }
            if pHigh > 10  {typeG = "P2"} else {typeG = "P1"}
            if typeG == "P1" {coef = hUtile / 10} else {coef = hUtile / 20}
            
            
            let maVue = TracerAxes(maVue: self, lesDates: pr.lesDates)
            maVue.dessinerAxes(type: typeG)
            
            print("neige  \(pr.neige)")
            print("pluie   \(pr.pluie)")
            
            print(pHigh)
            
            //dessiner les graphes
            
            var p =  CGPoint()
            
            for i in (pr.indPrem)...(pr.indDer) {
                
                p.x = margeH + (pasInt * CGFloat(i + 1))
                let hautN = CGFloat(pr.neige[i]) * coef
                if hautN > 0 {
                    UIColor.blue.setFill()
                    UIColor.blue.setStroke()
                    p.y = yMax - margeV - hautN
                    let rNeige = CGRect(x: p.x, y: p.y, width: pasInt, height: hautN)
                    let cNeige = UIBezierPath(rect: rNeige)
                    cNeige.fill()
                    cNeige.stroke()
                }
                
                let hautP = CGFloat(pr.pluie[i]) * coef
                if hautP > 0 {
                    UIColor.red.setFill()
                    UIColor.red.setStroke()
                    p.y = yMax - margeV - hautN - hautP
                    let rPluie = CGRect(x: p.x, y: p.y, width: pasInt, height: hautP)
                    let cPluie = UIBezierPath(rect: rPluie)
                    
                    cPluie.fill()
                    cPluie.stroke()
                }
            }
        }
    }
}
