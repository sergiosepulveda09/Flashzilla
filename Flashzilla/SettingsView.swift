//
//  SettingsView.swift
//  Flashzilla
//
//  Created by Sergio Sepulveda on 2021-09-22.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var returnCard: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $returnCard) {
                    Text("Do you want to return the card to the end of the stack?")
                }
            }
            
            .navigationBarTitle("Settings")
            .navigationBarItems(trailing: Button("Done", action: dismiss))
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(returnCard: .constant(false))
    }
}
