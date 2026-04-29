//
//  DetailTabView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 4/26/26.
//

import SwiftUI

struct DetailTabView: View {
    @State private var selectedTab: Int = 0
    @Binding var nameID: Int?
   
    var body: some View {
        TabView(selection: $selectedTab)
        {
            NavigationStack {
                PatientEdit(patientID: $nameID)
            }
                .tabItem{
                    Label("Patient Edit", systemImage: "gear.circle.fill")
                }
                .tag(1)
            
            NavigationStack {
                SoapListView(nameID: $nameID)
            }
                .tabItem{
                    Label("Soap", systemImage: "gear.circle.fill")
                }
                .tag(2)
            
            NavigationStack {
                ExamListView(nameID: $nameID)
            }
                .tabItem{
                    Label("Exam", systemImage: "gear.circle.fill")
                }
                .tag(3)


        }
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
   // DetailTabView()
}
