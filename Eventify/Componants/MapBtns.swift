//
//  MapBtns.swift
//  Eventify
//
//  Created by asmaa gamal  on 14/11/2023.
//

import SwiftUI
import MapKit

struct MapBtns: View {
    @Binding var searchResults : [MKMapItem]
    
    func search(for query:String){
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = MKCoordinateRegion(center: .parking, span: MKCoordinateSpan(latitudeDelta: 0.0125, longitudeDelta: 0.0125))
        Task{
            let search = MKLocalSearch(request: request)
            let response = try await search.start()
            searchResults = response.mapItems ?? []
        }
                                            
    }
    
    
    var body: some View {
        HStack{
            Button{
                search(for:"events")
            }label: {
                Label("near",systemImage: "e.circle.fill")
            }.buttonStyle(.borderedProminent)
            
            
            Button{
                search(for:"events")
            }label: {
                Label("far",systemImage: "e.circle")
            }.buttonStyle(.borderedProminent)
        }.labelStyle(.iconOnly)
        
    }
}

//#Preview {
//    MapBtns(searchResults: [MKMapItem])
//}




