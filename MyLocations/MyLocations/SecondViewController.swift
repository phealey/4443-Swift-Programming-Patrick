//
//  SecondViewController.swift
//  MyLocations
//
//  Created by Terry Griffin on 3/24/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        // Get a reference to the model data from the custom tab bar controller.
                        /*again, play with the data here*/
        let CurrentPoint = (self.tabBarController as CustomTabBarController).currentPoint
        if(CurrentPoint.set == true){
            let location = CLLocationCoordinate2D(latitude: CurrentPoint.lat,longitude: CurrentPoint.lon
            )
            //set the location of the center if the point has been initialized
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        let currentPoint = (self.tabBarController as CustomTabBarController).currentPoint
        if(currentPoint.set == true){
            var lat = currentPoint.lat
            var lon = currentPoint.lon
        }
        let location = CLLocationCoordinate2D(latitude: currentPoint.lat, longitude: currentPoint.lon)
        // 2
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        //3
        let annotation = MKPointAnnotation()
        annotation.setCoordinate(location)
        annotation.title = "Big Ben"
        annotation.subtitle = "London"
        mapView.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
