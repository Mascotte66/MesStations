//
//  VentController.swift
//  StationsSki
//
//  Created by Jean-Marc on 05/03/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import UIKit

class VentController: UIView {
    
    var pr = PrevsFormattees(indPrem: 0, indDer: 0, lesDates: [], nomIcone: [], tempBas: [], tempHaut: [], neige: [], pluie: [], vent: [], rafales: []) {
        didSet {
            print("vent set")
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
        let coef: CGFloat = hUtile / 100
        
        //determiner les precipitations max
        
        if pr.indDer > 0 {
            
            for i in (pr.indPrem)...(pr.indDer) {
                if pr.vent[i]  > 100 {pr.vent[i] = 100}
                if pr.rafales[i]  > 100 {pr.rafales[i] = 100}
            }
            
            let maVue = TracerAxes(maVue: self, lesDates: pr.lesDates)
            maVue.dessinerAxes(type: "V1")
            
            print("vent: \(pr.vent)")
            print("rafales: \(pr.rafales)")
            
            //dessiner les graphes
            
            var p =  CGPoint()
            
            let pathV = UIBezierPath()
            pathV.lineWidth = 2.0
            UIColor.blue.setStroke()
            
            
            p.x = margeH + (pasInt * CGFloat(pr.indPrem + 1))
            p.y = yMax - margeV - (CGFloat(pr.vent[pr.indPrem]) * coef)
            pathV.move(to:p)
            
            for i in (pr.indPrem + 1)...(pr.indDer) {
                p.x = margeH + (pasInt * CGFloat(i + 1))
                p.y = yMax - margeV - (CGFloat(pr.vent[i]) * coef)
                pathV.addLine(to: p)
            }
            pathV.stroke()
            
            
            let pathR = UIBezierPath()
            pathR.lineWidth = 1.0
            UIColor.red.setStroke()
            
            p.x = margeH + (pasInt * CGFloat(pr.indPrem + 1))
            p.y = yMax  - margeV - (CGFloat(pr.rafales[pr.indPrem]) * coef)
            pathR.move(to:p)
            
            for i in (pr.indPrem + 1)...(pr.indDer) {
                p.x = margeH + (pasInt * CGFloat(i + 1))
                p.y = yMax - margeV - (CGFloat(pr.rafales[i]) * coef)
                pathR.addLine(to: p)
            }
            pathR.stroke()
        }        
    }    
}
