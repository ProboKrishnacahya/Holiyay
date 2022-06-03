//
//  MyBookmark.swift
//  Holiyay
//
//  Created by MacBook Pro on 03/06/22.
//

import Foundation

struct MyBookmark {
    static var destinations: [Destination] = []
    static func setup() {
        if destinations.isEmpty {
            destinations = load("destinationData.json")
        }
    }
}
