//
//  ProfileView.swift
//  Holiyay
//
//  Created by MacBook Pro on 16/05/22.
//

import SwiftUI

struct ProfileView: View {
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
                ShowEditProfileSheets()
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

struct ShowEditProfileSheets: View {
    @State private var showingPopover = false
    @EnvironmentObject var destinationData: DestinationData
    
    var body: some View {
        Button {
            showingPopover = true
        } label: {
            Image(systemName: "pencil")
                .font(.system(size: 22, weight: .medium, design: .default))
        }
        .popover(isPresented: $showingPopover) {
            HStack {
                Button {
                    showingPopover = false
                } label: {
                    Text("Cancel").bold()
                }
                Spacer()
            }
            .padding([.top, .leading])
            
            ProfileEdit(profile: .constant(.default))
            
            Button {
                showingPopover = false
            } label: {
                Label("Confirm Changes", systemImage: "person.fill.checkmark")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(PrimaryButton())
            .padding([.horizontal, .bottom])
        }
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(DestinationData())
    }
}

