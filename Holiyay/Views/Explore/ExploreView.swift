//
//  ExploreView.swift
//  Holiyay
//
//  Created by MacBook Pro on 16/05/22.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var destinationData: DestinationData
    @State private var selectedDestination: Destination?
    @State private var showDetail = true
    //var destination: Destination
    
    var index: Int? {
        destinationData.destinations.firstIndex(where: { $0.id == selectedDestination?.id })
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text("Start your memorable holiday")
                    .font(.system(size: 26))
                    .fontWeight(.black)
                    .padding(.vertical)
                
                HStack {
                    Text("Beaches")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    VStack {
                        Button {
                            showDetail.toggle()
                        } label: {
                            Label("Explore", systemImage: "chevron.down")
                                .foregroundColor(Color("Accent"))
                                .labelStyle(.iconOnly)
                                .imageScale(.large)
                                .rotationEffect(.degrees(showDetail ? 0 : 180))
                        }
                        
                        if !showDetail {
                            Text("s")
                        }
                    }
                }
            }
            .padding()
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
