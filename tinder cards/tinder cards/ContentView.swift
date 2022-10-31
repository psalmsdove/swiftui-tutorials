//
//  ContentView.swift
//  tinder cards
//
//  Created by Ali Erdem Kökcik on 31.10.2022.
//

import SwiftUI

struct ContentView: View {
    private var people: [String] = ["mario", "luigi", "peach", "toad", "daisy"].reversed()
    var body: some View {
        VStack {
            ZStack{
                ForEach(people, id: \.self){ person in
                    CardView(person: person)
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
