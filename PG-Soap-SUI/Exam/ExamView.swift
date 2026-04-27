//
//  ExamView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 11/14/24.
//

import SwiftUI

struct ExamView: View {
    @Binding var patientID: Int?
   var ExamID: String = "01"
    var body: some View {
        Text("Exam View! \(patientID ??  0)")
    }
}

/*#Preview {
    ExamView()
}*/
