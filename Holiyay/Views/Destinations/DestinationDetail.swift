//
//  DestinationDetail.swift
//  Holiyay
//
//  Created by MacBook Pro on 11/05/22.
//

import SwiftUI

struct DestinationDetail: View {
    @State private var isPresented = false
    @EnvironmentObject var destinationData: DestinationData
    var destination: Destination
    
    var destinationIndex: Int {
        destinationData.destinations.firstIndex(where: { $0.id == destination.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: destination.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 256)
                .overlay(
                    Button {
                    } label: {
                        Label("Open in Maps", systemImage: "location.fill")
                    }
                        .buttonStyle(SecondaryButton())
                )
            
            VStack(alignment: .leading) {
                HStack {
                    Text(destination.name)
                        .font(.title)
                        .fontWeight(.heavy)
                }
                
                HStack(spacing: 18) {
                    Text(destination.category.rawValue)
                        .padding(14)
                        .background(Capsule().stroke(lineWidth: 2))
                        .font(.system(size: 18, weight: .semibold, design: .default))
                    
                    Label(destination.city + ", " + destination.country, systemImage: "pin.fill")
                        .font(.system(size: 18, weight: .medium, design: .default))
                }
                .font(.subheadline)
                .foregroundColor(Color("Muted"))
                
                Divider()
                    .padding(.vertical, 7.5)
                
                Text(destination.description)
                    .padding(.bottom)
                
                //                ForEach(destinationData.categories.keys.sorted(), id: \.self) { key in
                //                    CategoryRow(categoryName: key, items: destinationData.categories[key]!)
                //                }
                
                Button {
                    isPresented.toggle()
                } label: {
                    Label("Plan The Visit Date", systemImage: "calendar")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(PrimaryButton())
                .fullScreenCover(isPresented: $isPresented, content: FullScreenModalView.init)
            }
            .padding()
        }
        .navigationTitle(destination.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var visitDate = Date()
    
    var body: some View {
        HStack {
            Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }
            Spacer()
        }
        .padding()
        
        VStack {
            Text("Set Plan")
                .font(.title2)
                .fontWeight(.heavy)
                .padding()
            
            Image("visit_date")
                .resizable()
                .scaledToFit()
                .padding(.bottom)
            
            DatePicker(selection: $visitDate, in: ...Date(), displayedComponents: .date) {
            }
            .datePickerStyle(GraphicalDatePickerStyle())
            .accentColor(Color("Primary"))
            .clipped()
            .labelsHidden()
            .padding(.horizontal)
            
            Text("Set Visit Date on: \(visitDate.formatted(date: .long, time: .omitted))")
                .foregroundColor(Color("Muted"))
                .padding()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Label("Save to Bookmark", systemImage: "bookmark.fill")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(PrimaryButton())
            .padding(.top, 24)
            .padding(.horizontal)
        }
    }
}

struct DestinationDetail_Previews: PreviewProvider {
    static let destinationData = DestinationData()
    
    static var previews: some View {
        DestinationDetail(destination: DestinationData().destinations[0])
            .environmentObject(destinationData)
    }
}
