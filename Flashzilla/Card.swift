//
//  Card.swift
//  Flashzilla
//
//  Created by Sergio Sepulveda on 2021-09-15.
//

import Foundation

struct Card: Codable {
    let prompt: String
    let answer: String
    
    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
