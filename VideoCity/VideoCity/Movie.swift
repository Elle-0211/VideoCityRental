//
//  Movie.swift
//  VideoCity
//
//  Created by STUDENT on 10/9/25.
//

import Foundation
import SwiftData

@Model
final class Movie: Identifiable {
    var id = UUID()
    var title: String
    var genre: String
    var year: Int
    var isAvailable: Bool

    init(title: String, genre: String, year: Int, isAvailable: Bool = true) {
        self.title = title
        self.genre = genre
        self.year = year
        self.isAvailable = isAvailable
    }
}
