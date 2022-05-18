//
//  CarouselComponent.swift
//  Holiyay
//
//  Created by MacBook Pro on 16/05/22.
//

import SwiftUI

struct CarouselComponent: View {
    var destination: Destination
    
    var body: some View {
        destination.carouselImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay {
                TextOverlay(destination: destination)
            }
    }
}

struct TextOverlay: View {
    var destination: Destination
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.5), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(destination.name)
                    .font(.title.bold())
                Text(destination.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct CarouselComponent_Previews: PreviewProvider {
    static var previews: some View {
        CarouselComponent(destination: DestinationData().features[0])
    }
}
