//
//  ContentView.swift
//  DevAppSwiftUI
//
//  Created by Can Kanbur on 29.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack (alignment:.center,spacing: 20){
                ForEach(cardData) { item in
                    CardView(card: item)
                }
            }.padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
