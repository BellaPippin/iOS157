//
//  ContentView.swift
//  pocketRescuesMariaC
//
//  Created by student on 4/6/25.
//

import SwiftUI

struct RedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 242/255, green: 76/255, blue: 61/255))
            .clipShape(Capsule())
            .foregroundColor(.white)
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack{
                Image("Logo")
                    .padding(.top, 20)
                
                Spacer()
                
                Button("Login") {
                    // Login action here
                }
                
                NavigationLink(destination: userSelect()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                ) {
                    Text("Sign Up")
                }
            }
            .buttonStyle(RedButton())
            .background(
                Image("bg")
            )
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
