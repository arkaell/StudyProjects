//
//  FrameworkGridViewModel.swift
//  Apple Frameworks
//
//  Created by David Liongson on 11/11/21.
//

import SwiftUI

// if you're not going to sub-class, make it final as a best practice
final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    @Published var isShowingDetailView = false
    
}
