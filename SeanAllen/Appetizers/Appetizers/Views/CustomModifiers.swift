//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by David Liongson on 4/25/22.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
