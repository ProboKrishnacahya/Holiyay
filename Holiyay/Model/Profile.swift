//
//  Profile.swift
//  Holiyay
//
//  Created by MacBook Pro on 11/05/22.
//

import Foundation

struct Profile {
    var firstName: String
    var lastName: String
    //var countryOfDomicile: [DropdownOption]
    var gender = Gender.male
    var age: Int
    
    static let `default` = Profile(firstName: "Probo", lastName: "Krishnacahya", age: 19)
    
    enum Gender: String, CaseIterable, Identifiable {
        case male = "Male"
        case female = "Female"
        case none = "Rather not say"
        
        var id: String { rawValue }
    }
}
