//
//  BarcodeScannerViewModel.swift
//  Barcode Scanner
//
//  Created by David Liongson on 3/26/22.
//

import SwiftUI

// View models are observable objects
final class BarcodeScannerViewModel: ObservableObject {
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        scannedCode.isEmpty ? "Not yet scanned" : scannedCode
    }
    
    var statusColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
}
