//
//  MonAnnotationView.swift
//  StationsSki
//
//  Created by Jean-Marc on 13/03/2019.
//  Copyright © 2019 Suchier Jean-Marc. All rights reserved.
//

import UIKit
import MapKit

class MonAnnotationView: MKAnnotationView {
    
    //Premiere methode pou acceder au DetailController
    //On peut passer par la procedure ci-dessous
    //via un init special, on va recevoir l'instance d'objet CarteController
    
    var controller: CarteController?
    
    init(controller: CarteController,  annotation: MKAnnotation?, reuseIdentifier: String?) {
        self.controller = controller
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setupAnnotation()
    }
    //fin procedure speciale
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setupAnnotation()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAnnotation()
    }
    
    func setupAnnotation() {
        image = UIImage(named: "placeholder")
        canShowCallout = true
        leftCalloutAccessoryView = setupLeft()
        rightCalloutAccessoryView = setupRight()
        detailCalloutAccessoryView = setupCenter()
    
    }
    
    //bouton de gauche
    func setupLeft() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setImage(UIImage(named: "distance"), for: .normal)
        
        //pour creer une action target par programme (il n'y a pas de storyboard accessible)
        button.addTarget(self, action: #selector(gps), for: .touchUpInside)
        
        return button
    }
    
    //bouton de droite
    func setupRight() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setImage(UIImage(named: "detail"), for: .normal)
        
        //pour creer une action target par programme (il n'y a pas de storyboard accessible)
        button.addTarget(self, action: #selector(detail), for: .touchUpInside)
        
        return button
    }
    
    //contenu du centre
    func setupCenter() -> UIView? {
        
        guard let anno = annotation as? MonAnnotation else {return nil}
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 125, height: 125))
        
        //pour que la vue apparaisse, il faut programer les contraintes
        view.translatesAutoresizingMaskIntoConstraints = true
        view.widthAnchor.constraint(equalToConstant: 125).isActive = true
        view.heightAnchor.constraint(equalToConstant: 125).isActive = true
        
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = UIImage(named: "Ouverture")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        return view
    }
    
    @objc func detail() {
        guard let anno = annotation as? MonAnnotation else {return}
        
        //Premiere methode
        //Grace a l'init, on peut acceder directement a une fonction du controller
        
        //controller?.toDetail()
        
        
        //Deuxieme methode; passer par le NotificationCenter
        //on cree une annotation. Ici on lui passe la variable title
        
        print("J'envoie une notification de titre: \(anno.title)")
        NotificationCenter.default.post(name: Notification.Name("detail"), object: anno.title)
    }
    
    @objc func gps() {
        guard let anno = annotation as? MonAnnotation else {return}
        let placemark = MKPlacemark(coordinate: anno.coordinate)
        let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        let map = MKMapItem(placemark: placemark)
        map.openInMaps(launchOptions: options)
        
    }
}
