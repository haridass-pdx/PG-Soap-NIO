//
//  PatientEdit.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 4/26/26.
//

import SwiftUI

struct NameEdit: View {
    @EnvironmentObject var globalData: globalDataRec
    @Binding var nameID: Int?
    var body: some View {
        Text("NametEdit (ID: \(nameID ?? 0) )").onAppear {
            globalData.recordEditFlag = true
        }
    }
}

#Preview {
   // PatientEdit()
}
