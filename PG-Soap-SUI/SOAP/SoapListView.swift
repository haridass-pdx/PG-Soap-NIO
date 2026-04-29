//
//  SoapListView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 4/26/26.
//

import SwiftUI

struct SoapListView: View {
    @EnvironmentObject var globalData: globalDataRec
    @Binding var nameID: Int?
    @State var soapList: [SoapData] = []
    @State var selectedRec: Int?
    var body: some View {
        Text("SoapListView \(nameID ?? 0)")
        Text("Soap List Count: \(soapList.count)")
            .onAppear {
                globalData.recordEditFlag = false
            }
            .onChange(of: nameID) {
                Task{
                    
                    if let ptID = nameID  {
                        let spc = soapClass()
                     await   soapList = spc.buildSoapist(nameID: ptID)
                    }
                }
            }
        Table(soapList, selection: $selectedRec) {
            // 4. Define columns
            TableColumn("ID") { soap in
                Text(String(soap.id))
            }
            .width(min: 40, ideal: 50, max: 100)
            
            TableColumn("Date") { soap in
                Text(getDateOptString(from: soap.soap_date))
            }
                .width(min: 50, ideal: 60, max: 100)
            TableColumn("Name", value: \.name) //
                .width(min: 60, ideal: 80, max: 150)
            // Use key path for simple String properties
            
        }
        
    }
    
}

#Preview {
    //SoapListView()
}
