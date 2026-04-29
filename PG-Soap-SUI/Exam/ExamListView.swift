//
//  ExamListView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 4/27/26.
//

import SwiftUI

struct ExamListView: View {
    @EnvironmentObject var globalData: globalDataRec
    @Binding var nameID: Int?
   @State private var examList: [ExamData] = []
    @State private var selectedRec: Int?
    
     var body: some View {
         Text("Exam List \(nameID)")
         Text("Exam List Count \(examList.count)")
             .onAppear {
                 globalData.recordEditFlag = false
             }
             .onChange(of: nameID) {
                 Task{
                     if let ptID = nameID  {
                         let exc = examClass()
                      await   examList = exc.buildExamList(nameID: ptID)
                     }
                 }
             }
         Table(examList, selection: $selectedRec) {
             // 4. Define columns
             TableColumn("ID") { exam in
                 Text(String(exam.id))
             }
             .width(min: 40, ideal: 50, max: 100)
             
             TableColumn("Date") { exam in
                 Text(getDateOptString(from: exam.exdate))
             }
                 .width(min: 50, ideal: 60, max: 100)
             TableColumn("Name", value: \.exname) //
                 .width(min: 60, ideal: 80, max: 150)
             // Use key path for simple String properties
             
         }
    }
}

#Preview {
   // ExamListView()
}
