//
//  UpdateProfilePic.swift
//  pocketRescuesMariaC
//
//  Created by student on 4/19/25.
//

import SwiftUI
import FirebaseStorage
import ImagePicker

struct UpdateProfilePic: View {
    var account: ShelterAccount?

    @State private var selectedImage: UIImage? = nil
    @State private var showImagePicker = false
    @State private var profileImageURL: String?

    var body: some View {
        VStack {
            if let account = account {
                Text("Welcome, \(account.shelterName)!")
                    .font(.title)
                    .padding()

                // Show the selected image or a placeholder
                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .padding()
                } else {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 200, height: 200)
                        .overlay(Text("No image").foregroundColor(.white))
                        .padding()
                }

                Button("Select Profile Picture") {
                    showImagePicker.toggle()
                }
                .padding()

                if let profileImageURL = profileImageURL {
                    Text("Profile image uploaded: \(profileImageURL)")
                        .padding()
                }
            } else {
                Text("No account info.")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .imagePicker(isPresented: $showImagePicker, image: $selectedImage, imageLimit: 1, pickerMode: .single)
        .onChange(of: selectedImage) { newImage in
            if let image = newImage {
                uploadProfileImage(image)
            }
        }
    }

    // Upload the selected image to Firebase Storage
    func uploadProfileImage(_ image: UIImage) {
        guard let account = account else { return }

        // Create a unique filename for the image
        let fileName = "\(account.userName)_profile.jpg"
        let storageRef = Storage.storage().reference().child("profile_pics/\(fileName)")

        if let imageData = image.jpegData(compressionQuality: 0.75) {
            storageRef.putData(imageData, metadata: nil) { metadata, error in
                if let error = error {
                    print("Error uploading image: \(error.localizedDescription)")
                    return
                }

                // Once the image is uploaded, get the URL
                storageRef.downloadURL { url, error in
                    if let error = error {
                        print("Error fetching download URL: \(error.localizedDescription)")
                        return
                    }

                    // Save the URL to Firestore or handle as needed
                    if let url = url {
                        self.profileImageURL = url.absoluteString
                        print("Profile image URL: \(url.absoluteString)")
                    }
                }
            }
        }
    }
}

#Preview {
    UpdateProfilePic(account: ShelterAccount(userName: "testUser", password: "password", shelterName: "Little Ol' Rescue", address: "123 Rescue St", phoneNumber: "(555) 555-5555", websiteURL: "littleolrescue.org"))
}
