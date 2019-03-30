//
//  TracerAxes.swift
//  StationsSki
//
//  Created by Jean-Marc on 04/03/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import UIKit

class TracerAxes {
    
    
    
    var maVue: UIView
    var lesDates: [String]
    var p = CGPoint()

    init(maVue: UIView, lesDates: [String]) {
        self.maVue = maVue
        self.lesDates = lesDates
    }
    
    func dessinerAxes(type: String) {
        let bounds: CGRect  = maVue.bounds
        let xMax = bounds.width
        let yMax = bounds.height
        let margeH = xMax / 20
        let margeV = yMax / 10
        let pasGl =  (xMax - (2 * margeH)) / 6
        let pasInt = (xMax - (2 * margeH)) / 48
        
        //axes horizontaux
        let path = UIBezierPath()
        path.lineWidth = 1.5
        UIColor.black.setStroke()
        
        path.move(to: CGPoint(x: 0, y: margeV))
        path.addLine(to: CGPoint(x: xMax, y: margeV))
        path.move(to: CGPoint(x: 0, y: yMax / 2))
        path.addLine(to: CGPoint(x: xMax, y: yMax / 2))
        path.move(to: CGPoint(x: 0, y: yMax - margeV))
        path.addLine(to: CGPoint(x: xMax, y: yMax - margeV))
        path.stroke()
        path.lineWidth = 0.8
        path.move(to: CGPoint(x: 0, y: margeV / 2 + yMax / 4))
        path.addLine(to: CGPoint(x: xMax, y: margeV / 2 + yMax / 4))
        path.move(to: CGPoint(x: 0, y: yMax * 3 / 4 - margeV / 2))
        path.addLine(to: CGPoint(x: xMax, y: yMax * 3 / 4 - margeV / 2))
        
        //axes verticaux
        
        //principaux
        for i in 0...8 {
            path.move(to: CGPoint(x: margeH + (pasGl * CGFloat(i)), y: 0))
            path.addLine(to: CGPoint(x: margeH + (pasGl * CGFloat(i)), y: yMax))
        }
        path.stroke()
        
        //intermediaires
        
        let pathV = UIBezierPath()
        pathV.lineWidth = 0.8
        UIColor.blue.setStroke()
        
        for i in 1...47 {
            pathV.move(to: CGPoint(x: margeH + (pasInt * CGFloat(i)), y: margeV))
            pathV.addLine(to: CGPoint(x: margeH + (pasInt * CGFloat(i)), y: yMax - margeV))
        }
        pathV.stroke()
        
        //affichage des dates
        
        for i in 0...5 {
            let chaine: NSString = lesDates[i] as NSString
            chaine.draw(at: CGPoint(x: margeH + (pasGl * CGFloat(i)) + 40, y: margeH / 6), withAttributes: nil)
        }
        
        //affichage des heures
        
        let c4 : NSString = "4"
        let c10: NSString = "10"
        let c16: NSString = "16"
        
        for i in 0...5 {
            
            c4.draw(at: CGPoint(x: margeH + (1.7 * pasInt) + (pasGl * CGFloat(i)), y: yMax - margeH / 2), withAttributes: nil)
            c10.draw(at: CGPoint(x: margeH + (3.5 * pasInt) + (pasGl * CGFloat(i)), y: yMax - margeH / 2), withAttributes: nil)
            c16.draw(at: CGPoint(x: margeH + (5.5 * pasInt) + (pasGl * CGFloat(i)), y: yMax - margeH / 2), withAttributes: nil)
        }
        
        //affichage des unites
        
        if type == "T1" {
            var chaine: NSString = "+10°C"
            chaine.draw(at: CGPoint(x: 10, y: margeV), withAttributes: nil)
            chaine = "0°C"
            chaine.draw(at: CGPoint(x: 10, y: yMax / 2), withAttributes: nil)
            chaine = "-10°C"
            chaine.draw(at: CGPoint(x: 10, y: yMax - margeV), withAttributes: nil)
        }
        if type == "T2" {
            var chaine: NSString = "+20°C"
            chaine.draw(at: CGPoint(x: 10, y: margeV), withAttributes: nil)
            chaine = "0°C"
            chaine.draw(at: CGPoint(x: 10, y: yMax / 2), withAttributes: nil)
            chaine = "-20°C"
            chaine.draw(at: CGPoint(x: 10, y: yMax - margeV), withAttributes: nil)
        }
        if type == "P1" {
            var chaine: NSString = " 10cm"
            chaine.draw(at: CGPoint(x: 10, y: margeV), withAttributes: nil)
            chaine = "5cm"
            chaine.draw(at: CGPoint(x: 20, y: yMax / 2), withAttributes: nil)
            chaine = "0"
            chaine.draw(at: CGPoint(x: 30, y: yMax - margeV), withAttributes: nil)
        }
        if type == "P2" {
            var chaine: NSString = " 20cm"
            chaine.draw(at: CGPoint(x: 10, y: margeV), withAttributes: nil)
            chaine = "10cm"
            chaine.draw(at: CGPoint(x: 10, y: yMax / 2), withAttributes: nil)
            chaine = "0"
            chaine.draw(at: CGPoint(x: 30, y: yMax - margeV), withAttributes: nil)
        }
        if type == "V1" {
            var chaine: NSString = " 100kmh"
            chaine.draw(at: CGPoint(x: 5, y: margeV), withAttributes: nil)
            chaine = "50kmh"
            chaine.draw(at: CGPoint(x: 10, y: yMax / 2), withAttributes: nil)
            chaine = "0"
            chaine.draw(at: CGPoint(x: 30, y: yMax - margeV), withAttributes: nil)
        }
    }
    
}
