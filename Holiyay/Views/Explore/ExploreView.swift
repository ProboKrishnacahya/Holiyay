//
//  ExploreView.swift
//  Holiyay
//
//  Created by MacBook Pro on 16/05/22.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var destinationData: DestinationData
    @State private var showDetail = true
    //var destination: Destination
    
    var body: some View {
        NavigationView {
            List {
                PageView(pages: destinationData.features.map { CarouselComponent(destination: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                Text("Start your memorable holiday")
                    .font(.title)
                    .fontWeight(.black)
                    .padding(.vertical)
                
                HStack {
                    Text("Beaches")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        showDetail.toggle()
                    } label: {
                        Label("Explore", systemImage: "chevron.down")
                            .foregroundColor(Color("Accent"))
                            .labelStyle(.iconOnly)
                            .imageScale(.large)
                            .rotationEffect(.degrees(showDetail ? 0 : 180))
                    }
                    
                    if showDetail {
                        //                        ExploreView(destination: destination)
                        Text("Beaches")
                    }
                }
            }
            .listStyle(.inset)
            .ignoresSafeArea()
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
        //        VStack {
        //            ExploreView(destination: DestinationData.destination[0])
        //                .environmentObject(DestinationData())
        //        }
        //        .padding()
    }
}
