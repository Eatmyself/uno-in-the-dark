//
//  ContentView.swift
//  uno
//
//  Created by Eatmyself on 2021/3/19.
//

import SwiftUI

struct ContentView: View {
    let cards=[
        card(color:"r",number:"1",pic:"r1"),
        card(color:"r",number:"2",pic:"r2"),
        card(color:"r",number:"3",pic:"r3"),
        card(color:"r",number:"4",pic:"r4"),
        card(color:"r",number:"5",pic:"r5"),
        card(color:"r",number:"6",pic:"r6"),
        card(color:"r",number:"7",pic:"r7"),
        card(color:"r",number:"8",pic:"r8"),
        card(color:"r",number:"9",pic:"r9"),
        card(color:"r",number:"0",pic:"r0"),
        card(color:"r",number:"d",pic:"rd"),
        card(color:"g",number:"1",pic:"g1"),
        card(color:"g",number:"2",pic:"g2"),
        card(color:"g",number:"3",pic:"g3"),
        card(color:"g",number:"4",pic:"g4"),
        card(color:"g",number:"5",pic:"g5"),
        card(color:"g",number:"6",pic:"g6"),
        card(color:"g",number:"7",pic:"g7"),
        card(color:"g",number:"8",pic:"g8"),
        card(color:"g",number:"9",pic:"g9"),
        card(color:"g",number:"0",pic:"g0"),
        card(color:"g",number:"d",pic:"gd"),
        card(color:"y",number:"1",pic:"y1"),
        card(color:"y",number:"2",pic:"y2"),
        card(color:"y",number:"3",pic:"y3"),
        card(color:"y",number:"4",pic:"y4"),
        card(color:"y",number:"5",pic:"y5"),
        card(color:"y",number:"6",pic:"y6"),
        card(color:"y",number:"7",pic:"y7"),
        card(color:"y",number:"8",pic:"y8"),
        card(color:"y",number:"9",pic:"y9"),
        card(color:"y",number:"0",pic:"y0"),
        card(color:"y",number:"d",pic:"yd"),
        card(color:"b",number:"1",pic:"b1"),
        card(color:"b",number:"2",pic:"b2"),
        card(color:"b",number:"3",pic:"b3"),
        card(color:"b",number:"4",pic:"b4"),
        card(color:"b",number:"5",pic:"b5"),
        card(color:"b",number:"6",pic:"b6"),
        card(color:"b",number:"7",pic:"b7"),
        card(color:"b",number:"8",pic:"b8"),
        card(color:"b",number:"9",pic:"b9"),
        card(color:"b",number:"0",pic:"b0"),
        card(color:"b",number:"d",pic:"bd"),

    ]
    @State private var who = true
    @State private var computer:Array<Int> = [Int.random(in: 0...43),Int.random(in: 0...43),Int.random(in: 0...43),Int.random(in: 0...43),Int.random(in: 0...43)]
    @State private var player:Array<Int> = [Int.random(in: 0...43),Int.random(in: 0...43),Int.random(in: 0...43),Int.random(in: 0...43),Int.random(in: 0...43)]
    @State private var Pscore = 3
    @State private var Cscore = 3
    @State private var count = 0
    @State private var whowin = 0
    @State private var whowin2 = 0
    @State private var showAlert = false
    @State private var now : card = card(color:"x",number:"x",pic:"uno")
    @State private var que:Array<Int>=[]
    var body: some View {
        ZStack{
            Image("圖片1")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            HStack{
                VStack{
                    if player.count==1{
                        Image("lastone")
                            .resizable()
                            .frame(width: 35, height: 30)
                    }else{
                        Image("blank")
                            .resizable()
                            .frame(width: 35, height: 30)
                    }
                    Text("Player：")
                        .fontWeight(.heavy)
                    Text("\(Pscore)")
                        .fontWeight(.heavy)
                }
                Spacer()
                VStack{
                    if computer.count==1{
                        Image("lastone")
                            .resizable()
                            .frame(width: 35, height: 30)
                    }else{
                        Image("blank")
                            .resizable()
                            .frame(width: 35, height: 30)
                    }
                    Text("Computer：")
                        .fontWeight(.heavy)
                    Text("\(Cscore)")
                        .fontWeight(.heavy)
                    
                }
            }
            .foregroundColor(Color.white)
            .font(.title2)
            .offset(x: 0, y: -350)
            if player.count == 0{
                Text("YOU WIN")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .offset(y:-150)
            }else if computer.count == 0{
                Text("YOU LOSE")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .offset(y:-150)
            }
            
            VStack{
                HStack{
                    ForEach(computer.indices, id: \.self) { w in
                        VStack{
                            //Text("\(cards[computer[w]].pic)")
                            Image("uno")
                        }
                    }
                }
                .position(x: 200, y: 370)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(player.indices, id: \.self) { (index) in
                            Button(action: {
                                if (now.color == cards[player[index]].color || now.number == cards[player[index]].number || now.color == "x") && who{
                                    if cards[player[index]].number == "d"{
                                        computer.append(Int.random(in: 0...43))
                                        computer.append(Int.random(in: 0...43))
                                    }
                                    now = cards[player[index]]
                                    player.remove(at: index)
                                    count = count + 1
                                }
                                if player.count == 0{
                                    who = false
                                    whowin = 1
                                    if Cscore == 1 {
                                        showAlert = true
                                        whowin2 = 1
                                    }
                                }
                                }) {
                            Image(cards[player[index]].pic)
                            }
                        }
                    }
                }
            }
            if now.color != "x"{
                Image(now.pic)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .position(x: 200, y: 520)
            }
            Button(action: {
                    if who{
                        player.append(Int.random(in: 0...43))
                    }
                }) {
                Image("unos")
                    .resizable()
                    .frame(width: 70, height: 70)
            }
            .offset(x: 160, y: 140)
            if who{
                Text("Your Turn")
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .offset(x: 0, y: -200)
            }
            if who && count>0{
                Button("change player"){
                    who = false
                    count = 0
                    que = []
                    var tmp=true
                    while tmp || count == 0{
                        tmp = false
                        for index in 0...computer.count{
                            if index >= computer.count{
                                break
                            }
                            if now.color == cards[computer[index]].color || now.number == cards[computer[index]].number{
                                if cards[computer[index]].number == "d"{
                                    player.append(Int.random(in: 0...43))
                                    player.append(Int.random(in: 0...43))
                                }
                                que.append(computer[index])
                                computer.remove(at: index)
                                count = count + 1
                                tmp = true
                            }
                        }
                        if count == 0{
                            computer.append(Int.random(in: 0...43))
                        }
                    }
                    print(que)
                    for t in 0...que.count{
                        if t >= que.count{
                            break
                        }
                        Timer.scheduledTimer(withTimeInterval: TimeInterval((2 * t)), repeats: false) { (_) in
                            now = cards[que[t]]
                            
                        }
                    }
                    Timer.scheduledTimer(withTimeInterval: TimeInterval((2 * que.count)), repeats: false) { (_) in
                        who = true
                    }
                    count = 0
                    if computer.count == 0{
                        who = false
                        whowin = 2
                        if Pscore == 1 {
                            showAlert = true
                            whowin2 = 2
                        }
                    }
                }
                .padding()
                .frame(width: 140,height: 40)
                .background(Color.white)
                .cornerRadius(40)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.white, lineWidth: 2)
                )
                .offset(x: 0, y: -100)
            }
            if whowin != 0 && whowin2 == 0{
                Button("Next game"){
                    if whowin == 1{
                        Pscore = Pscore + 1
                        Cscore = Cscore - 1
                    }else if whowin == 2{
                        Pscore = Pscore - 1
                        Cscore = Cscore + 1
                    }
                    who = true
                    computer = [Int.random(in: 0...43),Int.random(in: 0...43),Int.random(in: 0...43),Int.random(in: 0...43),Int.random(in: 0...43)]
                    player = [Int.random(in: 0...43),Int.random(in: 0...43),Int.random(in: 0...43),Int.random(in: 0...43),Int.random(in: 0...43)]
                    count = 0
                    whowin = 0
                    now = card(color:"x",number:"x",pic:"uno")
                }
                .padding()
                .frame(width: 140,height: 40)
                .background(Color.white)
                .cornerRadius(40)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.white, lineWidth: 2)
                )
                .offset(x: 0, y: -100)
            }
            
        }
        .sheet(isPresented: $showAlert) {
            uno.sheet(winner: whowin2)
        }

    }
}

struct sheet: View {
    @Environment(\.presentationMode) var presentationMode
    var winner: Int
    
    var body: some View {
        ZStack{
            if winner == 1{
                Image("win")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
            }
            else{
                Image("lose")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
            }
            
            VStack{
                if winner == 1{
                    Text("行吧你贏了")
                        .foregroundColor(Color.white)
                }
                else{
                    Text("可悲仔，連電腦都能打輸")
                        .foregroundColor(Color.white)
                }
                Button("back"){
                    presentationMode.wrappedValue.dismiss()
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
