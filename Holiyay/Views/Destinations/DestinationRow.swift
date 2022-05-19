//
//  DestinationRow.swift
//  Holiyay
//
//  Created by MacBook Pro on 11/05/22.
//

import SwiftUI

struct DestinationRow: View {
    var destination: Destination
    
    var body: some View {
        HStack {
            destination.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            VStack (alignment: .leading) {
                Text(destination.name)
                    .bold()
            }
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

struct DestinationRow_Previews: PreviewProvider {
    static var destinations = DestinationData().destinations
    
    
    static var previews: some View {
        Group {
            DestinationRow(destination: destinations[0])
            DestinationRow(destination: destinations[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

