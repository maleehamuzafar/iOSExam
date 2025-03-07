//
//  SearchBar.swift
//  iOSExam
//
//  Created by Maleeha Muzafar on 07/03/2025.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("Search...", text: $searchText)
                    .padding(3)
                    .focused($isFocused)
                    .background(.clear)
                    .submitLabel(.search)
                    .onSubmit {
                        isFocused = false
                    }
                
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                        isFocused = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.primary)
                    }
                }
            }
            .padding(Constants.padding)
            .background(Color(.systemGray6))
            .cornerRadius(Constants.cornerRadius)
            .shadow(color: Color.black.opacity(Constants.shadowOpacity), radius: 4, x: 0, y: 2)
        }
        .padding()
        .background(Color(.systemGray5))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SearchBar(searchText: .constant(""))
}
