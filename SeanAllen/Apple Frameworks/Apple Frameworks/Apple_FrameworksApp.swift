//
//  Apple_FrameworksApp.swift
//  Apple Frameworks
//
//  Created by David Liongson on 10/29/21.
//

import SwiftUI

@main
struct Apple_FrameworksApp: App {
    var body: some Scene {
        WindowGroup {
//            FrameworkDetailView(framework: MockData.sampleFramework)
            FrameworkGridView()
        }
    }
}
