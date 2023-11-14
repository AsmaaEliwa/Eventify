//
//  ImagePicker.swift
//  Eventify
//
//  Created by asmaa gamal  on 13/11/2023.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImages: [UIImage?]
    @Environment(\.presentationMode) private var presentationMode

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
//        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
   
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.selectedImages.append(selectedImage) // Append selected image to the array
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ImageInput: View {
    var label: String
    @Binding var selectedImages: [UIImage?] // Change to an array of UIImage
    @State private var isImagePickerPresented = false

    var body: some View {
        VStack {
            HStack {
                Text(label)
                    .font(.headline)
                    .padding(.leading)
                    .foregroundColor(.blue)
                Spacer()

                Button("Select Image") {
                    isImagePickerPresented.toggle()
                }.padding(.trailing)
            }

            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(selectedImages: $selectedImages)
            }

            if !selectedImages.isEmpty {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(selectedImages, id: \.self) { image in
                            Image(uiImage: image ?? UIImage())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: 200)
                        }
                    }
                }
            }
        }
    }
}
