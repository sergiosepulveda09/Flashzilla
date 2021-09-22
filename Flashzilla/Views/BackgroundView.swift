//
//  BackgroundView.swift
//  Flashzilla
//
//  Created by Sergio Sepulveda on 2021-09-22.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Image(decorative: "background")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}


struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
