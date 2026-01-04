//
//  Question.swift
//  HPTrivia
//
//  Created by Mahesh Bansode on 04/01/26.
//

struct Question: Decodable {
    let id: Int
    let question: String
    let answers: String
    let wrong: [String]
    let book: Int
    let hint: String
}
