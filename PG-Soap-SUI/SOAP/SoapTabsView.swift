//
//  SoapTabsView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 5/1/26.
//

import SwiftUI

@Observable class SoapDataArr{
   var  theSpinalList: [spinalDataRec] = []
   var   theMuscleList: [softTissueRec] = []
   var  theTreatmentList: [procedureRec] = []
   var   theExerciseList: [exerciseRec] = []
    var   theSupplementList: [supplementRec] = []
}

struct SoapTabsView: View {
    @State  var selectedTab: Int = 0
    @State  var spinalData: SoapDataArr = SoapDataArr()
    @Binding var soapRec: SoapData
    var body: some View {
        VStack {
            NameDateView(soapRec: $soapRec)
                .padding(10)
                .onAppear{
                    buildArrays()

                }
            
            TabView(selection: $selectedTab)
            {
                SubjView(soapRec: $soapRec)
                    .tabItem{
                        Label("Subj", systemImage: "gear.circle.fill")
                    }
                    .tag(1)
                ObjSpinalView(spinalData: spinalData)
                
                    .tabItem{
                        Label("Obj 1", systemImage: "gear.circle.fill")
                    }
                    .tag(2)
                ObjView(soapRec: $soapRec, spinalData: spinalData)
                    .tabItem{
                        Label("Obj 2", systemImage: "gear.circle.fill")
                    }
                    .tag(3)
          
                AsessView(soapRec: $soapRec)
                    .tabItem{
                        Label("Assess", systemImage: "gear.circle.fill")
                    }
                    .tag(4)
                PlanView(soapRec: $soapRec)
                    .tabItem{
                        Label("Plan", systemImage: "gear.circle.fill")
                    }
                    .tag(5)
                
            }
        }
       .frame(width: 700)
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
        spinalData.theSpinalList.removeAll()
        data.forEach { value in
            var spineRec = spinalDataRec()
            let newVal : [String: Any] = value as! [String : Any]
            spineRec.dictToRec(theDictionary: newVal)
            spinalData.theSpinalList.append(spineRec)
        }
    }
    
    func buildMslArray(data: [Any])
    {
       // var spineArray: [spinalDataRec] = []
        spinalData.theMuscleList.removeAll()
        data.forEach { value in
            var mslRec = softTissueRec()
              let newVal : [String: Any] = value as! [String : Any]
            mslRec.dictToRec(theDictionary: newVal)
            spinalData.theMuscleList.append(mslRec)
            mslRec = softTissueRec()
        }
    }

    func buildTxArray(data: [Any])
    {
       // var spineArray: [spinalDataRec] = []
        spinalData.theTreatmentList.removeAll()
        data.forEach { value in
            var procRec = procedureRec()
               let newVal : [String: Any] = value as! [String : Any]
            procRec.dictToRec(theDictionary: newVal)
            spinalData.theTreatmentList.append(procRec)
        }
    }
    
    func buildExArray(data: [Any])
    {
       // var spineArray: [spinalDataRec] = []
        // theExerciseList: [exerciseRec
        spinalData.theExerciseList.removeAll()
        data.forEach { value in
            var exRec = exerciseRec()
              let newVal : [String: Any] = value as! [String : Any]
            exRec.dictToRec(theDictionary: newVal)
            spinalData.theExerciseList.append(exRec)
        }
    }

    func buildSupArray(data: [Any])
    {
       // var spineArray: [spinalDataRec] = []
        // theSupplementList: [supplementRec]
        spinalData.theSupplementList.removeAll()
        data.forEach { value in
            var supRec = supplementRec()
            let newVal : [String: Any] = value as! [String : Any]
            supRec.dictToRec(theDictionary: newVal)
            spinalData.theSupplementList.append(supRec)
        }
    }
}

#Preview {
   // SoapTabsView()
}
