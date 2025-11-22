//
//  SellScreen.swift
//  SecondServe
//
//  Created by Marc Rodenas Guasch on 21/11/25.
//

//
///
//  SellScreen.swift
//  SecondServe
//

import SwiftUI
import PhotosUI

struct SellScreen: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            // Tab picker for Sell / Donation
            Picker("", selection: $selectedTab) {
                Text("Sell").tag(0)
                Text("Donation").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            ScrollView {
                VStack(spacing: 20) {
                    if selectedTab == 0 {
                        SellFormView()
                    } else {
                        DonationFormView()
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
            }
        }
    }
}

// MARK: - Sell Form
struct SellFormView: View {
    @State private var name = ""
    @State private var cost = ""
    @State private var description = ""
    @State private var expiryDate = Date()
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var photoData: Data?
    
    var body: some View {
        VStack(spacing: 20) {
            // Card-like inputs
            VStack(spacing: 15) {
                RoundedInputField(placeholder: "Name", text: $name)
                RoundedInputField(placeholder: "Cost", text: $cost, keyboard: .decimalPad)
                RoundedInputField(placeholder: "Description", text: $description)
                
                DatePicker("Expiry Date", selection: $expiryDate, displayedComponents: .date)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.black.opacity(0.05)))
                
                // Photo upload
                PhotosPicker(
                    selection: $selectedPhoto,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    Text("Upload Photo for Verification")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.black.opacity(0.05)))
                }
                .onChange(of: selectedPhoto) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            photoData = data
                        }
                    }
                }
                
                if let data = photoData, let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(15)
                        .shadow(radius: 4)
                }
            }
            
            Button(action: {
                // TODO: submit item
            }) {
                Text("Submit Item")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 4)
            }
        }
    }
}

// MARK: - Donation Form
struct DonationFormView: View {
    @State private var organization = ""
    @State private var name = ""
    @State private var description = ""
    @State private var expiryDate = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 15) {
                RoundedInputField(placeholder: "Organization", text: $organization)
                RoundedInputField(placeholder: "Name", text: $name)
                RoundedInputField(placeholder: "Description", text: $description)
                
                DatePicker("Expiry Date", selection: $expiryDate, displayedComponents: .date)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.black.opacity(0.05)))
            }
            
            Button(action: {
                // TODO: submit donation
            }) {
                Text("Submit Donation")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 4)
            }
        }
    }
}

// MARK: - Reusable Rounded Input Field
struct RoundedInputField: View {
    var placeholder: String
    @Binding var text: String
    var keyboard: UIKeyboardType = .default
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .keyboardType(keyboard)
            .background(RoundedRectangle(cornerRadius: 15).fill(Color.black.opacity(0.05)))
            .shadow(radius: 2)
    }
}

#Preview {
    NavigationStack {
        SellScreen()
    }
}
