//
//  NameDateView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 5/1/26.
//

import SwiftUI

struct NameDateView: View {
    @Binding var soapRec: SoapData
 
    var body: some View {
        VStack{
            
            
            HStack{   TextField("Enter Date", value: $soapRec.soap_date, format: .dateTime.month().day().year())
                
                TextField("Name" , text: $soapRec.name)
                //, format: .dateTime.hour().minute().second())
                Toggle( "newSoap", isOn: $soapRec.newSoapRec )

                
            }.textFieldStyle(.roundedBorder)
                        
            
        }.frame(width: 500)
    }
}

#Preview {
    //NameDateView()
}
