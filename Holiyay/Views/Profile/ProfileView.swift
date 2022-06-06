//
//  ProfileView.swift
//  Holiyay
//
//  Created by MacBook Pro on 16/05/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var destinationData: DestinationData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("")
                    .toolbar {
                        Button {
                            showingProfile.toggle()
                        } label: {
                            Label("Edit Profile", systemImage: "pencil")
                        }
                    }
                    .sheet(isPresented: $showingProfile) {
                        ProfileHost()
                            .environmentObject(destinationData)
                    }
                
                ProfileResult(profile: destinationData.profile)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(DestinationData())
    }
}
