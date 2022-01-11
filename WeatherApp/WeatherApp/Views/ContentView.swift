//
//  ContentView.swift
//  WeatherApp
//
//  Created by Ingrid Silapan on 12/01/22.
//

import SwiftUI

struct WAColor {
    static let darkBlue = Color(hue: 0.645, saturation: 0.789, brightness: 0.34)
}

struct ContentView: View {
    // StateObject property wrapper so view can be notified
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Your coordinates are: \(location.longitude), \(location.latitude)")
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(WAColor.darkBlue)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}