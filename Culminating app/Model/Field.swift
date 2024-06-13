//
//  TodoItem.swift
//  TodoList
//
//  Created by Russell Gordon on 2024-04-08.
//

import Foundation

struct Field: Identifiable, Codable {
    var id = UUID()
    var title: String
    var done:  Bool
}

let firstField = Field(title: "Wheat", done: false)

let secondField = Field(title: "Corn", done: true)

let thirdField = Field(title: "Soy", done: false)

let exampleFields = [
    
    firstField
    ,
    secondField
    ,
    thirdField
    ,
    
]

