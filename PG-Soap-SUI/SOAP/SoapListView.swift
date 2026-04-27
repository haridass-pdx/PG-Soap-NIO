//
//  SoapListView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 4/26/26.
//

import SwiftUI

struct SoapListView: View {
    @Binding var patientID: Int?
    var body: some View {
        Text("SoapListView \(patientID ?? 0)")
    }
}

#Preview {
    //SoapListView()
}
