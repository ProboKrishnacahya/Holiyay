//
//  BookmarkView.swift
//  Holiyay
//
//  Created by MacBook Pro on 16/05/22.
//

import SwiftUI

struct BookmarkView: View {
    @EnvironmentObject var destinationData: DestinationData
    @State private var showBookmarkOnly = false
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
    var body: some View {
        NavigationView {
            Text("Realize your plan")
                .font(.title)
                .fontWeight(.black)
                .frame(maxHeight: .infinity, alignment: .top)
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
                            
                            Toggle(isOn: $showBookmarkOnly) {
                                Label("Bookmark Only", systemImage: "bookmark.fill")
                            }
                        } label: {
                            Label("Filter", systemImage: "slider.horizontal.3")
                        }
                    }
                }
        }
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
    }
}
