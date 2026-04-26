//
//  PG_Soap_SUIApp.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 11/3/24.
//

import SwiftUI
internal import Combine

class globalDataRec: ObservableObject{
    @Published var theData: [String:Any] = [:]
    @Published var loggedIn: Bool = false
    @Published   var loggedInRec = logInRec()
   }

class AlertManager: ObservableObject {
    @Published var isAlertPresented: Bool = false
    @Published var alertTitle: String = ""
    @Published var alertMessage: String = ""

    func showCustomAlert(title: String, message: String) {
        alertTitle = title
        alertMessage = message
        isAlertPresented = true // Changing this property triggers the UI update
    }
}


@main
struct PG_Soap_SUIApp: App {
  //  let theConnection = globalRecords()
    let globalData = globalDataRec()
    
    var body: some Scene {
        WindowGroup {
           CheckLoginView()
                    .environmentObject(globalData)
      
        }
    }
}
