//
//  BookingsView.swift
//  Cinema Booking System
//
//  Created by Damaq Mohd Zain on 11/5/2026.
//

import SwiftUI

struct BookingsView: View {
    @EnvironmentObject var bookingSystem: BookingSystem

    var body: some View {
        NavigationView {
            List {
                ForEach(bookingSystem.bookings) { booking in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(booking.movie.title)
                                .font(.headline)

                            Text(booking.date.formatted())
                                .font(.caption)
                                .foregroundColor(.gray)
                        }

                        Spacer()

                        Button(role: .destructive) {
                            bookingSystem.cancel(booking: booking)
                        } label: {
                            Text("Cancel")
                        }
                    }
                }
            }
            .navigationTitle("My Bookings")
        }
    }
}

#Preview {
    let system = BookingSystem()

    let sampleMovie = Movie(
        title: "Interstellar",
        genre: "Sci-Fi",
        duration: 169,
        poster: "interstellar"
    )

    // Add a sample booking so the preview has data
    system.book(movie: sampleMovie, seat: "A1")

    return BookingsView()
        .environmentObject(system)
}
