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
    @State var fieldModel = FieldListViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                
                List($fieldModel.fields) { $field in
                    
                    
                    fieldsDetail(currentItem: $field)
                    // Delete item
                        .swipeActions {
                            Button(
                                "Delete",
                                role: .destructive,
                                action: {
                                    fieldModel.delete(field)
                                }
                            )
                        }
                }
                    
                }
                .searchable(text: $searchText)
                HStack {
                    TextField("Enter a new field", text: $newItemDescription)
                    
                    Button("ADD") {
                        // Add the new to-do item
                        FieldListViewModel().createField(withTitle: newItemDescription)
                    }
                    .font(.caption)
                }
                .padding(20)
                
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
            
            .font(.title)
            
        }
        
        
        
    }

#Preview {
    ContentView()
}
