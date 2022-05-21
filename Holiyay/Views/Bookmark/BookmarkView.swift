//
//  BookmarkView.swift
//  Holiyay
//
//  Created by MacBook Pro on 16/05/22.
//

import SwiftUI

struct BookmarkView: View {
    @EnvironmentObject var destinationData: DestinationData
    @State private var filter = FilterCategory.all
    @State private var selectedDestination: Destination?
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case beaches = "Beaches"
        case desert = "Deserts"
        case forest = "Forests"
        case mountains = "Mountains"
        
        var id: FilterCategory { self }
    }
    
    var filteredDestinations: [Destination] {
        destinationData.destinations.filter { destination in
            (destination.isBookmark)
            && (filter == .all || filter.rawValue == destination.category.rawValue)
        }
    }
    
    var visitDate = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Realize your plan")
                    .font(.title)
                    .fontWeight(.black)
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Button(action: {
                                print("Sort by Destination Name")
                            }) {
                                Label("Sort", systemImage: "arrow.up.arrow.down")
                            }
                            Menu {
                                Picker("Category", selection: $filter) {
                                    ForEach(FilterCategory.allCases) { category in
                                        Text(category.rawValue).tag(category)
                                    }
                                }
                                .pickerStyle(.inline)
                            } label: {
                                Label("Filter", systemImage: "slider.horizontal.3")
                            }
                        }
                    }
                
                List(selection: $selectedDestination) {
                    ForEach(filteredDestinations) { destination in
                        NavigationLink {
                            DestinationDetail(destination: destination)
                        } label: {
                            BookmarkCardView(destination: destination)
                        }
                        .tag(destination)
                    }
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .listStyle(.plain)
            }
        }
    }
    
    struct BookmarkView_Previews: PreviewProvider {
        static var previews: some View {
            BookmarkView()
        }
    }
}
