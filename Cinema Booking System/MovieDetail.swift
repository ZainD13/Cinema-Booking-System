//
//  MovieDetail.swift
//  Cinema Booking System
//
//  Created by Damaq Mohd Zain on 11/5/2026.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @EnvironmentObject var bookingSystem: BookingSystem

    var body: some View {
        VStack(spacing: 20) {

            // full movie poster
            Image(movie.poster)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .cornerRadius(12)
                .shadow(radius: 5)

            Text(movie.title)
                .font(.largeTitle)
                .bold()

            Text("Genre: \(movie.genre)")
            Text("Duration: \(movie.duration) mins")

            if bookingSystem.isBooked(movie: movie) {
                Button(role: .destructive) {
                    if let booking = bookingSystem.bookings.first(where: { $0.movie == movie }) {
                        bookingSystem.cancel(booking: booking)
                    }
                } label: {
                    Text("Cancel Booking")
                        .padding()
                        .frame(maxWidth: .infinity)
                }

            } else {
                Button {
                    bookingSystem.book(movie: movie)
                } label: {
                    Text("Book Movie")
                        .padding()
                        .frame(maxWidth: .infinity)
                }
            }

            Spacer()
        }
        .padding()
    }
}
