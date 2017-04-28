//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Amy Roberson on 4/27/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
