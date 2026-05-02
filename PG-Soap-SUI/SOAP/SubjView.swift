//
//  SubjView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 11/14/24.
//

import SwiftUI

let fwidth = 450.0

struct SubjView: View {
   // var SoapRec: soap_tbl
    @Binding var soapRec: SoapData
    var body: some View {
        
        VStack {
            Form {
             //   NameDateView(soapRec: $soapRec)
                SymptomView(symNum: 1, symptom: $soapRec.sympt1, severity: $soapRec.sev_1, frequency: $soapRec.s1_freq)
                Divider()
                    .padding(10)
                SymptomView(symNum: 2, symptom: $soapRec.sympt2, severity: $soapRec.sev_2, frequency: $soapRec.s2_freq)
                Divider()
                    .padding(10)
                SymptomView(symNum: 3, symptom: $soapRec.sympt3, severity: $soapRec.sev_3, frequency: $soapRec.s3_freq)
                Divider()
                    .padding(10)
                SymptomView(symNum: 4, symptom: $soapRec.sympt4, severity: $soapRec.sev_4, frequency: $soapRec.s4_freq)
                Divider()
                    .padding(10)
                SymptomView(symNum: 5, symptom: $soapRec.sympt5, severity: $soapRec.sev_5, frequency: $soapRec.s5_freq)
    
            }.frame(width: fwidth)
            
        }
        
            
    }
}

//#Preview {
//    SubjView()
//}
