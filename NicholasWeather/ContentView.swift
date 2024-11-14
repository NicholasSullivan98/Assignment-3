//
//  ContentView.swift
//  Assignment3
//
//  Created by Nicholas Sullivan on 2024-11-13.
//  ID: 991612414

import SwiftUI
import MapKit

struct ContentView: View {
    
    @StateObject var locationManager = MyLocationManager()
    @State var camPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    @State var locationName = "" // search locations of interest
    @State var selection: MKMapItem? // selected Marker
    
    var body: some View {
        VStack {
            Map(position: $camPosition, selection: $selection) {
                UserAnnotation() // show user location
                
                // show locations of interest on the map
                ForEach(locationManager.mapItems, id: \.self) { item in
                    Marker(item: item)
                }
            }
            VStack { // temp_c, feelslike_c, wind_kph, wind_dir, humidity, uv, vis_km, and condition
                Text("\(locationManager.weather?.location.name ?? "Error"), \(locationManager.weather?.location.region ?? "Error"), \(locationManager.weather?.location.country ?? "Error")")
                Text("Temperature: \(String(format: "%.2f", locationManager.weather?.current.temp_c ?? 0))°C")
                Text("Feels Like: \(String(format: "%.2f", locationManager.weather?.current.feelslike_c ?? 0))°C")
                Text("Wind Speed: \(String(format: "%.2f", locationManager.weather?.current.wind_kph ?? 0))kph")
                Text("Wind Direction: \(locationManager.weather?.current.wind_dir ?? "N/A")")
                Text("Humidity: \(String(format: "%.2f", locationManager.weather?.current.humidity ?? 0))")
                Text("UV \(String(format: "%.2f", locationManager.weather?.current.wind_kph ?? 0))")
                Text("Visibility: \(String(format: "%.2f", locationManager.weather?.current.vis_km ?? 0))")
                Text("Condition: \(locationManager.weather?.current.condition.text ?? "N/A")")
            }
        }
        .padding()
        .onAppear {
            locationManager.getWeather(for: locationManager.location.coordinate)
        }
        .onChange(of: locationManager.location) { newLocation in
            locationManager.getWeather(for: newLocation.coordinate)
        }
    }
}

#Preview {
    ContentView()
}
