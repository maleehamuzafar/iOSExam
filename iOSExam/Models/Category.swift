//
//  Category.swift
//  iOSExam
//
//  Created by Maleeha Muzafar on 05/03/2025.
//

import Foundation

struct Category: Codable {
    let id: UUID
    let items: [Item]
    let imageURL: String
    
    init(id: UUID = UUID(), items: [Item], imageURL: String) {
        self.id = id
        self.items = items
        self.imageURL = imageURL
    }
    
    func getURLForImage() -> URL? {
        return URL(string: imageURL)
    }
}
