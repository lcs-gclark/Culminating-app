//
//  ContentView.swift
//  Culminating app
//
//  Created by Gray Clark on 2024-05-31.
//

import SwiftUI


struct FieldsListView: View {
    // MARK: Stored properties
    
    // The item currently being added
    @State var newItemDescription = ""
    
    // The search text
    @State var searchText = ""
    
    // The view model
    @State var fields: [Field] = exampleFields
    
    var body: some View {
        NavigationStack {
            VStack {
                
                List(fields) { currentField in
                    
                    
                    NavigationLink {
                        FieldDetailView(field: currentField)
                    } label: {
                        Text(currentField.title)
                    }

                    // Delete item
                    
                }
                
            }
            .searchable(text: $searchText)
            .navigationTitle("Fields")
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
    FieldsListView()
}
