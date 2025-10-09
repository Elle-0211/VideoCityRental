//
//  EditMovieView.swift
//  VideoCity
//
//  Created by STUDENT on 10/9/25.
//

import SwiftUI
import SwiftData

struct EditMovieView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @Bindable var movie: Movie

    var body: some View {
        Form {
            TextField("Title", text: $movie.title)
            TextField("Genre", text: $movie.genre)
            TextField("Year", value: $movie.year, formatter: NumberFormatter())

            Toggle("Available", isOn: $movie.isAvailable)
                .tint(Color(hex: "#081e47"))
        }
        .navigationTitle("Edit Movie")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    try? context.save()
                    dismiss()
                }
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Delete") {
                    context.delete(movie)
                    try? context.save()
                    dismiss()
                }
                .foregroundColor(.red)
            }
        }
    }
}
