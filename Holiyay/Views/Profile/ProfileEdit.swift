//
//  ProfileEdit.swift
//  Holiyay
//
//  Created by MacBook Pro on 18/05/22.
//

import SwiftUI

struct ProfileEdit: View {
    @Binding var profile: Profile
    
    var body: some View {
        List {
            HStack {
                Spacer()
                Text("Keep your identity updated")
                    .font(.title2)
                    .fontWeight(.black)
                Spacer()
            }
            .padding(.bottom)
            
            VStack(alignment: .leading) {
                Text("First Name").bold()
                TextField("First Name", text: $profile.firstName)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.name)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.white, lineWidth: 2)
                    )
            }
            
            VStack(alignment: .leading) {
                Text("Last Name").bold()
                TextField("Last Name", text: $profile.lastName)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.name)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.white, lineWidth: 2)
                    )
            }
            
            VStack(alignment: .leading) {
                Text("Country of Domicile").bold()
                
                Picker("Country of Domicile", selection: $profile.countryOfDomicile) {
                    ForEach(0..<profile.countryOfDomicile.count) {
                        Text(profile.countryOfDomicile[$0])
                    }
                }
                .pickerStyle(.menu)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Gender").bold()
                
                Picker("Gender", selection: $profile.gender) {
                    ForEach(Profile.Gender.allCases) { gender in
                        Text(gender.rawValue).tag(gender)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            VStack(alignment: .leading) {
                Text("Age").bold()
                
                Picker("Your age", selection: $profile.age) {
                    ForEach(1...100, id: \.self) { age in
                        Text("\(age)")
                    }
                }
                .pickerStyle(.menu)
            }
        }
        .listStyle(.sidebar)
    }
}

struct ProfileEdit_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEdit(profile: .constant(.default))
    }
}
