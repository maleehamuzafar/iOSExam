//
//  Item.swift
//  iOSExam
//
//  Created by Maleeha Muzafar on 05/03/2025.
//

import Foundation

struct Item: Codable {
    let id: UUID
    let name: String
    let imageURL: URL
    
    init(id: UUID = UUID(), name: String, imageURL: URL) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
    }
}
