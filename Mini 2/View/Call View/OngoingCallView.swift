//
//  OngoingCallView.swift
//  Mini 2
//
//  Created by Natasha Radika on 23/06/24.
//

import SwiftUI

struct OngoingCallView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.gray,
                    Color(red: 0.2, green: 0, blue: 0.4),
                    Color(red: 0, green: 0, blue: 0.4),
                    Color.black
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
                        
            VStack(spacing: 150) {
                VStack(spacing: 10) {
                    Text("Stephanie")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(.white)
                    
                    Text("00:03")
                        .font(.system(size: 18))
                        .foregroundColor(Color(red: 0.94, green: 0.89, blue: 0.88))
                }
                
                
                Image("profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .clipped()
                Button(action: {
                    
                    print("Call Rejected")
                }) {
                    Image(systemName: "phone.down.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .padding(25)
                        .background(Color.red)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
            }
        }
    }
}

#Preview {
    OngoingCallView()
}