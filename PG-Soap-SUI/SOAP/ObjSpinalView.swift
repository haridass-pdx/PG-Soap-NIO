//
//  ObjSpinalView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 5/3/26.
//

import SwiftUI

struct ObjSpinalView: View {
    @Binding var  theSpinalList: [spinalDataRec]
    @State var selectItem: UUID?
    var body: some View {
        VStack{
            Text("Spinal Findings")
            Text("Spinal: \(theSpinalList.count)")
            Table(theSpinalList, selection: $selectItem) {
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
            .frame(width: 450)
        }
    }
}

#Preview {
 //   ObjSpinalView()
}
