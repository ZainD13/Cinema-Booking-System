//
//  ContentView.swift
//  Cinema Booking System
//
//  Created by Damaq Mohd Zain on 11/5/2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject var bookingSystem = BookingSystem()

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Movies", systemImage: "film")
                }

            BookingsView()
                .tabItem {
                    Label("Bookings", systemImage: "ticket")
                }
        }
        .environmentObject(bookingSystem)
    }
}

#Preview {
    ContentView()
        .environmentObject(BookingSystem())
}
