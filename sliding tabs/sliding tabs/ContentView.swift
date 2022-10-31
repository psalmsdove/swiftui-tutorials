//
//  ContentView.swift
//  sliding tabs
//
//  Created by Ali Erdem Kökcik on 31.10.2022.
//

import SwiftUI
import SlidingTabView

struct ContentView: View {
    @State private var tabIndex = 0
    var body: some View {
        VStack {
            SlidingTabView(selection: $tabIndex, tabs: ["home","friends", "settings"], animation: .easeInOut, activeTabColor: .black)
            Spacer()
            if tabIndex == 0 {
                Text("home")
            } else if tabIndex == 1{
                Text("friends")
            } else if tabIndex == 2{
                Text("settings")
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
