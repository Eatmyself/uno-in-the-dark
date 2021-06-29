//
//  test.swift
//  uno
//
//  Created by Eatmyself on 2021/3/20.
//

import SwiftUI

struct test: View {
    @State private var a=[1,2,3]
    var body: some View {
        VStack{
            ForEach(a.indices, id: \.self) { (index) in
                Text("\(a[index])")
            }
            Button("haha"){
                a[0]=5
                a.append(7)
                print(a)
            }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}


