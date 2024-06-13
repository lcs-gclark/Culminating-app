//
//  fieldsDetail.swift
//  Culminating app
//
//  Created by Gray Clark on 2024-06-06.
//

import SwiftUI



struct FieldDetailView: View {
    
    let field: Field
    
    @State private var acrage = ""
    
    @State private var crop = ""
    
    var body: some View {
        
        Text("Field")
        HStack {
            Group {
            
            TextField("Acrage", text: $acrage)
            .textFieldStyle(.roundedBorder)
            
                
            }
            .padding(.horizontal)
            Text("Acres")
                .padding(.horizontal)
        }
        HStack {
            Group {
            
            TextField("crop", text: $crop)
            .textFieldStyle(.roundedBorder)
            
                
            }
            .padding(.horizontal)
            Text("Crop")
                .padding(.horizontal)
        }
            
    }
}

#Preview {
    FieldDetailView(field: firstField)
}
