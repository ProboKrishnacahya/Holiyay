//
//  BookmarkCardView.swift
//  Holiyay
//
//  Created by MacBook Pro on 19/05/22.
//

import SwiftUI

struct BookmarkCardView: View {
    @EnvironmentObject var destinationData: DestinationData
    var destination: Destination
    
    var body: some View {
        VStack(alignment: .leading) {
            destination.image
                .resizable()
                .scaledToFit()
            
            HStack {
                VStack(alignment: .leading) {
                    Text(destination.name)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    HStack(spacing:20) {
                        Button(action: {}) {
                            Text(destination.category.rawValue)
                                .padding()
                        }
                        .background(Capsule().stroke(lineWidth: 2))
                        .font(.system(size: 18, weight: .semibold, design: .default))
                        
                        Label(destination.city + ", " + destination.country, systemImage: "pin.fill")
                            .font(.system(size: 18, weight: .medium, design: .default))
                            .lineLimit(1)
                    }
                    .font(.subheadline)
                    .foregroundColor(Color("Muted"))
                    .padding(.bottom)
                    
                    Button {
                    } label: {
                        Label("Date", systemImage: "calendar")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButton())
                }
            }
            .padding(20)
        }
        .background(Color("Component"))
        .cornerRadius(16)
    }
}

struct BookmarkCardView_Previews: PreviewProvider {
    static let destinationData = DestinationData()
    
    static var previews: some View {
        BookmarkCardView(destination: DestinationData().destinations[0])
            .environmentObject(destinationData)
    }
}
