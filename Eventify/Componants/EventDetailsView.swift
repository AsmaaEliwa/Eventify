//
//  EventDetailsView.swift
//  Eventify
//
//  Created by asmaa gamal  on 15/11/2023.
//



import SwiftUI
import MapKit

struct EventDetailView: View {
    @State private var newComment: String = ""
    var event: Event

    var body: some View {
        VStack {
            HStack {
                Text(event.user?.username ?? "No user")
            }
            Text(event.title ?? "No Title")
                .font(.title)

            Text(event.details ?? "No Details")
                .padding()
            EventImagesGrid(event:event)

            Map() {
                Marker("\(event.title ?? "No Title")", coordinate: CLLocationCoordinate2D(latitude: event.latitude, longitude: event.longitude))
            }
            .frame(width: .infinity, height: 200)

            List {
                ForEach(Array(event.comments as? Set<Comment> ?? []), id: \.self) { comment in
                    if let username = comment.user?.username, let body = comment.body {
                        Text("\(username): \(body)")
                            .font(.system(size: 30))
                    }
                }
            }.frame(width: .infinity, height: 100)

            VStack {
                TextField("Add a comment", text: $newComment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    if !newComment.isEmpty {
                        DataManger.shared.addComment(body:newComment , event:event)
                        newComment = ""
                    }
                }) {
                    Text("Add Comment")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .foregroundColor(.gray)
    }
}
