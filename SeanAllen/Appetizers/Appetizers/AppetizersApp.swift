//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by David Liongson on 4/15/22.
//

import SwiftUI

@main
struct AppetizersApp: App {
    let order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
