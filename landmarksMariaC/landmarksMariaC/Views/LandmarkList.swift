//
//  LandmarkViews.swift
//  landmarksMariaC
//
//  Created by student on 3/29/25.
//

import SwiftUI


struct LandmarkList: View {
    var body: some View {
        List {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
    }
}


#Preview {
    LandmarkList()
}
