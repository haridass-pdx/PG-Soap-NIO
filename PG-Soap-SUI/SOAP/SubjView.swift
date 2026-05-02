//
//  SubjView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 11/14/24.
//

import SwiftUI

struct SubjView: View {
   // var SoapRec: soap_tbl
    @Binding var soapRec: SoapData
    var body: some View {
        
        VStack {
            Form {
                NameDateView(soapRec: $soapRec)
                
                
            }
            
        }
        
            
    }
}

//#Preview {
//    SubjView()
//}
