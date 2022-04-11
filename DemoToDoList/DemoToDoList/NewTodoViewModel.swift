//
//  NewTodoViewModel.swift
//  DemoToDoList
//
//  Created by David Liongson on 3/6/22.
//

import Foundation
import Combine

protocol NewTodoViewModelProtocol {
    func addNewTodo(title: String)
}

final class NewTodoViewModel: ObservableObject {
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
    }
}

// MARK: - NewTodoViewModelProtocol
extension NewTodoViewModel: NewTodoViewModelProtocol {
    func addNewTodo(title: String) {
        dataManager.add(title: title)
    }
}
