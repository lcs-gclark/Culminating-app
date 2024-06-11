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
    @State var viewModel = TodoListViewModel()

    
    var body: some View {
        NavigationStack {
        VStack {
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
        HStack {
            TextField("Enter a new field", text: $newItemDescription)
            
            Button("ADD") {
                // Add the new to-do item
                viewModel.createToDo(withTitle: newItemDescription)
            }
            .font(.caption)
        }
        .padding(20)
    }
       
}

#Preview {
    ContentView()
}
