//
//  TemperatureController.swift
//  StationsSki
//
//  Created by Jean-Marc on 02/03/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import Foundation
import UIKit

class TemperatureController : UIView {
    
    var pr = PrevsFormattees(indPrem: 0, indDer: 0, lesDates: [], nomIcone: [], tempBas: [], tempHaut: [], neige: [], pluie: [], vent: [], rafales: []) {
        didSet {
            print("temp set")
            self.setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)        
        
        let bounds: CGRect  = self.bounds
        let xMax = bounds.width
        let yMax = bounds.height
        let margeH = xMax / 20
        let margeV = yMax / 10
        let pasInt = (xMax - (2 * margeH)) / 48
        
        var typeG = ""
        
        if pr.indDer > 0 {
            
            //determiner les temperatures min/max
            var tHigh = 10.0
            var tLow = -10.0
            for i in (pr.indPrem)...(pr.indDer) {
                if pr.tempHaut[i] > 20 {pr.tempHaut[i] = 20}
                if pr.tempBas[i] > 20 {pr.tempBas[i] = 20}
                if pr.tempHaut[i] < -20 {pr.tempHaut[i] = -20}
                if pr.tempBas[i] < -20 {pr.tempBas[i] = -20}
                if pr.tempHaut[i] < tLow {tLow = pr.tempHaut[i]}
                if pr.tempBas[i] > tHigh {tHigh = pr.tempBas[i]}
            }
            if tHigh > 10 || tLow < -10 {typeG = "T2"} else {typeG = "T1"}
            
            
            let maVue = TracerAxes(maVue: self, lesDates: pr.lesDates)
            maVue.dessinerAxes(type: typeG)
            
            print("tempHaut  \(pr.tempHaut)")
            print("tempBas   \(pr.tempBas)")
            print(tLow)
            print(tHigh)
            
            //dessiner les graphes
            
            var p =  CGPoint()
            let hUtile = yMax / 2 - margeV
            var coef: CGFloat = 0.0
            if typeG == "T1" {coef = hUtile / 10} else {coef = hUtile / 20}
            
            let pathH = UIBezierPath()
            pathH.lineWidth = 2.0
            UIColor.blue.setStroke()
            
            
            p.x = margeH + (pasInt * CGFloat(pr.indPrem + 1))
            p.y = yMax / 2 - (CGFloat(pr.tempHaut[pr.indPrem]) * coef)
            pathH.move(to:p)
            
            for i in (pr.indPrem + 1)...(pr.indDer) {
                p.x = margeH + (pasInt * CGFloat(i + 1))
                p.y = yMax / 2 - (CGFloat(pr.tempHaut[i]) * coef)
                pathH.addLine(to: p)
            }
            pathH.stroke()
            
            
            let pathB = UIBezierPath()
            pathB.lineWidth = 1.0
            UIColor.red.setStroke()
            
            p.x = margeH + (pasInt * CGFloat(pr.indPrem + 1))
            p.y = yMax / 2 - (CGFloat(pr.tempBas[pr.indPrem]) * coef)
            pathB.move(to:p)
            
            for i in (pr.indPrem + 1)...(pr.indDer) {
                p.x = margeH + (pasInt * CGFloat(i + 1))
                p.y = yMax / 2 - (CGFloat(pr.tempBas[i]) * coef)
                pathB.addLine(to: p)
            }
            pathB.stroke()
        }
    }    
}
