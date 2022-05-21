//
//  CategoryRow.swift
//  Holiyay
//
//  Created by MacBook Pro on 16/05/22.
//

import SwiftUI

struct CategoryRow: View {
    var moreImages: Image
    var items: [Destination]
    
    var body: some View {
        VStack {
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
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var destinations = DestinationData().destinations
    
    static var previews: some View {
        CategoryRow(
            moreImages: destinations[0].thumbnail,
            items: Array(destinations.prefix(4))
        )
    }
}
