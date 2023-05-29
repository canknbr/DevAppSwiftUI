//
//  CardView.swift
//  DevAppSwiftUI
//
//  Created by Can Kanbur on 29.05.2023.
//

import SwiftUI

struct CardView: View {
    var card: Card

    @State private var isFadeIn = false
    @State private var isMoveDownward = false
    @State private var isMoveUpward = false
    @State private var showAlert = false
    var feedback = UIImpactFeedbackGenerator(style: .heavy)
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(isFadeIn ? 1 : 0)
            VStack {
                Text(card.title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .italic()
            }
            .offset(y: isMoveDownward ? -218 : -300)
            Button {
                playSound(soundName: "sound-chime", soundType: "mp3")
                feedback.impactOccurred()
                showAlert.toggle()
            } label: {
                Text(card.callToAction.uppercased())
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .tint(.white)
                Image(systemName: "arrow.right.circle")
                    .font(.title)
                    .fontWeight(.medium)
                    .tint(.white)
            }.padding(.vertical).padding(.horizontal, 24).background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
                .cornerRadius(20)
                .shadow(color: Color("ColorShadow"), radius: 10, x: 0, y: 3)
                .offset(y: isMoveUpward ? 210 : 300)

        }.frame(width: 335, height: 545)
            .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
            .cornerRadius(20)
            .shadow(radius: 8)
            .onAppear {
                withAnimation(.linear(duration: 1.2)) {
                    isFadeIn.toggle()
                }
                withAnimation(.linear(duration: 0.8)) {
                    isMoveDownward.toggle()
                    isMoveUpward.toggle()
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text(card.title), message: Text(card.message), dismissButton: .default(Text("OK")))
            }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[1])
    }
}
