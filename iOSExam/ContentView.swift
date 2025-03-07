//
//  ContentView.swift
//  iOSExam
//
//  Created by Maleeha Muzafar on 05/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentIndex = 0
    @State private var searchText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                ImageCarousel(index: $currentIndex, images: ["burgers", "pizzas", "desserts"])
                
                LazyVStack(pinnedViews: .sectionHeaders) {
                    Section {
                        ItemView()
                        ItemView()
                        ItemView()
                    } header: {
                        SearchBar(searchText: $searchText)
                    }
                }
            }.padding(.vertical)
        }.clipped()
    }
}

#Preview {
    ContentView()
}
