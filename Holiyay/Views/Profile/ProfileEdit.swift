//
//  ProfileEdit.swift
//  Holiyay
//
//  Created by MacBook Pro on 18/05/22.
//

import SwiftUI

struct ProfileEdit: View {
    @Binding var profile: Profile
    @State private var selectedCountry = 0
    @State private var number: Int = 1
    
    let countryOfDomicile = [
        "Afghanistan",
        "Albania",
        "Algeria",
        "Andorra",
        "Angola",
        "Antigua and Barbuda",
        "Argentina",
        "Armenia",
        "Australia",
        "Austria",
        "Azerbaijan",
        "Bahamas",
        "Bahrain",
        "Bangladesh",
        "Barbados",
        "Belarus",
        "Belgium",
        "Belize",
        "Benin (Dahomey)",
        "Bolivia",
        "Bosnia and Herzegovina",
        "Botswana",
        "Brazil",
        "Brunei",
        "Brunswick and Lüneburg",
        "Bulgaria",
        "Burkina Faso (Upper Volta)",
        "Burma",
        "Burundi",
        "Cabo Verde",
        "Cambodia",
        "Cameroon",
        "Canada",
        "Cayman Islands",
        "Central African Republic",
        "Chad",
        "Chile",
        "China",
        "Colombia",
        "Comoros",
        "Congo Free State",
        "Costa Rica",
        "Cote d’Ivoire (Ivory Coast)",
        "Croatia",
        "Cuba",
        "Cyprus",
        "Czechia",
        "Czechoslovakia"
    ]
    
    var body: some View {
        List {
            VStack(alignment: .center) {
                Text("Keep your identity updated")
                    .font(.title2)
                    .fontWeight(.black)
            }
            
            VStack(alignment: .leading) {
                Text("First Name").bold()
                TextField("First Name", text: $profile.firstName)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.name)
            }
            
            VStack(alignment: .leading) {
                Text("Last Name").bold()
                TextField("Last Name", text: $profile.lastName)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.name)
            }
            
            
            VStack(alignment: .leading) {
                Picker("Country of Domicile", selection: $selectedCountry) {
                    ForEach(0..<countryOfDomicile.count) {
                        Text(countryOfDomicile[$0])
                    }
                }
                .pickerStyle(.inline)
                .font(.body)
                .padding(.top, 1)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Gender").bold()
                    .padding(.top, 5)
                
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
