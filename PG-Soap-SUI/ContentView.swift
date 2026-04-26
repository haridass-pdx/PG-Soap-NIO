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
    var body: some View {
        VStack(spacing: 16) {
            Text("Content View")
            Table(patientList, selection: $selectedPt) {
                // 4. Define columns
                TableColumn("Name", value: \.fullname) // Use key path for simple String properties
                // TableColumn("Last", value: \.lastName)
            }
            
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
