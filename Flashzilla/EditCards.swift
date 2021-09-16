//
//  EditCards.swift
//  Flashzilla
//
//  Created by Sergio Sepulveda on 2021-09-16.
//

import SwiftUI

struct EditCards: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var cards: [Card] = [Card]()
    @State private var newPrompt: String = ""
    @State private var newAnswer: String = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Add new card")) {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add card", action: addCard)
                }
                
                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(self.cards[index].prompt)
                                .font(.headline)
                            Text(self.cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func saveData() {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(data, forKey: "Cards")
        }
    }
    
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
            saveData()
    }
    
    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else {
            return
        }
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        saveData()
    }
}

struct EditCards_Previews: PreviewProvider {
    static var previews: some View {
        EditCards()
    }
}
