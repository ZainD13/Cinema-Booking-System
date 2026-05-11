//
//  Movie.swift
//  Cinema Booking System
//
//  Created by Damaq Mohd Zain on 11/5/2026.
//

import Foundation

struct Movie: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let genre: String
    let duration: Int
    let poster: String
}
