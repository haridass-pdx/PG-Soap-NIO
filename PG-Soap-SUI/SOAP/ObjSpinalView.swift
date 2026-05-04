//
//  ObjSpinalView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 5/3/26.
//

import SwiftUI

struct ObjSpinalView: View {
    var spinalData: SoapDataArr
    @State var selectItem: UUID?
    @State var spineRec: spinalDataRec?
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 10){
                Text("Spinal Findings")
                Text("Spinal: \(spinalData.theSpinalList.count)")
                Table(spinalData.theSpinalList, selection: $selectItem) {
                    TableColumn("Area") { item in
                        Text(String(item.theLevel))
                    }
                    .width(min: 50, ideal: 80, max: 150)
                    TableColumn("Side") { item in
                        Text(String(item.theSide))
                    }
                    .width(min: 40, ideal: 60, max: 150)
                    TableColumn("Intensity") { item in
                        Text(String(item.intensity))
                    }
                    .width(min: 40, ideal: 60, max: 150)
                    
                }
                .onChange(of: selectItem) { value in
                    if let id = value {
                        spineRec = spinalData.theSpinalList.first(where: { $0.id == id })
                        print(spineRec ?? " no rec found")
                    }
                }
                .frame(width: 300)
            }
            Divider()
            VStack(alignment: .leading, spacing: 10){
                Form{
                    Text("Edit Spinal Record")
                    if let spineRecBinding = Binding($spineRec) {
                        TextField("Spinal Area: ", text: spineRecBinding.theLevel)
                        TextField("Side: ", text: spineRecBinding.theSide )
                        TextField("Intensity: ", text: spineRecBinding.intensity)
                        TextField("Notes: ", text: spineRecBinding.notes)
                        Toggle("Palpatory/Tender", isOn: spineRecBinding.palpTender)
                        Toggle("Fixation", isOn: spineRecBinding.fixation)
                        Toggle("swelling", isOn: spineRecBinding.swelling)
                        Toggle("hypermobility", isOn: spineRecBinding.hypermobility)
                        
                    } else {
                        Text("No record selected")
                    }
                }
                Spacer()
            }
        }
    }
}


#Preview {
    //   ObjSpinalView()
}
