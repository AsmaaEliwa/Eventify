//
//  MapModule.swift
//  Eventify
//
//  Created by asmaa gamal  on 14/11/2023.
//

import Foundation
import MapKit

// 1. & 4.
struct PointOfInterest: Identifiable {
    // 2.
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    
    // 3.
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
