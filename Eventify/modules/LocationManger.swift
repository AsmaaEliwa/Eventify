//
//  LocationManger.swift
//  Eventify
//
//  Created by asmaa gamal  on 14/11/2023.
//
import Foundation
import CoreLocation

class SALocationManager: NSObject {
    
    var locationManager: CLLocationManager?
    var userLocation: CLLocation?
    static let sharedInstance: SALocationManager = {
        let instance = SALocationManager()
        return instance
        
    }()
    
    private override init() {
        super.init()
      
    }
    
    func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.activityType = CLActivityType.automotiveNavigation
        locationManager?.distanceFilter = kCLDistanceFilterNone
        locationManager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager?.allowsBackgroundLocationUpdates = false
        locationManager?.pausesLocationUpdatesAutomatically = true
        locationManager?.delegate = self
        requestPersmission()
    }
    
    func requestPersmission() {
        let status = locationManager?.authorizationStatus
        if status == .notDetermined {
            locationManager?.requestWhenInUseAuthorization()
        }
        
    }
    
    func checkForPermission() {
        if CLLocationManager.locationServicesEnabled() {
            
        }
    }
    
    func forceLocationUpdate() {
        locationManager?.requestLocation()
    }
    
    func startTrackingLocation() {
        locationManager?.startUpdatingLocation()
    }
    
    func stopTracking() {
        locationManager?.stopUpdatingLocation()
    }
    
    // Geoofencing
//    func startMoniotring() {
//        locationManager?.startMonitoring(for: )
//    }


}


extension SALocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count >= 1 {
            userLocation = locations[0]
            
            print(userLocation!.coordinate.latitude)
            print(userLocation!.coordinate.longitude)
           
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
    func getCurrentUserLocation(completion: @escaping (CLLocation?) -> Void) {
          // You can use this method to get the current user's location.
          // If a valid location is available, it will be provided in the completion handler.
          // If not, you may want to request a location update.
          
          // Check if you already have a location:
          if let userLocation = userLocation {
              completion(userLocation)
          } else {
              // Request a new location update:
              locationManager?.requestLocation()
          }
      }
  
    
}

