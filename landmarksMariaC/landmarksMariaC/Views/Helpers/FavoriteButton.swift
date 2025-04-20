//
//  FavoriteButton.swift
//  landmarksMariaC
//
//  Created by student on 3/30/25.
//

import SwiftUI


struct FavoriteButton: View {
    @Binding var isSet: Bool


    var body: some View {
        
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                        .labelStyle(.iconOnly)
                        .foregroundStyle(isSet ? .yellow : .gray)
                }
    }
}


#Preview {
    FavoriteButton(isSet: .constant(true))
}
