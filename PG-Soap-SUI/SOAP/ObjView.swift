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
    @State var  theSpinalList: [Any]?
    //@State var   theJointList: [Any]?
    @State var   theMuscleList: [Any]?
    @State var  theTreatmentList: [Any]?
    @State var   theExerciseList: [Any]?
    @State var   theSupplementList: [Any]? 
    

   // @State private var jointData: Data
    var body: some View {
        VStack{
             Text("Objective!")
                .onAppear {
                    
                    theSpinalList = getDataArray(soapRec.jointData, key: Keys.spinalDataKey.rawValue)
                    // theJointList = getDataArray(soapRec.jointData, key: Keys.mslDataKey.rawValue)
                    theMuscleList = getDataArray(soapRec.mslData, key: Keys.mslDataKey.rawValue)
                    theTreatmentList = getDataArray(soapRec.procedures, key: Keys.proceduresDataKey.rawValue)
                    theExerciseList = getDataArray(soapRec.exercises, key: Keys.exerciseDataKey.rawValue)
                    theSupplementList = getDataArray(soapRec.supplements, key: Keys.supplementDataKey.rawValue)
                    
                }
            
            Text("Spinal: \(theSpinalList?.count ?? 0)")
            Text("Muscle: \(theMuscleList?.count ?? 0)")
            Text("Treatments: \(theTreatmentList?.count ?? 0)")
            Text("Exercises: \(theExerciseList?.count ?? 0)")
            Text("Supplements: \(theSupplementList?.count ?? 0)")   
            
        }
        
    }
}


/*#Preview {
    ObjView()
}*/
