//
//  ExploreView.swift
//  Holiyay
//
//  Created by MacBook Pro on 16/05/22.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var destinationData: DestinationData
    @State private var topExpanded: Bool = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Carousel()
                        .frame(width: UIScreen.main.bounds.width - 40, height: 350)
                    
                    VStack {
                        Text("Start your memorable holiday")
                            .font(.system(size: 26))
                            .fontWeight(.black)
                            .padding(.vertical)
                        
                        ScrollView {
                            DisclosureGroup("Beaches", isExpanded: $topExpanded) {
                                ForEach(destinations) { destination in
                                    if destination.category.rawValue == "Beaches" {
                                        NavigationLink {
                                            DestinationDetail(destination: destination)
                                        } label: {
                                            ExploreCardView(destination: destination)
                                        }
                                        .tag(destination)
                                    }
                                }
                            }
                            
                            DisclosureGroup("Deserts") {
                                ForEach(destinations) { destination in
                                    if destination.category.rawValue == "Deserts" {
                                        NavigationLink {
                                            DestinationDetail(destination: destination)
                                        } label: {
                                            ExploreCardView(destination: destination)
                                        }
                                        .tag(destination)
                                    }
                                }
                            }
                            
                            DisclosureGroup("Forests") {
                                ForEach(destinations) { destination in
                                    if destination.category.rawValue == "Forests" {
                                        NavigationLink {
                                            DestinationDetail(destination: destination)
                                        } label: {
                                            ExploreCardView(destination: destination)
                                        }
                                        .tag(destination)
                                    }
                                }
                            }
                            
                            DisclosureGroup("Mountains") {
                                ForEach(destinations) { destination in
                                    if destination.category.rawValue == "Mountains" {
                                        NavigationLink {
                                            DestinationDetail(destination: destination)
                                        } label: {
                                            ExploreCardView(destination: destination)
                                        }
                                        .tag(destination)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 20)
                .navigationBarHidden(true)
                .ignoresSafeArea()
            }
        }
    }
}

struct Carousel: View {
    var body: some View {
        TabView {
            Image("beach_carousel")
                .resizable()
                .scaledToFill()
                .overlay(BeachOverlay(), alignment: .bottom)
                .padding(.bottom, 100)
                .foregroundColor(.cyan)
            
            Image("desert_carousel")
                .resizable()
                .scaledToFill()
                .overlay(DesertOverlay(), alignment: .bottom)
                .padding(.bottom, 100)
                .foregroundColor(.yellow)
            
            Image("forest_carousel")
                .resizable()
                .scaledToFill()
                .overlay(ForestOverlay(), alignment: .bottom)
                .padding(.bottom, 100)
                .foregroundColor(.green)
            
            Image("mountain_carousel")
                .resizable()
                .scaledToFill()
                .overlay(MountainOverlay(), alignment: .bottom)
                .padding(.bottom, 100)
                .foregroundColor(.blue)
        }
        .background(.black)
        .font(.title2.bold())
        .frame(width: UIScreen.main.bounds.width)
        .tabViewStyle(PageTabViewStyle())
    }
}

struct BeachOverlay: View {
    var body: some View {
        Text("Beach")
    }
}

struct DesertOverlay: View {
    var body: some View {
        Text("Desert")
    }
}

struct ForestOverlay: View {
    var body: some View {
        Text("Forest")
    }
}

struct MountainOverlay: View {
    var body: some View {
        Text("Mountain")
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
