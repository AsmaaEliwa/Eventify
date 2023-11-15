//
//  EventDetailsView.swift
//  Eventify
//
//  Created by asmaa gamal  on 15/11/2023.
//



import SwiftUI
import MapKit


struct EventDetailView: View {
    var event: Event

    var body: some View {
        VStack {
            HStack{
                Text(event.user?.username ?? "No user")
                  
            }
            Text(event.title ?? "No Title")
                .font(.title)

            Text(event.details ?? "No Details")
                .padding()

            Map(){
                  Marker("\(event.title ?? "No Title")", coordinate: CLLocationCoordinate2D(latitude: event.latitude, longitude: event.longitude))
            }.frame(width:  .infinity , height:200)
                
        
        }
        .padding().foregroundColor(.gray)
       
    }
}

