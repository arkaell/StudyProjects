//
//  Appetizer.swift
//  Appetizers
//
//  Created by David Liongson on 4/15/22.
//

import Foundation

struct Appetizer: Identifiable, Decodable {
    let carbs: Int
    let imageURL: String
    let id: Int
    let description: String
    let price: Double
    let protein: Int
    let calories: Int
    let name: String
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(carbs: 123,
                                           imageURL: "",
                                           id: 0001,
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 167.67,
                                           protein: 49,
                                           calories: 128,
                                           name: "Test Appetizer")
    
    static let orderItem1 = Appetizer(carbs: 123,
                                           imageURL: "",
                                           id: 0001,
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 167.67,
                                           protein: 49,
                                           calories: 128,
                                           name: "Test Appetizer 1")
    static let orderItem2 = Appetizer(carbs: 123,
                                           imageURL: "",
                                           id: 0002,
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 167.67,
                                           protein: 49,
                                           calories: 128,
                                           name: "Test Appetizer 2")
    
    static let orderItem3 = Appetizer(carbs: 123,
                                           imageURL: "",
                                           id: 0003,
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 167.67,
                                           protein: 49,
                                           calories: 128,
                                           name: "Test Appetizer 3")
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    static let orders = [orderItem1, orderItem2, orderItem3]
    
}
