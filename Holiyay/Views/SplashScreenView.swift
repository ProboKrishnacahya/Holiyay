//
//  SplashscreenView.swift
//  Holiyay
//
//  Created by MacBook Pro on 04/05/22.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.75
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 50)
                    Text("Holiyay")
                        .fontWeight(.black)
                        .foregroundColor(Color("Primary"))
                        .font(.system(size: 60))
                        .padding(.bottom)
                    Text("&copy; 2022 Archotech")
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.5)) {
                        self.size = 0.85
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self.isActive = true
                }
            }
            .statusBar(hidden: true)
        }
    }
}

struct SplashscreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
            .previewInterfaceOrientation(.portrait)
    }
}
