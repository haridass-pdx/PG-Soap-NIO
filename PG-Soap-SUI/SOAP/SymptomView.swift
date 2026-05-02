//
//  SymptomView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 5/2/26.
//

import SwiftUI

struct SymptomView: View {
    @State var symNum: Int
    @Binding var symptom: String
    @Binding var severity: String
    @Binding var frequency: String
  var body: some View {
      HStack{
          Text("Symptom #: \(symNum)").font(Font.body.bold())
          VStack{
              TextField("Symptom", text: $symptom, axis: .vertical)
                  .lineLimit(2...5)
              HStack{
                  TextField("Severity", text: $severity)
                  TextField("Frequency", text: $frequency)
              }
          }
      }
  }
}

#Preview {
   //SymptomView()
}
