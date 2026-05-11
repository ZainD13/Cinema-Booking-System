//
//  Seat.swift
//  Cinema Booking System
//
//  Created by Damaq Mohd Zain on 11/5/2026.
//

import SwiftUI
import Foundation

struct Seat: Identifiable {
    let id = UUID()
    let row: Int
    let number: Int
    var isBooked: Bool
    var isSelected: Bool = false
}
