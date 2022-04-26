//
//  Alert.swift
//  Appetizers
//
//  Created by David Liongson on 4/16/22.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      message: Text("There was an issue connecting to the server. If this persists, please contact support."),
                                      dismissButton: .default(Text("OK")))
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalid response from the server. Please try again later or please contact support."),
                                           dismissButton: .default(Text("OK")))
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data received from the server was invalid. Please contact support"),
                                       dismissButton: .default(Text("OK")))
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                            dismissButton: .default(Text("OK")))
    static let invalidForm = AlertItem(title: Text("Form Error"),
                                       message: Text("The form cannot be submitted because it is incomplete. Kindly complete the form."),
                                       dismissButton: .default(Text("OK")))
    static let invalidEmail = AlertItem(title: Text("Form Error"),
                                       message: Text("The form cannot be submitted because the email address is invalid. Kindly check the email address."),
                                       dismissButton: .default(Text("OK")))
    static let userSaveSuccess = AlertItem(title: Text("Profile saved."),
                                           message: Text("Your profile informationw was successfully saved."),
                                           dismissButton: .default(Text("OK")))
    static let invalidUserData = AlertItem(title: Text("Profile error"),
                                           message: Text("There was an error saving or retrieving your profile."),
                                           dismissButton: .default(Text("OK")))
}
