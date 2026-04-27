//
//  ContentView.swift
//  PostgresNIO
//
//  Created by Hari Dass Khalsa on 3/27/26.
//

import SwiftUI

struct ContentView: View {
    //  @State  var dbManager = DatabaseManager()
    //   @State  var sqlQuery = "SELECT tablename FROM pg_tables WHERE schemaname = 'public' LIMIT 20;"
    @State var patientList: [PatientData] = []
    @State private var selectedPt: Int?
    @State private var searchText = ""
    @State private var columnVisibility = NavigationSplitViewVisibility.all // or .doubleColumn
    
    var filteredNames: [PatientData] {
        if searchText.isEmpty {
            return patientList
        } else {
            return patientList.filter { $0.lastname.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            VStack(spacing: 16) {
                Text("Patient List")
                NavigationStack {
                    HStack{
                        Text("Last Name: ")
                        TextField("Last Name:", text: $searchText)
                    }
                    .frame(width: 250)
                    Text("Count: \(filteredNames.count)")
                    Table(filteredNames, selection: $selectedPt) {
                        // 4. Define columns
                        TableColumn("ID") { patient in
                            Text(String(patient.id))
                        }
                        .width(min: 25, ideal: 30, max: 100)
                        
                        TableColumn("Last", value: \.lastname)
                            .width(min: 50, ideal: 50, max: 100)
                        TableColumn("First", value: \.firstname) //         .width(min: 50, ideal: 50, max: 100)
                        // Use key path for simple String properties
                        
                    }
                    .onChange(of: selectedPt) { newSelection in
                        if let selectedId = newSelection {


                        }
                    }
                }
                .navigationTitle("Patient List")
                .searchable(text: $searchText, prompt: "Search patient last name...")
                .onAppear{
                    Task{
                        let ptc = patientClass()
                        await patientList = ptc.buildPatientList(showAll: true)
                    }
                }
            }
        }
        detail: {
            DetailTabView(patientID: $selectedPt)
        }
    }
}



#Preview {
    // ContentView()
}
