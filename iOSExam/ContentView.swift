//
//  ContentView.swift
//  iOSExam
//
//  Created by Maleeha Muzafar on 05/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        ScrollView {
            LazyVStack(pinnedViews: .sectionHeaders) {
                Section {
                    ItemView()
                    ItemView()
                    ItemView()
                } header: {
                    SearchBar(searchText: $searchText)
                }
            }
        }.clipped()
    }
}

#Preview {
    ContentView()
}
