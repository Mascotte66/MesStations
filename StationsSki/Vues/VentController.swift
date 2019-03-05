//
//  VentController.swift
//  StationsSki
//
//  Created by Jean-Marc on 05/03/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import UIKit

class VentController: UIView {
    
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
        var coef: CGFloat = hUtile / 100
        
        //determiner les precipitations max
        
        for i in indPrem...indDer {
            if vent[i]  > 100 {vent[i] = 100}
            if rafales[i]  > 100 {rafales[i] = 100}
        }
       
        let maVue = TracerAxes(maVue: self)
        maVue.dessinerAxes(type: "V1")
        
        print("vent: \(vent)")
        print("rafales: \(rafales)")
        
        //dessiner les graphes
        
        var p =  CGPoint()
        
        let pathV = UIBezierPath()
        pathV.lineWidth = 2.0
        UIColor.green.setStroke()
        
        
        p.x = margeH + (pasInt * CGFloat(indPrem + 1))
        p.y = yMax - margeV - (CGFloat(vent[indPrem]) * coef)
        pathV.move(to:p)
        
        for i in (indPrem + 1)...indDer {
            p.x = margeH + (pasInt * CGFloat(i + 1))
            p.y = yMax - margeV - (CGFloat(vent[i]) * coef)
            pathV.addLine(to: p)
        }
        pathV.stroke()
        
        
        let pathR = UIBezierPath()
        pathR.lineWidth = 1.0
        UIColor.red.setStroke()
        
        p.x = margeH + (pasInt * CGFloat(indPrem + 1))
        p.y = yMax  - margeV - (CGFloat(rafales[indPrem]) * coef)
        pathR.move(to:p)
        
        for i in (indPrem + 1)...indDer {
            p.x = margeH + (pasInt * CGFloat(i + 1))
            p.y = yMax - margeV - (CGFloat(rafales[i]) * coef)
            pathR.addLine(to: p)
        }
        pathR.stroke()
    }    
}
