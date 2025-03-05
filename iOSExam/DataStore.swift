//
//  DataStore.swift
//  iOSExam
//
//  Created by Maleeha Muzafar on 05/03/2025.
//

import Foundation

struct MenuData: Codable {
    let categories: [Category]
}

class DataStore {
    var menu = MenuData(categories: [])
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExt) else {
            print("Failed to find JSON file")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decodedMenuData = try JSONDecoder().decode(MenuData.self, from: data)
            self.menu = decodedMenuData
        } catch {
            print("Error decoding JSON: \(error)")
            return
        }
    }
    
    private let fileName = "menu"
    private let fileExt = "json"
}
