//
//  OpeningView.swift
//  VideoCity
//
//  Created by STUDENT on 10/9/25.
//

import SwiftUI

struct OpeningView: View {
    @Binding var isLoggedIn: Bool

    var body: some View {
        ZStack {
            // BG COLOR
            Color(hex: "#EACE08")
                .ignoresSafeArea()

            VStack(spacing: 10) {
                Spacer()

                // Title
                HStack(spacing: 0) {
                    Text("Video")
                        .font(.custom("Chantilly-Serial Bold", size: 52))
                        .foregroundColor(Color(hex: "#ec4b1f"))
                    Text(" City")
                        .font(.custom("Chantilly-Serial Bold", size: 52))
                        .foregroundColor(Color(hex: "#0f2149"))
                }

                // Logo
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 150) 
                    .padding(.vertical, 5)

                // Subtitle
                Text("A Viva Entertainment Company")
                    .font(.custom("Chantilly-Serial Bold", size: 18))
                    .foregroundColor(Color(hex: "#0f2149"))
                    .padding(.top, -10)

                Spacer()

                // Start button
                Button(action: {
                    isLoggedIn = true
                }) {
                    Text("START")
                        .font(.custom("Chantilly-Serial Bold", size: 22))
                        .padding()
                        .frame(width: 180)
                        .background(Color(hex: "#ec4b1f"))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(radius: 3)
                }

                Spacer()
            }
            .padding()
        }
    }
}

/*#Preview {
    OpeningView(isLoggedIn: .constant(true))
}*/
