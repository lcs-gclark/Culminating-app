//
//  TodoItem.swift
//  TodoList
//
//  Created by Russell Gordon on 2024-04-08.
//

import Foundation

struct FieldItem: Identifiable, Codable {
    var id: Int?
    var title: String
    var done:  Bool
}

let firstItem = FieldItem(title: "Study for Chemisty quiz", done: false)

let secondItem = FieldItem(title: "Finish Computer Science assignment", done: true)

let thirdItem = FieldItem(title: "Go for a run around campus", done: false)

let exampleItems = [
    
    firstItem
    ,
    secondItem
    ,
    thirdItem
    ,
    
]

