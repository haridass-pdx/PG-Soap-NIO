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
    @State var  theSpinalList: [spinalDataRec] = []
    @State var   theMuscleList: [softTissueRec] = []
    @State var  theTreatmentList: [procedureRec] = []
    @State var   theExerciseList: [exerciseRec] = []
    @State var   theSupplementList: [supplementRec] = []
    @State private var selection: Int = 0



   // @State private var jointData: Data
    var body: some View {
        VStack{
             Text("Objective!")
                .onAppear {
                    buildArrays()
                }
            
            TabView(selection: $selection) {
                ObjSpinalView(theSpinalList: $theSpinalList)
              
                    .tabItem{
                        Label("Spinal", systemImage: "gear.circle.fill")
                    }
                    .tag(1)
               
                    
                Text("Muscle: \(theMuscleList.count)")
                        .tabItem{
                            Label("Muscle", systemImage: "gear.circle.fill")
                        }
                        .tag(2)
               
             
                     Text("Treatments: \(theTreatmentList.count)")
                        .tabItem{
                            Label("Treatments", systemImage: "gear.circle.fill")
                        }
                        .tag(3)

                    Text("Exercises: \(theExerciseList.count)")
                        .tabItem{
                            Label("Exercises", systemImage: "gear.circle.fill")
                        }
                        .tag(4)

                    Text("Supplements: \(theSupplementList.count)")
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
    
    func buildArrays()
    {
        if  let spineDict = getDataArray(soapRec.jointData, key: Keys.spinalDataKey.rawValue){
            buildSpineArray(data: spineDict )
        }
        // theJointList = getDataArray(soapRec.jointData, key: Keys.mslDataKey.rawValue)
        if   let mslDict = getDataArray(soapRec.mslData, key: Keys.mslDataKey.rawValue){
            buildMslArray(data: mslDict)
        }
        if let txDict = getDataArray(soapRec.procedures, key: Keys.proceduresDataKey.rawValue){
            buildTxArray(data: txDict)
        }
        if let exDict = getDataArray(soapRec.exercises, key: Keys.exerciseDataKey.rawValue){
            buildExArray(data: exDict)
        }
        if  let supDict = getDataArray(soapRec.supplements, key: Keys.supplementDataKey.rawValue){
            buildSupArray(data: supDict)
        }

        
    }
    
    func buildSpineArray(data: [Any])
    {
       // var spineArray: [spinalDataRec] = []
      //  var spineRec = spinalDataRec()
        theSpinalList.removeAll()
        data.forEach { value in
            var spineRec = spinalDataRec()
            let newVal : [String: Any] = value as! [String : Any]
            spineRec.dictToRec(theDictionary: newVal)
            theSpinalList.append(spineRec)
        }
    }
    
    func buildMslArray(data: [Any])
    {
       // var spineArray: [spinalDataRec] = []
        theMuscleList.removeAll()
        data.forEach { value in
            var mslRec = softTissueRec()
              let newVal : [String: Any] = value as! [String : Any]
            mslRec.dictToRec(theDictionary: newVal)
            theMuscleList.append(mslRec)
            mslRec = softTissueRec()
        }
    }

    func buildTxArray(data: [Any])
    {
       // var spineArray: [spinalDataRec] = []
        theTreatmentList.removeAll()
        data.forEach { value in
            var procRec = procedureRec()
               let newVal : [String: Any] = value as! [String : Any]
            procRec.dictToRec(theDictionary: newVal)
            theTreatmentList.append(procRec)
        }
    }
    
    func buildExArray(data: [Any])
    {
       // var spineArray: [spinalDataRec] = []
        // theExerciseList: [exerciseRec
        theExerciseList.removeAll()
        data.forEach { value in
            var exRec = exerciseRec()
              let newVal : [String: Any] = value as! [String : Any]
            exRec.dictToRec(theDictionary: newVal)
            theExerciseList.append(exRec)
        }
    }

    func buildSupArray(data: [Any])
    {
       // var spineArray: [spinalDataRec] = []
        // theSupplementList: [supplementRec]
        theSupplementList.removeAll()
        data.forEach { value in
            var supRec = supplementRec()
            let newVal : [String: Any] = value as! [String : Any]
            supRec.dictToRec(theDictionary: newVal)
            theSupplementList.append(supRec)
        }
    }


}


/*#Preview {
    ObjView()
}*/
