//
//  PatientEdit.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 4/26/26.
//

import SwiftUI

struct PatientEdit: View {
    @EnvironmentObject var globalData: globalDataRec
    @Binding var patientID: Int?
    var body: some View {
        Text("PatientEdit (ID: \(patientID ?? 0) )").onAppear {
            globalData.recordEditFlag = true
        }
    }
}

#Preview {
   // PatientEdit()
}
