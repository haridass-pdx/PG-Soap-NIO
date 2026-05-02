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
    @State var soapRec: SoapData = SoapData()
    @State var navigateToEditPay: Bool = false
    
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
            TableColumn("New") { soap in
                Text(getDateString(item: soap))
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
        .onChange(of: selectedRec) {
            if let id = selectedRec {
                if let sr  =  soapList.first(where: { $0.id == id }){
                    soapRec = sr
                    navigateToEditPay = true
                }
            }
        }
        .navigationDestination(isPresented: $navigateToEditPay) {
            
            SoapTabsView(soapRec: $soapRec)
            }

        
    }
    
    func getDateString(item: SoapData) -> String {
        let result =  "\(item.newSoapRec)"
        print(result)
        print(item.soap_date)
        return result
    }
    
}

#Preview {
    //SoapListView()
}
