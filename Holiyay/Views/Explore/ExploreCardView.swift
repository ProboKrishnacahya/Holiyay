//
//  ExploreCardView.swift
//  Holiyay
//
//  Created by MacBook Pro on 19/05/22.
//

import SwiftUI

struct ExploreCardView: View {
    @EnvironmentObject var destinationData: DestinationData
    var destination: Destination
    
    var body: some View {
        HStack(alignment: .center) {
            destination.thumbnail
                .resizable()
                .frame(width: 160, height: 160)
            
            VStack(alignment: .leading, spacing: 15) {
                Text(destination.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Label(destination.city + ", " + destination.country, systemImage: "pin.fill")
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .lineLimit(1)
                
                Label("Date", systemImage: "calendar")
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .background(Color("Primary"))
                    .foregroundColor(.white)
                    .font(.body.bold())
                    .cornerRadius(8)
                    .padding(.bottom, 4)
            }
            .foregroundColor(Color("Muted"))
            .padding()
        }
        .padding(.trailing, 18)
        .overlay(Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color("Accent")]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 10, height: 160, alignment: .top), alignment: .trailing)
        .frame(maxWidth: .infinity, maxHeight: 160)
        .background(Color("Component"))
        .foregroundColor(.white)
        .cornerRadius(8)
        .padding(.vertical, 12)
    }
}

struct ExploreCardView_Previews: PreviewProvider {
    static let destinationData = DestinationData()
    
    static var previews: some View {
        ExploreCardView(destination: destinations[0])
            .environmentObject(destinationData)
    }
}
