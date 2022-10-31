//
//  CardView.swift
//  tinder cards
//
//  Created by Ali Erdem Kökcik on 31.10.2022.
//

import SwiftUI

struct CardView: View {
    var person: String
    @State private var offset = CGSize.zero
    @State private var color: Color = .black
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 380, height: 420)
                .foregroundColor(color.opacity(0.9))
                .shadow(radius: 8)
            HStack{
                Text(person)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
        }
        .offset(x: offset.width * 1, y: offset.height * 0.4)
                .rotationEffect(.degrees(Double(offset.width / 40)))
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            offset = gesture.translation
                            withAnimation {
                                changeColor(width: offset.width)
                            }
                        }
                        .onEnded { _ in
                            withAnimation {
                                swipeCard(width: offset.width)
                                changeColor(width: offset.width)
                            }
                        }
                )
            }
    func swipeCard(width: CGFloat) {
            switch width {
            case -500...(-150):
                print("\(person) removed")
                offset = CGSize(width: -500, height: 0)
            case 150...500:
                print("\(person) added")
                offset = CGSize(width: 500, height: 0)
            default:
                offset = .zero
            }
        }
    func changeColor(width: CGFloat) {
            switch width {
            case -500...(-130):
                color = .red
            case 130...500:
                color = .green
            default:
                color = .black
            }
        }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(person: "mario")
    }
}
