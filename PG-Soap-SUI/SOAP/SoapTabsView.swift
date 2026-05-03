//
//  SoapTabsView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 5/1/26.
//

import SwiftUI

struct SoapTabsView: View {
    @State  var selectedTab: Int = 0
    @Binding var soapRec: SoapData 
    var body: some View {
        VStack {
            NameDateView(soapRec: $soapRec)
                .padding(10)
            
            TabView(selection: $selectedTab)
            {
                SubjView(soapRec: $soapRec)
                    .tabItem{
                        Label("Subj", systemImage: "gear.circle.fill")
                    }
                    .tag(1)
                ObjView(soapRec: $soapRec)
                    .tabItem{
                        Label("Obj", systemImage: "gear.circle.fill")
                    }
                    .tag(2)
                AsessView(soapRec: $soapRec)
                    .tabItem{
                        Label("Assess", systemImage: "gear.circle.fill")
                    }
                    .tag(3)
                PlanView(soapRec: $soapRec)
                    .tabItem{
                        Label("Plan", systemImage: "gear.circle.fill")
                    }
                    .tag(4)
                
            }
        }
       .frame(width: 700)
  }
}

#Preview {
   // SoapTabsView()
}
