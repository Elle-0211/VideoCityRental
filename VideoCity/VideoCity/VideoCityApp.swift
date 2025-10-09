//
//  VideoCityApp.swift
//  VideoCity
//
//  Created by STUDENT on 10/9/25.
//

import SwiftUI
import SwiftData

@main
struct VideoCityApp: App {
    @State private var isLoggedIn = false
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MoviesListView(isLoggedIn: $isLoggedIn)
            } else {
                OpeningView(isLoggedIn: $isLoggedIn)
            }
        }
        .modelContainer(for: Movie.self)
    }
}
