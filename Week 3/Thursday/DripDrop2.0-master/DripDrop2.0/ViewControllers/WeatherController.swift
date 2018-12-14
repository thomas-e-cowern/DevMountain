//
//  WeatherController.swift
//  DripDrop2.0
//
//  Created by Thomas Cowern New on 12/13/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import Foundation

class WeatherController {
    
    // MARK: - Properties
    static let baseUrl = URL(string: "https://api.darksky.net/forecast")
    private static let apiSecret = "6ac701f931b0c0aa643cfc9d82e0a6b0"
    
    static func fetchWeatherAt(latitude: Double, longitude: Double, completion: @escaping (WeatherService?) -> Void) {
        // construct the URL request
        guard let url = baseUrl?.appendingPathComponent(WeatherController.apiSecret).appendingPathComponent("\(latitude),\(longitude)") else {
            completion(nil)
            return
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = [URLQueryItem(name: "exclude", value: "minutely, hourly, flags")]
        guard let finalUrl = components?.url else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: finalUrl)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        print(request.url?.absoluteString ?? "No Url")
        
        // Call the datatask (.resume, competion)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            print(response ?? "No Response")
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let weatherService = try JSONDecoder().decode(WeatherService.self, from: data)

                completion(weatherService)
            } catch {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}
