//
//  ContentView.swift
//  iOSExam
//
//  Created by Maleeha Muzafar on 05/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        
        if viewModel.menu.categories.isEmpty {
            NoDataFallback(heading: "Oh No", text: "Our menu is having some trouble")
        }
        else {
            ScrollView(.vertical) {
                VStack {
                    ImageCarousel(index: $viewModel.currentCategoryIndex, images: viewModel.categoryImages)
                    
                    LazyVStack(pinnedViews: .sectionHeaders) {
                        Section {
                            if (viewModel.filteredItems.isEmpty) {
                                NoDataFallback(heading: "No results for \(viewModel.searchText)", text: "Check the spelling or try a new search")
                            } else {
                                ForEach(viewModel.filteredItems) { item in
                                    ItemView(item: item)
                                        .id(item.id)
                                }
                            }
                        } header: {
                            SearchBar(searchText: $viewModel.searchText)
                        }
                    }
                    .animation(.spring, value: viewModel.currentCategoryIndex)
                }
                .padding(.vertical)
            }
            .clipped()
        }
    }
}

#Preview {
    ContentView()
}
