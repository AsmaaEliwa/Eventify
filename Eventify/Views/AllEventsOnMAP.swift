//
//  AllEventsOnMAP.swift
//  Eventify
//
//  Created by asmaa gamal  on 16/11/2023.
//

import SwiftUI
import MapKit
struct AllEventsOnMAP: View {
    @State var events : [Event]
    var body: some View {
        
        Map(){
            ForEach(events , id:\.self){event in
                
                Marker("\(event.title ?? "")", coordinate: CLLocationCoordinate2D(latitude: event.latitude, longitude: event.longitude))
            }
            
        }
        .onAppear(){
            events = DataManger.shared.fetchEvents()
        }
    }
}

//#Preview {
//    AllEventsOnMAP()
//}
