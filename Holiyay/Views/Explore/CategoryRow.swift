//
//  CategoryRow.swift
//  Holiyay
//
//  Created by MacBook Pro on 16/05/22.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Destination]
    
    var body: some View {
        VStack {
//            HStack {
//                Text(categoryName)
//                    .font(.title3)
//                    .fontWeight(.semibold)
//                Spacer()
//            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { destination in
                        NavigationLink {
                            DestinationDetail(destination: destination)
                        } label: {
                            CategoryItem(destination: destination)
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var destinations = DestinationData().destinations
    
    static var previews: some View {
        CategoryRow(
            categoryName: destinations[0].category.rawValue,
            items: Array(destinations.prefix(4))
        )
    }
}
