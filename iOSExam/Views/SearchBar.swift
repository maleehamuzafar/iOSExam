//
//  SearchBar.swift
//  iOSExam
//
//  Created by Maleeha Muzafar on 07/03/2025.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("Search...", text: $searchText)
                    .padding(3)
                    .background(.clear)
            }
            .padding(Constants.defaultPadding)
            .background(Color(.systemGray6))
            .cornerRadius(Constants.defaultCornerRadius)
            .shadow(color: Color.black.opacity(Constants.shadowOpacity), radius: 4, x: 0, y: 2)
        }
        .padding()
        .background(Color(.systemGray5))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SearchBar(searchText: .constant(""))
}
