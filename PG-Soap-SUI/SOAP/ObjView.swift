//
//  ObjView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 11/14/24.
//

import SwiftUI

struct ObjView: View {
    //var SoapRec: soap_tbl
    @Binding var soapRec: SoapData
    var spinalData: SoapDataArr

    @State private var selection: Int = 0



   // @State private var jointData: Data
    var body: some View {
        VStack{
             Text("Objective!")
                
            TabView(selection: $selection) {
                ObjSpinalView(spinalData: spinalData)
              
                    .tabItem{
                        Label("Spinal", systemImage: "gear.circle.fill")
                    }
                    .tag(1)
               
                    
                Text("Muscle: \(spinalData.theMuscleList.count)")
                        .tabItem{
                            Label("Muscle", systemImage: "gear.circle.fill")
                        }
                        .tag(2)
               
             
                Text("Treatments: \(spinalData.theTreatmentList.count)")
                        .tabItem{
                            Label("Treatments", systemImage: "gear.circle.fill")
                        }
                        .tag(3)

                Text("Exercises: \(spinalData.theExerciseList.count)")
                        .tabItem{
                            Label("Exercises", systemImage: "gear.circle.fill")
                        }
                        .tag(4)

                Text("Supplements: \(spinalData.theSupplementList.count)")
                        .tabItem{
                            Label("Supplements", systemImage: "gear.circle.fill")
                        }
                        .tag(5)

            }
                    .tabViewStyle(.sidebarAdaptable)
            
   /*         Text("Spinal: \(theSpinalList.count)")
            Text("Muscle: \(theMuscleList.count)")
            Text("Treatments: \(theTreatmentList.count)")
            Text("Exercises: \(theExerciseList.count)")
            Text("Supplements: \(theSupplementList.count)")*/
            
        }
        
    }
    
   


}


/*#Preview {
    ObjView()
}*/
