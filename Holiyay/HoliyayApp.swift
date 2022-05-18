//
//  HoliyayApp.swift
//  Holiyay
//
//  Created by MacBook Pro on 26/04/22.
//

import SwiftUI

@main
struct HoliyayApp: App {
    @StateObject private var destinationData = DestinationData()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(destinationData)
        }
    }
}
