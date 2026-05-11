//
//  SeatSelectionView.swift
//  Cinema Booking System
//
//  Created by Damaq Mohd Zain on 11/5/2026.
//

import SwiftUI

struct SeatSelectionView: View {
    let movie: Movie
    @EnvironmentObject var bookingSystem: BookingSystem
    @Environment(\.dismiss) var dismiss

    @State private var selectedSeat: String? = nil

    let rows = ["A", "B", "C", "D", "E"]
    let columns = 8

    var body: some View {
        VStack(spacing: 20) {

            Text("Select Your Seat")
                .font(.title)
                .bold()

            // Seat Grid
            VStack {
                ForEach(rows, id: \.self) { row in
                    HStack {
                        ForEach(1...columns, id: \.self) { col in
                            let seat = "\(row)\(col)"
                            let isTaken = bookingSystem.seatTaken(seat: seat)

                            Text(seat)
                                .frame(width: 35, height: 35)
                                .background(
                                    isTaken ? Color.gray :
                                    (selectedSeat == seat ? Color.green : Color.blue.opacity(0.3))
                                )
                                .foregroundColor(.white)
                                .cornerRadius(6)
                                .onTapGesture {
                                    if !isTaken {
                                        selectedSeat = seat
                                    }
                                }
                        }
                    }
                }
            }

            Button {
                if let seat = selectedSeat {
                    bookingSystem.book(movie: movie, seat: seat)
                    dismiss()
                }
            } label: {
                Text("Confirm Booking")
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .disabled(selectedSeat == nil)
            .opacity(selectedSeat == nil ? 0.5 : 1)

            Spacer()
        }
        .padding()
    }
}
