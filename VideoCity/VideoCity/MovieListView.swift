//
//  MovieListView.swift
//  VideoCity
//
//  Created by STUDENT on 10/9/25.
//

import SwiftUI
import SwiftData

struct MoviesListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: [SortDescriptor(\Movie.title)]) var movies: [Movie]
    
    @Binding var isLoggedIn: Bool
    @State private var showAddMovie = false
    @State private var showEditSheet = false
    @State private var selectedMovie: Movie?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ZStack {
                    Color(hex: "#EACE08")
                        .ignoresSafeArea(edges: .top)
                    
                    Text("Movies")
                        .font(.custom("Chantilly-Serial Bold", size: 28))
                        .foregroundColor(Color(hex: "#0f2149"))
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            isLoggedIn = false
                        }) {
                            Text("Logout")
                                .font(.custom("Chantilly-Serial Bold", size: 16))
                                .foregroundColor(Color(hex: "#ec4b1f"))
                                .padding(.trailing)
                        }
                    }
                }
                .frame(height: 60)
                .background(Color(hex: "#EACE08"))
                
                // Movie List
                List {
                    ForEach(movies) { movie in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(movie.title)
                                    .font(.headline)
                                    .foregroundColor(Color(hex: "#0f2149"))
                                Text("\(movie.genre) • \(movie.year)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                Text(movie.isAvailable ? "Available" : "Rented")
                                    .font(.caption)
                                    .foregroundColor(movie.isAvailable ? .green : .red)
                            }
                            
                            Spacer()
                            
                            // 3-dot menu for edit/delete
                            Menu {
                                Button("Edit") {
                                    selectedMovie = movie
                                    showEditSheet = true
                                }
                                
                                Button("Delete", role: .destructive) {
                                    deleteMovie(movie)
                                }
                            } label: {
                                Image(systemName: "ellipsis")
                                    .font(.title2)
                                    .foregroundColor(Color(hex: "#ec4b1f"))
                                    .rotationEffect(.degrees(90)) // make it vertical
                            }
                        }
                        .padding(.vertical, 4)
                        .listRowBackground(Color(hex: "#e6a405"))
                    }
                }
                .listStyle(.plain)
                
                Spacer()
            }
            .background(Color(hex: "#EACE08").ignoresSafeArea())
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Spacer()
                        Button {
                            showAddMovie = true
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 30))
                                .foregroundColor(Color(hex: "#ec4b1f"))
                                .shadow(radius: 2)
                        }
                        .padding()
                    }
                }
            }
            .sheet(isPresented: $showAddMovie) {
                AddMovieView()
            }
            .sheet(item: $selectedMovie) { movie in
                EditMovieView(movie: movie)
            }
        }
    }
    
    private func deleteMovie(_ movie: Movie) {
        context.delete(movie)
        try? context.save()
    }
}
