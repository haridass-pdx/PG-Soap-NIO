//
//  SoapView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 11/14/24.
//

import SwiftUI

struct SoapView: View {
    var SoapID: String
    var body: some View {
        
      
       // Text("Soap View \(SoapID)")
      TabView {
            Text("Subj")
         
                .tabItem {
                    Label("Subj", systemImage: "star")
                }

            Text("Obj")
                .tabItem {
                    Label("Obj", systemImage: "circle")
                }
            
            Text("Assess")
                .tabItem {
                    Label("Assess", systemImage: "circle")
                }

            Text("Plan")
                .tabItem {
                    Label("Plan", systemImage: "circle")
                }

        }

            }
}

/*#Preview {
    SoapView()
}*/
