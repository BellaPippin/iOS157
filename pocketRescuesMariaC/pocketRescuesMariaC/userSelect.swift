//
//  userSelect.swift
//  pocketRescuesMariaC
//
//  Created by student on 4/6/25.
//

import SwiftUI

struct userSelect: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("What brings you here?")
                    .underline()
                Spacer().frame(height: 50)
                Text("I want to sponsor a rescued animal")
                Spacer().frame(height: 10)
                NavigationLink(destination: shelterSetup()) {
                    Text("I am a shelter")
                        .foregroundColor(.accentColor)
                        .underline()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 242/255, green: 201/255, blue: 204/255))
            .ignoresSafeArea()
        }
    }
}

    

#Preview {
    userSelect()
}
