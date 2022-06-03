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

//struct ShowEditProfileSheets: View {
//    @State private var showingPopover = false
//    @EnvironmentObject var destinationData: DestinationData
//    
//    var body: some View {
//        Button {
//            showingPopover = true
//        } label: {
//            Image(systemName: "pencil")
//                .font(.system(size: 22, weight: .medium, design: .default))
//        }
//        .popover(isPresented: $showingPopover) {
//            HStack {
//                Button {
//                    showingPopover = false
//                } label: {
//                    Text("Cancel").bold()
//                }
//                Spacer()
//            }
//            .padding([.top, .leading])
//            
//            ProfileEdit(profile: .constant(.default))
//            
//            Button {
//                showingPopover = false
//            } label: {
//                Label("Confirm Changes", systemImage: "person.fill.checkmark")
//                    .frame(maxWidth: .infinity)
//            }
//            .buttonStyle(PrimaryButton())
//            .padding([.horizontal, .bottom])
//        }
//    }
//}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(DestinationData())
    }
}
