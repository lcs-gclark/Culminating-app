//
//  ContentView.swift
//  Culminating app
//
//  Created by Gray Clark on 2024-05-31.
//

import SwiftUI


struct ContentView: View {
    // MARK: Stored properties
    
    // The item currently being added
    @State var newItemDescription = ""
    
    // The search text
    @State var searchText = ""
    
    // The view model
    @State var fields: [FieldItem] = exampleItems
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Enter a new field", text: $newItemDescription)
                    
                    Button("ADD") {
                        // Add the new to-do item
                        $fields.createField(withTitle: newItemDescription)
                    }
                    .font(.caption)
                }
                .padding(20)
            }
            .navigationTitle("Navigation Bar Buttons")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "cloud.drizzle")
                            .padding(.horizontal)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Info", action: { })
                }
            }
            .tint(.blue)
            
        }
        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        .font(.title)
        
    }
    
    func createField(withTitle title: String){
        
        let Field = FieldItem (title: title, done: false)
        
        self.fields.append(Field)
    }
    
}

#Preview {
    ContentView()
}
