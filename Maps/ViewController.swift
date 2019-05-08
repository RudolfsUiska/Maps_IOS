//
//  ViewController.swift
//  Maps
//
//  Created by Students on 06/03/2019.
//  Copyright © 2019 RudolfsUiska. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, AddControllerDelagate, FilterControllerDelagate{

    
    @IBOutlet weak var mapView: MKMapView!
    var objects = [Descript]()
   
    let locationManager = CLLocationManager()
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       checkLocationAuthorizationStatus()
        let tinte = Descript(title: "Tinte", desc: "Terbatas iela",coordinate: CLLocationCoordinate2D(latitude: 57.540835, longitude: 25.426447))
        let baznica = Descript(title: "Tirzas baznīca", desc: "Tirza",coordinate: CLLocationCoordinate2D(latitude: 57.143376, longitude: 26.433543))
        let kebabnica = Descript(title: "Ausmeņa kebabs", desc: "Rēzekne",coordinate: CLLocationCoordinate2D(latitude: 56.508136, longitude: 27.335644))
        objects.append(contentsOf:[tinte,baznica,kebabnica])
        mapView.addAnnotations(objects)
        
        
        mapView.delegate = self
        
       
    }
//    func makeRoute(){
//        let request = MKDirections.Request()
//        request.source = MKMapItem(placemark:  MKPlacemark(coordinate: .coordinate, addressDictionary: nil))
//        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: .coordinate, addressDictionary: nil))
//        request.requestsAlternateRoutes = false
//        request.transportType = .automobile
//
//        let directions = MKDirections(request: request)
//
//        directions.calculate { [unowned self] response, error in
//            guard let unwrappedResponse = response else { return }
//
//            for route in unwrappedResponse.routes {
//                self.mapView.addOverlay(route.polyline)
//                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
//            }
//        }
//    }
    func returnData(loc: Descript) {
        objects.append(loc)
        mapView.addAnnotations(objects)
    }
    func enabledRangeFilter(dist: Bool) {
        if dist == true {
            let myLocation = CLLocation(latitude: mapView.userLocation.coordinate.latitude, longitude: mapView.userLocation.coordinate.longitude)
            
            for locations in objects{
                let pinLocation = CLLocation(latitude: locations.coordinate.latitude,longitude: locations.coordinate.longitude)
                let range = myLocation.distance(from: pinLocation) / 1000
                if (range > 10){
                    mapView.removeAnnotation(locations)
                }else{
                    //nothing
                }
            }
        }else{
            mapView.addAnnotations(objects)
        }
    }
    

//    func filter() {
//        let currentAnnotations = mapView.annotations
//        mapView.removeAnnotations(currentAnnotations)
//
//        let filter = myArray.filter {}
//        mapView.addAnnotations(filter)
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "filterSegue" {
            let del : FilterViewController = segue.destination as! FilterViewController
            del.delegate = self
        }
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = UIColor.blue
        return renderer
    }
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let annotation = annotation as? Descript else { return nil }
            let identifier = "marker"
            var view: MKMarkerAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKMarkerAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            return view
        
    }


}

