//
//  DataManager.swift
//  DemoToDoList
//
//  Created by David Liongson on 2/15/22.
//

import Foundation

protocol DataManagerProtocol {
    func fetchTodoList(includingCompleted: Bool) -> [Todo]
    func add(title: String)
    func toggleIsCompleted(for todo: Todo)
}

extension DataManagerProtocol {
    func fetchTodoList(includingCompleted: Bool = false) -> [Todo] {
        fetchTodoList(includingCompleted: includingCompleted)
    }
}

class DataManager {
    // singleton instance
    static let shared: DataManagerProtocol = DataManager()
    
    private var todos = [Todo]()
    
    // make this private to prevent us from creating other instances
    private init() {}
}

extension DataManager: DataManagerProtocol {
    func fetchTodoList(includingCompleted: Bool) -> [Todo] {
        includingCompleted ? todos : todos.filter { !$0.isCompleted }
    }
    
    func add(title: String) {
        let todo = Todo(title: title)
        todos.insert(todo, at: 0)
    }
    
    func toggleIsCompleted(for todo: Todo) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isCompleted.toggle()
        }
    }
}
