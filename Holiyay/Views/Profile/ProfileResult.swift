//
//  ProfileResult.swift
//  Holiyay
//
//  Created by MacBook Pro on 20/05/22.
//

import SwiftUI

struct ProfileResult: View {
    @EnvironmentObject var destinationData: DestinationData
    
    var profile: Profile
    
    var body: some View {
        NavigationView {
            VStack {
                (Text("Hello, ") +
                 Text("\(profile.firstName) \(profile.lastName) \u{1F44B}"))
                    .font(.system(size: 26))
                    .fontWeight(.black)
                
                VStack() {
                    Image(systemName: "person.text.rectangle.fill")
                        .symbolRenderingMode(.hierarchical)
                        .font(.system(size: 96))
                        .foregroundColor(Color("Primary"))
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("\(Image(systemName: "quote.opening"))  First Name")
                            .bold()
                        Text(profile.firstName)
                            .foregroundColor(Color("Muted"))
                        
                        Text("\(Image(systemName: "quote.closing"))  Last Name")
                            .bold()
                        Text(profile.lastName)
                            .foregroundColor(Color("Muted"))
                        
                        (Text("\(Image(systemName: "flag.fill"))  Country of Domicile") +
                         Text("                        "))
                            .bold()
                        Text(profile.lastName)
                            .foregroundColor(Color("Muted"))
                        
                        Text("\(Image(systemName: "figure.stand"))  Gender")
                            .bold()
                        Text(profile.gender.rawValue)
                            .foregroundColor(Color("Muted"))
                        
                        Text("\(Image(systemName: "number"))  Age")
                            .bold()
                        Text(profile.age.description)
                            .foregroundColor(Color("Muted"))
                    }
                    .font(.title3)
                    .padding(.bottom)
                }
                .frame(width: UIScreen.main.bounds.width - 75)
                .padding()
                .background(Color("Component"))
                .foregroundColor(.white)
                .cornerRadius(16)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top)
            .navigationBarHidden(true)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileResult(profile: Profile.default)
            .environmentObject(DestinationData())
    }
}
