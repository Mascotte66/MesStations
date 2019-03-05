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
   
    

    override func draw(_ rect: CGRect) {
        super.draw(rect)        
       
        let bounds: CGRect  = self.bounds
        let xMax = bounds.width
        let yMax = bounds.height
        let margeH = xMax / 20
        let margeV = yMax / 10
        let pasInt = (xMax - (2 * margeH)) / 48
        
        var typeG = ""
        
        //determiner les temperatures min/max
        var tHigh = 10.0
        var tLow = -10.0
        for i in indPrem...indDer {
            if tempHaut[i] > 20 {tempHaut[i] = 20}
            if tempBas[i] > 20 {tempBas[i] = 20}
            if tempHaut[i] < -20 {tempHaut[i] = -20}
            if tempBas[i] < -20 {tempBas[i] = -20}
            if tempHaut[i] < tLow {tLow = tempHaut[i]}
            if tempBas[i] > tHigh {tHigh = tempBas[i]}
        }
        if tHigh > 10 || tLow < -10 {typeG = "T2"} else {typeG = "T1"}
        
        
        let maVue = TracerAxes(maVue: self)
        maVue.dessinerAxes(type: typeG)
        
        print("tempHaut  \(tempHaut)")
        print("tempBas   \(tempBas)")
        print(tLow)
        print(tHigh)
        
        //dessiner les graphes
        
        var p =  CGPoint()
        let hUtile = yMax / 2 - margeV
        var coef: CGFloat = 0.0
        if typeG == "T1" {coef = hUtile / 10} else {coef = hUtile / 20}
        
        let pathH = UIBezierPath()
        pathH.lineWidth = 2.0
        UIColor.green.setStroke()
        
        
        p.x = margeH + (pasInt * CGFloat(indPrem + 1))
        p.y = yMax / 2 - (CGFloat(tempHaut[indPrem]) * coef)
        pathH.move(to:p)
        
        for i in (indPrem + 1)...indDer {
            p.x = margeH + (pasInt * CGFloat(i + 1))
            p.y = yMax / 2 - (CGFloat(tempHaut[i]) * coef)
            pathH.addLine(to: p)
        }
        pathH.stroke()
        
        
        let pathB = UIBezierPath()
        pathB.lineWidth = 1.0
        UIColor.red.setStroke()
        
        p.x = margeH + (pasInt * CGFloat(indPrem + 1))
        p.y = yMax / 2 - (CGFloat(tempBas[indPrem]) * coef)
        pathB.move(to:p)
        
        for i in (indPrem + 1)...indDer {
            p.x = margeH + (pasInt * CGFloat(i + 1))
            p.y = yMax / 2 - (CGFloat(tempBas[i]) * coef)
            pathB.addLine(to: p)
        }
        pathB.stroke()
    }
        
        
        
        
        
        
        
        
        
        
    
}
