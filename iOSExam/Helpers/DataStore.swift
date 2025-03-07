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

struct DataStore {
    
    static func loadData() -> MenuData {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExt) else {
            print("Failed to find JSON file")
            return MenuData(categories: [])
        }
        do {
            let data = try Data(contentsOf: url)
            let decodedMenuData = try JSONDecoder().decode(MenuData.self, from: data)
            return decodedMenuData
        } catch {
            print("Error decoding JSON: \(error)")
            return MenuData(categories: [])
        }
    }
    
    private static let fileName = "menu"
    private static let fileExt = "json"
}
