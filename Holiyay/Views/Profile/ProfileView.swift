//
//  ProfileView.swift
//  Holiyay
//
//  Created by MacBook Pro on 16/05/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var destinationData: DestinationData
    @State private var editProfile = false
    
    var body: some View {
        NavigationView {
            Text("Keep your identity updated")
                .font(.title)
                .fontWeight(.black)
                .frame(maxHeight: .infinity, alignment: .top)
                .toolbar {
                    Button {
                        editProfile.toggle()
                    } label: {
                        Label("Edit Profile", systemImage: "pencil")
                    }
                }
//                .sheet(isPresented: $editProfile) {
//                    ProfileEdit()
//                        .environmentObject(destinationData)
//                }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
