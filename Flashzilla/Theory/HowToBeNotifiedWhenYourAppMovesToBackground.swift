//
//  HowToBeNotifiedWhenYourAppMovesToBackground.swift
//  Flashzilla
//
//  Created by Sergio Sepulveda on 2021-09-09.
//

import SwiftUI

struct HowToBeNotifiedWhenYourAppMovesToBackground: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
//                print("Moving to the background")
//            }
//            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
//                print("Moving back to the foreground!")
//            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in
                print("User took a screenshot!")
            }
        
    }
}

struct HowToBeNotifiedWhenYourAppMovesToBackground_Previews: PreviewProvider {
    static var previews: some View {
        HowToBeNotifiedWhenYourAppMovesToBackground()
    }
}
