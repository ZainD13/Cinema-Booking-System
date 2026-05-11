//
//  BookingFormView.swift
//  Cinema Booking System
//
//  Created by Damaq Mohd Zain on 11/5/2026.
//

import SwiftUI

struct BookingFormView: View {
    let movie: Movie
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var email = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {

                Text("Booking Details")
                    .font(.title)
                    .bold()

                TextField("Name", text: $name)
                    .textFieldStyle(.roundedBorder)

                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)

                NavigationLink {
                    SeatSelectionView(movie: movie)
                } label: {
                    Text("Continue to Seat Selection")
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .disabled(name.isEmpty || email.isEmpty)
                .opacity((name.isEmpty || email.isEmpty) ? 0.5 : 1)

                Spacer()
            }
            .padding()
        }
    }
}
