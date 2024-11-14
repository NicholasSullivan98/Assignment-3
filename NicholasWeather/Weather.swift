//
//  Weather.swift
//  Assignment3
//
//  Created by Nicholas Sullivan on 2024-11-13.
//  ID: 991612414
/*
{
 "location": {
   "name": "New York",
   "region": "New York",
   "country": "United States of America",
   "lat": 40.714,
   "lon": -74.006,
   "tz_id": "America/New_York",
   "localtime_epoch": 1731530607,
   "localtime": "2024-11-13 15:43"
 },
 "current": {
   "last_updated_epoch": 1731529800,
   "last_updated": "2024-11-13 15:30",
   "temp_c": 9.4,
   "temp_f": 48.9,
   "is_day": 1,
   "condition": {
     "text": "Sunny",
     "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
     "code": 1000
   },
   "wind_mph": 6.5,
   "wind_kph": 10.4,
   "wind_degree": 45,
   "wind_dir": "NE",
   "pressure_mb": 1032,
   "pressure_in": 30.47,
   "precip_mm": 0,
   "precip_in": 0,
   "humidity": 24,
   "cloud": 0,
   "feelslike_c": 7.8,
   "feelslike_f": 46.1,
   "windchill_c": 9.2,
   "windchill_f": 48.6,
   "heatindex_c": 11.1,
   "heatindex_f": 51.9,
   "dewpoint_c": -3.6,
   "dewpoint_f": 25.5,
   "vis_km": 16,
   "vis_miles": 9,
   "uv": 0.8,
   "gust_mph": 7.7,
   "gust_kph": 12.3
 }
}
*/

//Needed: temp_c, feelslike_c, wind_kph, wind_dir, humidity, uv, vis_km, and condition

import Foundation

struct Weather: Decodable {
    let location: Location
    let current: CurrentWeather
}

struct Location: Decodable {
    let name: String
    let region: String
    let country: String
}

struct CurrentWeather: Decodable {
    let temp_c: Double
    let condition: WeatherCondition
    let wind_kph: Double
    let wind_dir: String
    let humidity: Int
    let feelslike_c: Double
    let vis_km: Double
    let uv: Double
}

struct WeatherCondition: Decodable {
    let text: String
    let icon: String
    let code: Int
}

