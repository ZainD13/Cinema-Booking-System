//
//  HomeView.swift
//  Cinema Booking System
//
//  Created by Damaq Mohd Zain on 11/5/2026.
//

import SwiftUI

struct HomeView: View {
    let movies = SampleData.movies
    @EnvironmentObject var bookingSystem: BookingSystem

    var body: some View {
        NavigationView {
            List(movies) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {

                    HStack(spacing: 12) {

                        // movie poster preview
                        Image(movie.poster)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 90)
                            .clipped()
                            .cornerRadius(8)

                        // text info
                        VStack(alignment: .leading, spacing: 4) {
                            Text(movie.title)
                                .font(.headline)

                            Text("\(movie.genre) • \(movie.duration) min")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Movies")
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(BookingSystem())
}
