//
//  SoapListView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 4/26/26.
//

import SwiftUI

struct SoapListView: View {
    @EnvironmentObject var globalData: globalDataRec
    @Binding var patientID: Int?
    @State var soapList: [SoapData] = []
    @State var selectedRec: Int?
    var body: some View {
        Text("SoapListView \(patientID ?? 0)")
        Text("Soap List Count: \(soapList.count)")
            .onAppear {
                globalData.recordEditFlag = false
            }
            .onChange(of: patientID) { newValue in
                Task{
                    
                    if let ptID = newValue  {
                        let spc = soapClass()
                     await   soapList = spc.buildSoapist(patientID: ptID)
                    }
                }
            }
        Table(soapList, selection: $selectedRec) {
            // 4. Define columns
            TableColumn("ID") { soap in
                Text(String(soap.id))
            }
            .width(min: 25, ideal: 30, max: 100)
            
            TableColumn("Date") { soap in
                Text(getDateOptString(from: soap.soap_date))
            }
                .width(min: 50, ideal: 50, max: 100)
            TableColumn("Name", value: \.name) //         .width(min: 50, ideal: 50, max: 100)
            // Use key path for simple String properties
            
        }
        
    }
    
}

#Preview {
    //SoapListView()
}
