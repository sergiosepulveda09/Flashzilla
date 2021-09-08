//
//  DisablingUserInteractivity.swift
//  Flashzilla
//
//  Created by Sergio Sepulveda on 2021-09-08.
//

import SwiftUI

struct DisablingUserInteractivity: View {
    var body: some View {
//        ZStack {
//            Rectangle()
//                .fill(Color.blue)
//                .frame(width: 300, height: 300)
//                .onTapGesture {
//                    print("Rectangle tapped")
//                }
//            Circle()
//                .fill(Color.red)
//                .frame(width: 300, height: 300)
//                .contentShape(Rectangle())
//                .onTapGesture {
//                    print("Circle tapped")
//                }
//                .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
//
//        }
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(Rectangle()) //To make the spacer tappable
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

struct DisablingUserInteractivity_Previews: PreviewProvider {
    static var previews: some View {
        DisablingUserInteractivity()
    }
}
