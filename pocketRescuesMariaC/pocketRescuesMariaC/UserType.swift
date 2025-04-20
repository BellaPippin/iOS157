//
//  UserType.swift
//  pocketRescuesMariaC
//
//  Created by student on 4/7/25.
//


import SwiftUI

enum UserType {
    case shelter
    case sponsor
}

class UserSettings: ObservableObject {
    @Published var userType: UserType? = nil
}
