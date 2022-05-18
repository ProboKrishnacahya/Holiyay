//
//  CategoryItem.swift
//  Holiyay
//
//  Created by MacBook Pro on 16/05/22.
//

import SwiftUI

struct CategoryItem: View {
    var destination: Destination

    var body: some View {
        VStack(alignment: .leading) {
            destination.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 160, height: 128)
                .cornerRadius(8)
//            Text(destination.name)
//                .foregroundColor(.primary)
//                .font(.caption)
        }
        .padding(.trailing, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(destination: DestinationData().destinations[0])
    }
}
