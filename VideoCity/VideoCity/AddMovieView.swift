//
//  AddMovieView.swift
//  VideoCity
//
//  Created by STUDENT on 10/9/25.
//

import SwiftUI
import SwiftData

struct AddMovieView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    @State private var title = ""
    @State private var genre = ""
    @State private var year = ""

    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#e6a405")
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Add Movie")
                        .font(.custom("Chantilly-Serial Bold", size: 28))
                        .foregroundColor(Color(hex: "#0f2149"))
                        .padding(.top, 30)

                    Form {
                        Section {
                            TextField("Title", text: $title)
                            TextField("Genre", text: $genre)
                            TextField("Year", text: $year)
                                .keyboardType(.numberPad)
                        }
                        .listRowBackground(Color.white.opacity(0.9))
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color(hex: "#e6a405"))
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        guard let yearInt = Int(year) else { return }
                        let newMovie = Movie(title: title, genre: genre, year: yearInt)
                        context.insert(newMovie)
                        try? context.save()
                        dismiss()
                    }
                    .font(.custom("Chantilly-Serial Bold", size: 18))
                    .foregroundColor(Color(hex: "#0f2149"))
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.custom("Chantilly-Serial Bold", size: 18))
                    .foregroundColor(Color(hex: "#ec4b1f"))
                }
            }
        }
    }
}
