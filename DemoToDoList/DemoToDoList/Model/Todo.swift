//
//  Todo.swift
//  DemoToDoList
//
//  Created by David Liongson on 2/15/22.
//

import Foundation

struct Todo: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted = false
}
