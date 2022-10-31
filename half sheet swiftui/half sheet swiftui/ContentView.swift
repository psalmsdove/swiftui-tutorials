//
//  ContentView.swift
//  half sheet swiftui
//
//  Created by Ali Erdem Kökcik on 31.10.2022.
//

import SwiftUI
import HalfASheet

struct ContentView: View {
    @State private var isShowing = false
    @State private var amount = 0.0
    
    var body: some View {
        ZStack {
            Button("show sheet") {
                isShowing.toggle()
            }
            HalfASheet(isPresented: $isShowing, title: "rotation") {
                VStack(spacing: 20) {
                    Image(systemName: "leaf")
                        .font(.system(size: 80))
                        .foregroundColor(.blue)
                        .rotation3DEffect(Angle(degrees: amount), axis: (x: -1, y: -1, z: 0))
                    
                    Slider(value: $amount, in: 0...360)
                    
                    Text("degrees: \(Int(amount))")
                        .italic()
                }
                .padding()
            }
            // Customise by editing these.
            .height(.proportional(0.40))
            .closeButtonColor(UIColor.white)
            .backgroundColor(.white)
            .contentInsets(EdgeInsets(top: 30, leading: 10, bottom: 30, trailing: 10))
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
