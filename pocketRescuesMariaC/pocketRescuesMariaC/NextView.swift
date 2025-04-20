//
//  NextView.swift
//  pocketRescuesMariaC
//
//  Created by student on 4/19/25.
//

import SwiftUI

struct NextView: View {
    var account: shelterAccount?

    var body: some View {
        VStack {
            if let account = account {
                Text("Welcome, \(account.shelterName)!")
                    .font(.title)
                    .padding()
            } else {
                Text("No account info.")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

#Preview {
    NextView()
}
