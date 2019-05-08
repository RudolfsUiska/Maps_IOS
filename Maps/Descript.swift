//
//  Artwork.swift
//  Maps
//
//  Created by Students on 06/03/2019.
//  Copyright © 2019 RudolfsUiska. All rights reserved.
//

import Foundation
import MapKit


class Descript: NSObject, MKAnnotation {
    let title: String?
    let desc: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, desc: String,  coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.desc = desc
        self.coordinate = coordinate
        
        super.init()
    }
    

}
