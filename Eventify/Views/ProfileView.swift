//
//  ProfileView.swift
//  Eventify
//
//  Created by asmaa gamal  on 12/11/2023.
//

import SwiftUI
import MapKit

struct ProfileView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var viewRouter: ViewRouter
    @State var showAddEvent = false
    @State var title = ""
    @State var details = ""
    @State var selectedCoordinate: CLLocationCoordinate2D?
    @State var selectedImages:[UIImage?]
    @State private var showAlert = false
    @State private var alertMessage = ""
       @State private var region = MKCoordinateRegion(
           center: CLLocationCoordinate2D(
               latitude: 40.83834587046632,
               longitude: 14.254053016537693),
           span: MKCoordinateSpan(
               latitudeDelta: 0.03,
               longitudeDelta: 0.03)
       )
    var body: some View{
        VStack{
            Button{
                showAddEvent = true
            }label: {
                Label("Add Event",systemImage: "plus")
            }
            
                            if let username = userManager.user?.username {
                                Text("Hello, \(username)")
                                Text(userManager.user?.email ?? "").font(.system(size: 20 ,design: .default))
                            } else {
                                Text("Hello, Guest")
                            }

                            List {
                                ForEach(Array(userManager.user?.events as? Set<Event> ?? [] ), id: \.self) { event in
//                                    Text(event.title ?? "")
                                    EventDetailView(event: event).padding()
                                }
                            }.navigationTitle("My Events")
                .sheet(isPresented: $showAddEvent, content: {
                    VStack{
                        Text("New Event!").foregroundColor(Color("node")).shadow(radius: 10).font(.system(size: 25))
                        input(lable: "Event title", text: $title, placeholder: "Enter Event Title")
                        input(lable: "Event Details", text: $details, placeholder: "Enter Event Details")
                        ImageInput(label: "Event Picture", selectedImages:
                    $selectedImages)
                        
                        
                        VStack {
                                 MapViewRepresentable(selectedCoordinate: $selectedCoordinate, region: $region)
//                                     .edgesIgnoringSafeArea(.all)

                                 Text("Selected Coordinate: \(selectedCoordinate?.latitude ?? 0), \(selectedCoordinate?.longitude ?? 0)")
                             }
                        
                        Button{
                            if title.isEmpty || details.isEmpty {
                                
                                          showAlert = true
                                          alertMessage = "Title and details cannot be empty"
                            } else {
                                DataManger.shared.addEvent(title: title, details: details, user: userManager.user ?? User(), images: selectedImages,location: selectedCoordinate ?? CLLocationCoordinate2D() )
                            }
                        }label: {
                            Label("Save",systemImage: "note").foregroundColor(Color("node")).padding()
                        }
                    }.padding()
                })
        }  .alert(isPresented: $showAlert) {
            Alert(title: Text("Validation Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
      
}

//#Preview {
//    ProfileView( selectedImages: [])
//}

