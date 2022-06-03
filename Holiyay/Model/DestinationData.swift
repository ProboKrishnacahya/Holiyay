//
//  DestinationData.swift
//  Holiyay
//
//  Created by MacBook Pro on 11/05/22.
//

import Foundation
import Combine

 class DestinationData: ObservableObject {
    @Published var destinations: [Destination] = getDestinations()
    @Published var profile = Profile.default
    
    var categories: [String: [Destination]] {
        Dictionary(
            grouping: destinations,
            by: { $0.category.rawValue }
        )
    }
}
 
func getDestinations() -> [Destination] {
    if MyBookmark.destinations.isEmpty {
        return load("destinationData.json")
    }
    return MyBookmark.destinations
 }

func load(_ filename: String) -> [Destination] {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode([Destination].self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as :\n\(error)")
    }
}
