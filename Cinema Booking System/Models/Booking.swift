//
//  Booking.swift
//  Cinema Booking System
//
//  Created by Damaq Mohd Zain on 11/5/2026.
//

import Foundation

struct Booking: Identifiable, Hashable {
    let id = UUID()
    let movie: Movie
    let date: Date
    let seat: String
}
