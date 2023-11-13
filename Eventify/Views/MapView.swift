//
//  MapView.swift
//  Eventify
//
//  Created by asmaa gamal  on 12/11/2023.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D{
    static let parking = CLLocationCoordinate2D(latitude: 42.354528, longitude: -71.068369)
}


struct MapView: View {
    var body: some View {
        
        Map(){
            Marker("parking",coordinate: .parking)
        }
        
    }
}

#Preview {
    MapView()
}
