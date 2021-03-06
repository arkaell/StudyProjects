//
//  KeyboardResponder.swift
//  DemoToDoList
//
//  Created by David Liongson on 3/6/22.
//

import Foundation
import UIKit
import Combine


protocol KeyboardResponderProtocol {
    var currentHeight: CGFloat { get }
    var duration: TimeInterval { get }
}

final class KeyboardResponder: KeyboardResponderProtocol, ObservableObject {
    
    @Published private(set) var currentHeight: CGFloat = 0
    private(set) var duration: TimeInterval = 0.3
    private var cancellableBag = Set<AnyCancellable>()
    
    init() {
        let keyboardWillShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
        let keyboardWillHide = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
        Publishers.Merge(keyboardWillShow, keyboardWillHide)
            .receive(on: RunLoop.main)
            .sink { [weak self] in self?.keyboardNotification($0)}
            .store(in: &cancellableBag)
    }
    
    private func keyboardNotification(_ notification: Notification) {
        let isShowing = notification.name == UIResponder.keyboardWillShowNotification
        if let userInfo = notification.userInfo {
            duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0.0
            let endFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            if isShowing {
                currentHeight = endFrame?.height ?? 0.0
            } else {
                currentHeight = 0.0
            }
        }
    }
}
