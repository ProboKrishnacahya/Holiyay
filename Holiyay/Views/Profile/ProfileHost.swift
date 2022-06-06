//
//  ProfileHost.swift
//  Landmarks
//
//  Created by MacBook Pro on 02/06/22.
//

import SwiftUI

struct ProfileHost: View {
    @EnvironmentObject var destinationData: DestinationData
    @State private var draftProfile = Profile.default
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Button("Cancel", role: .cancel) {
                    draftProfile = destinationData.profile
                    presentationMode.wrappedValue.dismiss()
                }
                
                Spacer()
                
                Button("Done") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            ProfileEdit(profile: $draftProfile)
                .onAppear {
                    draftProfile = destinationData.profile
                }
                .onDisappear {
                    destinationData.profile = draftProfile
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
