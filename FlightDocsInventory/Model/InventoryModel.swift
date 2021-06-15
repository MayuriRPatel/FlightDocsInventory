//
//  InventoryModel.swift
//  FlightDocsInventory
//
//  Created by PRADIP on 2021-06-15.
//

import Foundation

struct Parts: Codable {
    let id: Int
    var cost: Float
    var name: String
    var partNumber: String
    var description: String
    var inStock: Int?
    var image: String?
    var isActive: Bool
    var _id: String
}

struct NewPart: Codable {
    var id: Int
    var cost: Float
    var name: String
    var partNumber: String
    var description: String
    var inStock: Int?
    var image: String?
    var isActive: Bool
    var notes: String
    var _id: String
}

struct NewParts: Codable {
    var cost: Float
    var name: String
    var partNumber: String
    var description: String
    var inStock: Int?
    var image: String?
    var isActive: Bool
    var notes: String
}

