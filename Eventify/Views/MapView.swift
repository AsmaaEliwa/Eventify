import SwiftUI
import MapKit

struct MapViewRepresentable: UIViewRepresentable {
    @Binding var selectedCoordinate: CLLocationCoordinate2D?
    @Binding var region: MKCoordinateRegion

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.region = region
        mapView.delegate = context.coordinator

        // Add a gesture recognizer to handle taps on the map
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        mapView.addGestureRecognizer(tapGesture)

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.region = region
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewRepresentable

        init(_ parent: MapViewRepresentable) {
            self.parent = parent
            super.init()
        }

//        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
//            parent.region = mapView.region
//        }

        @objc func handleTap(_ gesture: UITapGestureRecognizer) {
            let location = gesture.location(in: gesture.view)
            let tappedCoordinate = coordinateFor(location, in: gesture.view as! MKMapView)
            parent.selectedCoordinate = tappedCoordinate
        }

        private func coordinateFor(_ location: CGPoint, in mapView: MKMapView) -> CLLocationCoordinate2D {
            return mapView.convert(location, toCoordinateFrom: mapView)
        }
        
        private func mapView(_ mapView: MKMapView, coordinateFor location: CGPoint) -> CLLocationCoordinate2D {
            return mapView.convert(location, toCoordinateFrom: mapView)
        }
    }
    
}
