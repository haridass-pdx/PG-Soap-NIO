//
//  AppTabView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 11/14/24.
//

import SwiftUI

struct AppTabView: View {
    @EnvironmentObject var theConnection: globalRecords
    @State private var selectedTab = "Names"
    @State private var theRecIDS = RecIDS()


    var body: some View {
        Spacer()
        TabView(selection: $selectedTab) {
            ContentView(theRecIDS: theRecIDS).environmentObject(theConnection)
                .tabItem {
                    Label("Names", systemImage: "star")
                }

            SoapView(SoapID: theRecIDS.SoapID)
                .tabItem  {
                    Label("SOAP", systemImage: "circle")
                } //.disabled(theRecIDS.SoapID == "")
                
            ExamView(ExamID: theRecIDS.ExamID)
            //Text("Exam Tab")
                .tabItem {
                    Label("Exam", systemImage: "circle")
                }
        }
    }
}

#Preview {
    AppTabView()
}
