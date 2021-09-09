//
//  TriggeringEventsRepeadtlyUsingATimer.swift
//  Flashzilla
//
//  Created by Sergio Sepulveda on 2021-09-09.
//

import SwiftUI

struct TriggeringEventsRepeadtlyUsingATimer: View {
    
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer){ time in
                if self.counter == 5 {
                    self.timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                
                self.counter += 1
            }
    }
}

struct TriggeringEventsRepeadtlyUsingATimer_Previews: PreviewProvider {
    static var previews: some View {
        TriggeringEventsRepeadtlyUsingATimer()
    }
}
