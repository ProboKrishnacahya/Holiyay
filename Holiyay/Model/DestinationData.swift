//
//  DestinationData.swift
//  Holiyay
//
//  Created by MacBook Pro on 11/05/22.
//

import Foundation
import Combine

final class DestinationData: ObservableObject {
    @Published var destinations: [Destination] = load("destinationData.json")
    @Published var profile = Profile.default
    
    var features: [Destination] {
        destinations.filter { $0.isFeatured }
    }
    
    var categories: [String: [Destination]] {
        Dictionary(
            grouping: destinations,
            by: { $0.category.rawValue }
        )
    }
}

var destinations: [Destination] = load("destinationData.json")

func load<T: Decodable>(_ filename: String) -> T {
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
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
