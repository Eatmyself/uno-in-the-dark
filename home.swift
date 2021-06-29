//
//  home.swift
//  uno
//
//  Created by Eatmyself on 2021/3/24.
//

import SwiftUI

struct home: View {
    @State private var about = false
    var body: some View {
        NavigationView{
            ZStack{
                Image("home")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    NavigationLink(destination: ContentView()){
                        Text("Start Game")
                            .padding()
                            .frame(width: 140,height: 40)
                            .background(Color.white)
                            .cornerRadius(40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    Button(action: {
                            about = true
                        }) {
                        Image(systemName: "info.circle")
                            .padding()
                    }
                    .sheet(isPresented: $about) {
                        uno.about()
                    }
                }
            }
        }
    }
}

struct about: View {
    var body: some View {
        Image("about")
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .edgesIgnoringSafeArea(.all)
    }
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        home()
    }
}
