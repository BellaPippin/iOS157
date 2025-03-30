//
//  ContentView.swift
//  landmarksMariaC
//
//  Created by student on 3/20/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
