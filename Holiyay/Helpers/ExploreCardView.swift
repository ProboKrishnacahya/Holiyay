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
                .frame(width: 175, height: 175)
            
            VStack(alignment: .leading, spacing: 15) {
                Text(destination.name)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Label(destination.city + ", " + destination.country, systemImage: "pin.fill")
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .lineLimit(1)
                
                HolidayPlan()
                    .padding(.bottom, 5)
            }
            .font(.subheadline)
            .foregroundColor(Color("Muted"))
            .padding()
        }
        .padding(.trailing, 20)
        .overlay(Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color("Accent")]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 10, height: 175, alignment: .top), alignment: .trailing)
        .frame(maxWidth: .infinity, maxHeight: 175)
        .background(Color("Component"))
        .foregroundColor(.white)
        .cornerRadius(8)
        .padding(.vertical, 10)
    }
}

struct ExploreCardView_Previews: PreviewProvider {
    static let destinationData = DestinationData()
    
    static var previews: some View {
        ExploreCardView(destination: destinations[0])
            .environmentObject(destinationData)
    }
}
