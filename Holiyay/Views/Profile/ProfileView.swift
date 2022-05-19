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
            VStack {
                Text("Keep your identity updated")
                    .font(.title)
                    .fontWeight(.black)
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
                
                Image(systemName: "person.text.rectangle.fill")
                    .symbolRenderingMode(.hierarchical)
                    .font(.system(size: 96))
                    .foregroundColor(Color("Primary"))
                    .padding()
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
