//
//  ExploreCardView.swift
//  Holiyay
//
//  Created by MacBook Pro on 19/05/22.
//

import SwiftUI

struct Card {
    let prompt: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?")
}

struct ExploreCardView: View {
    let card: Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color("Component"))
                .padding()
                .frame(height: 200)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .padding()
        }
    }
}

struct ExploreCardView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreCardView(card: Card.example)
    }
}
