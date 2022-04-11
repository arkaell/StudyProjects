//
//  NewTodoView.swift
//  DemoToDoList
//
//  Created by David Liongson on 3/6/22.
//

import SwiftUI

struct NewTodoView: View {
    
//    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel: NewTodoViewModel
    @ObservedObject private var keyboard = KeyboardResponder()
    
    @State private var title = ""
    
    private var isAddButtonDisabled: Bool {
        title.isEmpty
    }
    
    private var addButtonColor: Color {
        isAddButtonDisabled ? .gray : .blue
    }
    
    var body: some View {
        VStack {
            Spacer()
            TextField("Enter name", text: $title)
                .padding()
            Spacer()
            HStack {
                Button {
                    // cancel action
                    dismiss()
                } label: {
                    Text("Cancel")
                }
                .padding(.vertical, 16.0)
                .frame(minWidth: 0, maxWidth: .infinity)
                
                Button {
                    // add action
                    if !isAddButtonDisabled {
                        viewModel.addNewTodo(title: title)
                        dismiss()
                    }
                } label: {
                    Text("Add")
                        .foregroundColor(.black)
                }
                .padding(.vertical, 16.0)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(addButtonColor)
                .disabled(isAddButtonDisabled)
            }
        }
        .padding()
        .padding(.bottom, keyboard.currentHeight)
        .animation(.easeOut, value: keyboard.duration)
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(viewModel: NewTodoViewModel())
    }
}
