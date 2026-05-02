//
//  SoapEditView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 5/1/26.
//

import SwiftUI

struct SoapEditView: View {
    @Binding var soapRec: SoapData
    var body: some View {
        VStack{
            Text("Soap Rec Edit")
            Form {
                TextField("Name", text: $soapRec.name)
                Toggle( "newSoap", isOn: $soapRec.newSoapRec )
                
                
            }
        }
        .frame(width: 500)
        
        
    }
}

#Preview {
    //SoapEditView()
}
