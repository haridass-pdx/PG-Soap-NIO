//
//  PG_Soap_SUIApp.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 11/3/24.
//

import SwiftUI

@main
struct PG_Soap_SUIApp: App {
    let theConnection = globalRecords()
 
    
    var body: some Scene {
        WindowGroup {
            AppTabView().environmentObject(theConnection)
        }
    }
}
