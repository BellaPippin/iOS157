//
//  shelterSetup.swift
//  pocketRescuesMariaC
//
//  Created by student on 4/6/25.
//

import SwiftUI
import MapKit

class AddressSearchViewModel: NSObject, ObservableObject, MKLocalSearchCompleterDelegate {
    @Published var queryFragment = ""
    @Published var suggestions: [MKLocalSearchCompletion] = []

    private var completer: MKLocalSearchCompleter

    override init() {
        self.completer = MKLocalSearchCompleter()
        super.init()
        self.completer.delegate = self
        self.completer.resultTypes = .address
    }

    func updateSearchResults(for query: String) {
        completer.queryFragment = query
    }

    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        DispatchQueue.main.async {
            self.suggestions = completer.results
        }
    }

    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print("Autocomplete error: \(error.localizedDescription)")
    }
}

struct shelterAccount {
    let userName: String
    let password: String
    let shelterName: String
    let address: String
    let phoneNumber: String
    let websiteURL: String
}


struct shelterSetup: View {
    @StateObject private var viewModel = AddressSearchViewModel()
    
    @State private var userName = ""
    @State private var password = ""
    @State private var shelterName = ""
    @State private var address = ""
    @State private var phoneNumber = ""
    @State private var websiteURL = ""
    
    @State private var savedAccount: shelterAccount? = nil
    @State private var navigateToNextView = false

    
    func createShelterAccount() -> shelterAccount {
        return shelterAccount(
            userName: userName,
            password: password,
            shelterName: shelterName,
            address: address,
            phoneNumber: phoneNumber,
            websiteURL: websiteURL
        )
    }


    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome! Let's get this organization set up.")
                    .padding(.top, 80)
                
                //User and Password Stack
                VStack(alignment: .leading){
                    Text("Account Username:")
                        .padding([.leading, .trailing], 15)
                    
                    TextField("lilolrescue", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding([.bottom, .leading, .trailing], 16)
                    
                    Text("Password:")
                        .padding([.leading, .trailing], 16)
                    
                    SecureField("Enter Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding([.bottom, .leading, .trailing], 16)
                    
                }
                .padding([.top,.bottom], 22)
                
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.red)
                
                
                //Account Info Stack
                VStack(alignment: .leading) {
                    Text("Shelter Name:")
                        .padding([.leading, .trailing], 16)
                    
                    TextField("Little Ol' Rescue", text: $shelterName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding([.bottom, .leading, .trailing], 16)
                    
                    Text("Address:")
                        .padding([.leading, .trailing], 16)
                    
                    TextField("Enter address", text: $address)
                        .onChange(of: address) {
                            viewModel.updateSearchResults(for: address)
                        }
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding([.leading, .trailing], 16)
                    
                    // Autocomplete Suggestions
                    if !viewModel.suggestions.isEmpty {
                        List(viewModel.suggestions, id: \.self) { suggestion in
                            VStack(alignment: .leading) {
                                Text(suggestion.title)
                                Text(suggestion.subtitle)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                address = suggestion.title + " " + suggestion.subtitle
                                viewModel.suggestions = []
                            }
                        }
                        .listStyle(PlainListStyle())
                        .frame(maxHeight: 200)
                        .padding(.horizontal, 16)
                    }
                    Text("Phone Number:")
                        .padding([.top, .leading, .trailing], 16)
                    
                    TextField("(555) 555-5555", text: $phoneNumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding([.bottom, .leading, .trailing], 16)
                    
                    Text("Website URL:")
                        .padding([.leading, .trailing], 16)
                    
                    TextField("littleolrescue.org", text: $websiteURL)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding([.bottom, .leading, .trailing], 16)
                }
                Button("Next") {
                    let newAccount = createShelterAccount()
                    savedAccount = newAccount
                    navigateToNextView = true
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 242/255, green: 201/255, blue: 204/255))
            .ignoresSafeArea()
            .navigationDestination(isPresented: $navigateToNextView) {
                    NextView(account: savedAccount)
                }
        }
    }
}
#Preview {
    shelterSetup()
}
