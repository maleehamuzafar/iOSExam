//
//  ContentView+ViewModel.swift
//  iOSExam
//
//  Created by Maleeha Muzafar on 07/03/2025.
//

import Foundation

extension ContentView {
    class ViewModel: ObservableObject {
        
        @Published var menu: MenuData = DataStore.loadData()
        @Published var currentCategoryIndex = 0
        @Published var searchText: String = ""
        
        var categoryImages: CarouselImages {
            menu.categories.map{ $0.imageURL }
        }
        
        var filteredItems: [Item] {
            guard !menu.categories.isEmpty else { return [] }
            guard !searchText.isEmpty else { return menu.categories[currentCategoryIndex].items }
            return menu.categories[currentCategoryIndex].items.filter{ $0.name.localizedStandardContains(searchText) }
        }
    }
}
