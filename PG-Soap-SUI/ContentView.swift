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

    var filteredNames: [PatientData] {
            if searchText.isEmpty {
                return patientList
            } else {
                return patientList.filter { $0.lastname.localizedCaseInsensitiveContains(searchText) }
            }
        }

    var body: some View {
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
                    TableColumn("Last", value: \.lastname)
                    TableColumn("First", value: \.firstname) // Use key path for simple String properties
                    
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
}




#Preview {
    // ContentView()
}
