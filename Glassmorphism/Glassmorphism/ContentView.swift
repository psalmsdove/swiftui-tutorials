//
//  ContentView.swift
//  Glassmorphism
//
//  Created by Ali Erdem Kökcik on 5.01.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.white.opacity(0.0)]), startPoint: .top, endPoint: .bottom)
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.4), Color.blue.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            ZStack {
                Color.white.opacity(0.5)
                    .frame(width: 300, height: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                Text("Glassmorphism")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
