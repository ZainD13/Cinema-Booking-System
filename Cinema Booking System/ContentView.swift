//
//  ContentView.swift
//  Cinema Booking System
//
//  Created by Damaq Mohd Zain on 11/5/2026.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = BookingViewModel()

    let columns = Array(
        repeating: GridItem(.flexible()),
        count: 6
    )

    var body: some View {

        VStack(spacing: 20) {

            Text("Cinema Booking")
                .font(.largeTitle)
                .bold()

            LazyVGrid(columns: columns, spacing: 16) {

                ForEach(viewModel.seats) { seat in

                    Button {

                        viewModel.toggleSeat(seat)

                    } label: {

                        RoundedRectangle(cornerRadius: 8)
                            .fill(seatColor(seat))
                            .frame(width: 45, height: 45)
                            .overlay(
                                Text("\(seat.row)\(seat.number)")
                                    .foregroundColor(.white)
                                    .font(.caption)
                            )
                    }
                    .disabled(seat.isBooked)
                }
            }

            TextField(
                "Enter your name",
                text: $viewModel.customerName
            )
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)

            Button("Confirm Booking") {

                viewModel.confirmBooking()

            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding(.horizontal)

            Button("Cancel All Bookings") {

                viewModel.cancelAllBookings()

            }
            .foregroundColor(.red)

            Spacer()
        }
        .padding()
    }

    func seatColor(_ seat: Seat) -> Color {

        if seat.isBooked {
            return .red
        }

        if seat.isSelected {
            return .blue
        }

        return .gray
    }
}

#Preview {
    ContentView()
}
