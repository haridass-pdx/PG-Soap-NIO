//
//  ExamListView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 4/27/26.
//

import SwiftUI

struct ExamListView: View {
    @EnvironmentObject var globalData: globalDataRec
    @Binding var patientID: Int?
     var body: some View {
         Text("Exam List \(patientID)")
             .onAppear {
                 globalData.recordEditFlag = false
             }
    }
}

#Preview {
   // ExamListView()
}
