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
   /*
    var id: Int = 0
    var nomS = ""
    var pctO: Int = 0
    var neigeH: Double = 0
    var neigeB: Double = 0
    var dateDerC: String = ""
    var hauteurDerC: Double = 0
    
    var indPrem: Int = 0
    var indDer: Int = 0
    
    var lesDates: [String] = []
    var nomIcone: [String] = []
    var tempBas: [Double] = []
    var tempHaut: [Double] = []
    var neige: [Double] = []
    var pluie: [Double] = []
    var vent: [Double] = []
    var rafales: [Double] = []
    */
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //lectureParametres()
        
        let bounds: CGRect  = self.bounds
        print("bounds num 2: \(bounds)")
        
        print("*********** \(lesDates)")
        
        let path = UIBezierPath()
        path.lineWidth = 1.5
        UIColor.black.setStroke()
        
        var p = CGPoint()
        p.x = CGFloat(200.0)
        p.y = CGFloat(150.0)
        path.move(to: p)
        
        p.x = CGFloat(290.0)
        p.y = CGFloat(160.0)
        path.addLine(to: p)
        
        p.x = CGFloat(350.0)
        p.y = CGFloat(170.0)
        path.addLine(to: p)
        
        p.x = CGFloat(bounds.maxX)
        p.y = CGFloat(bounds.maxY)
        path.addLine(to: p)
        
        
        path.stroke()
        
        
        
        
        
        
        
        
        
    }    
}
