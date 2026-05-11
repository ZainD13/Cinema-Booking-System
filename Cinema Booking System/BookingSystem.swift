//
//  BookingSystem.swift
//  Cinema Booking System
//
//  Created by Damaq Mohd Zain on 11/5/2026.
//

import Foundation
import SwiftUI
import Combine

final class BookingSystem: ObservableObject {
    @Published private(set) var bookings: [Booking] = []

    func book(movie: Movie) {
        let newBooking = Booking(movie: movie, date: Date())
        bookings.append(newBooking)
    }

    func cancel(booking: Booking) {
        bookings.removeAll { $0.id == booking.id }
    }

    func isBooked(movie: Movie) -> Bool {
        bookings.contains { $0.movie == movie }
    }
}
