//
//  landmarksMariaCApp.swift
//  landmarksMariaC
//
//  Created by student on 3/20/25.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()


    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
