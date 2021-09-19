//
//  CardView.swift
//  Flashzilla
//
//  Created by Sergio Sepulveda on 2021-09-15.
//

import SwiftUI

struct CardView: View {
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @State private var isShowingAnswer: Bool = false
    @State private var offset: CGSize = CGSize.zero
    let card: Card
    var removal: (() -> Void)? = nil
    @State private var feedback = UINotificationFeedbackGenerator()
    @Environment(\.accessibilityEnabled) var accessibilityEnabled
    @State private var threshHoldFailed: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(differentiateWithoutColor ? Color.white : threshHoldFailed ? Color.red.opacity(0.9) : Color.white.opacity(1 - Double(abs(offset.width / 50))))
//                .background(
//                    differentiateWithoutColor ? nil : RoundedRectangle(cornerRadius: 25, style: .continuous)
//                        .fill(offset.width > 0 ? Color.green : Color.red)
//
//
//                )
                .modifier(backgroundColorTry(differentiateWithoutColor: differentiateWithoutColor, offset: offset, threshHoldFailed: threshHoldFailed))
                .shadow(radius: 10)
            
            VStack {
                if accessibilityEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(Color.black)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(Color.black)
    
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                }
                
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5 , y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibility(addTraits: .isButton)
        .gesture(
        
            DragGesture()
                .onChanged { gesture in
                    self.threshHoldFailed = false
                    self.offset = gesture.translation
                    self.feedback.prepare()
                }
                .onEnded { _ in
                    if abs(self.offset.width) > 100 {
                        if self.offset.width > 0 {
                            self.feedback.notificationOccurred(.success)
                        } else {
                            self.feedback.notificationOccurred(.error)
                        }
                        
                        self.removal?()
                    } else {
                        self.offset = .zero
                        self.threshHoldFailed = true
                    }
                }
            
        )
        .onTapGesture {
            self.isShowingAnswer.toggle()
        }
        .animation(.spring())
    }
    
    func returning(eraseFailed: Bool) -> Color? {
        if eraseFailed == true {
            return Color.red
        }
        return nil
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}


struct backgroundColorTry: ViewModifier {
    var differentiateWithoutColor: Bool
    var offset: CGSize
    var threshHoldFailed: Bool
    func body(content: Content) -> some View {
        
        content
            .background(
                differentiateWithoutColor ? nil : RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(threshHoldFailed ? Color.red : offset.width > 0 ? Color.green : Color.red)
            )
                

    }
}
