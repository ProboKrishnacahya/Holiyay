//
//  ProfileEdit.swift
//  Holiyay
//
//  Created by MacBook Pro on 18/05/22.
//

import SwiftUI

struct ProfileEdit: View {
    @Binding var profile: Profile
    @State var selectedCountry = 0
    
    var body: some View {
            HStack {
                Spacer()
                
                Text("Keep your identity updated")
                    .font(.title2)
                    .fontWeight(.black)
                    .padding(.top)
                
                Spacer()
            }
            .padding(.bottom)
            
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading) {
                Text("First Name")
                    .bold()
                
                TextField("First Name", text: $profile.firstName)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.name)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.white, lineWidth: 2)
                    )
            }
            
            VStack(alignment: .leading) {
                Text("Last Name")
                    .bold()
                
                TextField("Last Name", text: $profile.lastName)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.name)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.white, lineWidth: 2)
                    )
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Country of Domicile")
                    .bold()
                
                Picker(
                    "Country of Domicile",
                    selection: $selectedCountry,
                    content: {
                        ForEach(
                            0..<profile.countryOfDomicile.count,
                            content: { index in
                                Text(profile.countryOfDomicile[index])
                            }
                        )
                    }
                )
                .onChange(of: selectedCountry) { _ in
                    profile.selectedCountry = profile.countryOfDomicile[selectedCountry]
                }
                .pickerStyle(.menu)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Gender")
                    .bold()
                
                Picker("Gender", selection: $profile.gender) {
                    ForEach(Profile.Gender.allCases) { gender in
                        Text(gender.rawValue).tag(gender)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            VStack(alignment: .leading) {
                Text("Age")
                    .bold()
                
                Picker("Your age", selection: $profile.age) {
                    ForEach(1...100, id: \.self) { age in
                        Text("\(age)")
                    }
                }
                .pickerStyle(.menu)
            }
        }
        .frame(alignment: .top)
        
        Spacer()
    }
}

struct ProfileEdit_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEdit(profile: .constant(.default))
    }
}
