//
//  BookmarkButton.swift
//  Holiyay
//
//  Created by MacBook Pro on 03/06/22.
//

import SwiftUI

struct BookmarkButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "bookmark.fill" : "bookmark")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? Color("Accent") : Color("Accent"))
        }
    }
}

struct BookmarkButton_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkButton(isSet: .constant(true))
    }
}
