//
//  TodoListView.swift
//  DemoToDoList
//
//  Created by David Liongson on 2/15/22.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var viewModel = TodoListViewModel()
    
    @State private var isShowingAddNew = false
    
    private var addNewButton: some View {
        Button {
            self.isShowingAddNew.toggle()
        } label: {
            Image(systemName: "plus")
        }

    }
    
    private var showCompletedButton: some View {
        Button {
            self.viewModel.showCompleted.toggle()
        } label: {
            Image(systemName: self.viewModel.showCompleted ? "checkmark.circle.fill" : "checkmark.circle")
        }

    }
    
    var body: some View {
        NavigationView {
            List(viewModel.todos) { todo in
                Button {
                    viewModel.toggleIsCompleted(for: todo)
                } label: {
                    TodoRow(todo: todo)
                }

                
            }
            .navigationTitle("Todo List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    showCompletedButton
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    addNewButton
                }
            }
        }
        .sheet(isPresented: $isShowingAddNew, onDismiss: {
            self.viewModel.fetchTodos()
        }) {
            NewTodoView(viewModel: NewTodoViewModel())
        }
        .onAppear {
            self.viewModel.fetchTodos()
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        var view = TodoListView()
        view.viewModel = TodoListViewModel(dataManager: MockDataManager())
        return view
    }
}
