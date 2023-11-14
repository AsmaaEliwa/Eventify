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
//
//
struct MapView: View {
    var body: some View {
        
        Map(){
            Marker("parking",coordinate: .parking)
        }
        
    }
}


//
//struct MapView: UIViewRepresentable {
//    @Binding var selectedCoordinate: CLLocationCoordinate2D?
//   
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(self)
//    }
//
//    func makeUIView(context: Context) -> MKMapView {
//        let mapView = MKMapView()
//        mapView.delegate = context.coordinator
//        let gestureRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.didTapMap(_:)))
//        mapView.addGestureRecognizer(gestureRecognizer)
//        return mapView
//    }
//
//    func updateUIView(_ uiView: MKMapView, context: Context) {
//        if let selected = selectedCoordinate {
//            uiView.removeAnnotations(uiView.annotations)
//            
//            let annotation = MKPointAnnotation()
//            annotation.coordinate = selected
//            uiView.addAnnotation(annotation)
//            
//            let region = MKCoordinateRegion(center: selected, latitudinalMeters: 1000, longitudinalMeters: 1000)
//            uiView.setRegion(region, animated: true)
//        }
//    }
//
//    class Coordinator: NSObject, MKMapViewDelegate {
//        var parent: MapView
//
//        init(_ parent: MapView) {
//            self.parent = parent
//        }
//        
//        
//        @objc func didTapMap(_ gesture: UITapGestureRecognizer) {
////            let location = gesture.location(in: parent.makeUIView())
////            let coordinate = parent.makeUIView().convert(location, toCoordinateFrom: nil)
//            
////            parent.selectedCoordinate = coordinate
//        }
//        
//        
//        
//    }
//}
