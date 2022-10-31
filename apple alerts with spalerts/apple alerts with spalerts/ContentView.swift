//
//  ContentView.swift
//  apple alerts with spalerts
//
//  Created by Ali Erdem Kökcik on 31.10.2022.
//

import SwiftUI
import SPAlert

struct ContentView: View {
    // MARK: we first set the alerts false initially
    @State private var showAlert = false
    @State private var showAlert2 = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("show alert"){
                showAlert.toggle()
            }
            // MARK: alert will show learning is easy! for 1 sec.
            .SPAlert(isPresent: $showAlert,
                     message: "learning is easy!",
                     duration: 1)
            // MARK: alert example 2:
            
            Button("show alert 2"){
                showAlert2.toggle()
            }
            .tint(.orange)
            .SPAlert(isPresent: $showAlert2,
                     title: "ali erdem kokcik",
                     message: "this is the alert 2",
                     duration: 1.5,
            dismissOnTap: false, //it won't go away when you tap on the alert
                     preset: .heart, // it will show heart icon
                     haptic: .success,
                     layout: .init(),
                     completion: {
                print("this alert has been completed!")
                showAlert.toggle()
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
