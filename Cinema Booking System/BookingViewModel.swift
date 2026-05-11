//
//  BookingViewModel.swift
//  Cinema Booking System
//
//  Created by Damaq Mohd Zain on 11/5/2026.
//

import Foundation
import SwiftUI
import Combine

class BookingViewModel: ObservableObject {

    @Published var seats: [Seat] = []
    @Published var customerName: String = ""

    init() {
        generateSeats()
    }

    func generateSeats() {

        var generatedSeats: [Seat] = []

        for row in 1...5 {
            for number in 1...6 {

                generatedSeats.append(
                    Seat(
                        row: row,
                        number: number,
                        isBooked: false
                    )
                )
            }
        }

        seats = generatedSeats
    }

    func toggleSeat(_ seat: Seat) {

        guard let index = seats.firstIndex(where: {
            $0.id == seat.id
        }) else {
            return
        }

        if !seats[index].isBooked {
            seats[index].isSelected.toggle()
        }
    }

    func confirmBooking() {

        guard !customerName.isEmpty else {
            return
        }

        for index in seats.indices {

            if seats[index].isSelected {
                seats[index].isBooked = true
                seats[index].isSelected = false
            }
        }

        customerName = ""
    }

    func cancelAllBookings() {

        for index in seats.indices {
            seats[index].isBooked = false
        }
    }
}
