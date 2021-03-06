//
//  SupportingSpecificAccessibilityNeeds.swift
//  Flashzilla
//
//  Created by Sergio Sepulveda on 2021-09-09.
//

import SwiftUI

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct SupportingSpecificAccessibilityNeeds: View {
    
//    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
//    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale: CGFloat = 1
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    
    var body: some View {
//        HStack {
//            if differentiateWithoutColor {
//                Image(systemName: "checkmark.circle")
//            }
//            Text("Success")
//        }
//        .padding()
//        .background(differentiateWithoutColor ? Color.black : Color.green)
//        .foregroundColor(Color.white)
//        .clipShape(Capsule())
        Text("hello World")
//            .scaleEffect(scale)
//            .onTapGesture {
//                    withOptionalAnimation {
//                        self.scale += 1.5
//                    }
//            }
            .padding()
            .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
            .foregroundColor(Color.white)
            .clipShape(Circle())
    }
}

struct SupportingSpecificAccessibilityNeeds_Previews: PreviewProvider {
    static var previews: some View {
        SupportingSpecificAccessibilityNeeds()
    }
}
