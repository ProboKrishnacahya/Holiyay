//
//  ProfileHost.swift
//  Landmarks
//
//  Created by MacBook Pro on 02/06/22.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var destinationData: DestinationData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = destinationData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileResult(profile: destinationData.profile)
            } else {
                ProfileEdit(profile: $draftProfile)
                    .onAppear {
                        draftProfile = destinationData.profile
                    }
                    .onDisappear {
                        destinationData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(DestinationData())
    }
}
