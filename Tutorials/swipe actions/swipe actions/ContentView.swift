//
//  ContentView.swift
//  swipe actions
//
//  Created by Ali Erdem Kökcik on 30.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var nameList = ["mario", "luigi", "toad", "peach", "bowser"]
    var body: some View {
        VStack {
            List{
                ForEach(nameList, id: \.self){ name in
                    Text(name)
                        .padding()
                    // MARK: where we implement the swipe actions.
                        .swipeActions{
                            Button(role: .destructive){
                                //todo delete
                            } label: {
                                Label("delete", systemImage: "trash.fill")
                            }
                        }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
