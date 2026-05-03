//
//  SpinalDataRecs.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 5/2/26.
//

import Foundation

struct spinalDataRec : Identifiable{
    var id  = UUID()
    var theLevel: String = ""
    var theSide: String = ""
    var intensity: String = ""
    var notes: String = ""
    var palpTender: Bool = false
    var fixation: Bool = false
    var swelling: Bool = false
    var hypermobility: Bool = false
    var spinalData: [String: Any] = [:]
    
  mutating  func dictToRec(theDictionary: [String: Any])
    {
        spinalData = theDictionary
        theLevel = spinalData["theArea"] as? String ?? ""
        theSide = spinalData["theSide"] as? String ?? ""
        intensity = spinalData["intensity"] as? String ?? ""
        notes = spinalData["notes"] as? String ?? ""
        fixation = spinalData["fixation"] as? Bool ?? false
        swelling = spinalData["swelling"] as? Bool ?? false
        palpTender = spinalData["palpTender"] as? Bool ?? false
        hypermobility = spinalData["hypermobility"] as? Bool ?? false
        
    }
    
}

struct softTissueRec : Identifiable{
    var id = UUID()
    var theArea: String = ""
    var theSide: String = ""
    var intensity: String = ""
    var notes: String = ""
    var palpatoryTenderness: Bool = false
    var muscleTension: Bool = false
    var swelling: Bool = false
    var spasm: Bool = false
    var softTissueData: [String: Any] = [:]
    
    mutating  func dictToRec(theDictionary: [String: Any])
    {
        softTissueData = theDictionary
        theArea = softTissueData["theArea"] as? String ?? ""
        theSide = softTissueData["theSide"] as? String ?? ""
        intensity = softTissueData["intensity"] as? String ?? ""
        notes = softTissueData["notes"] as? String ?? ""
        palpatoryTenderness = softTissueData["palpatoryTenderness"] as? Bool ?? false
        swelling = softTissueData["swelling"] as? Bool ?? false
        spasm = softTissueData["spasm"] as? Bool ?? false
        muscleTension = softTissueData["muscleTension"] as? Bool ?? false
        
    }
}

struct procedureRec : Identifiable{
    var id = UUID()
    var theArea: String = ""
    var theModality: String = ""
    var units: Int = 0
    var cervical: Bool = false
    var thoracic: Bool = false
    var costovertebral: Bool = false
    var lumbar: Bool = false
    var sacral: Bool = false
    var pelvis: Bool = false
    var other: String = ""
    var dx1: Bool = false
    var dx2: Bool = false
    var dx3: Bool = false
    var dx4: Bool = false
    var procedureData: [String: Any] = [:]
    mutating  func dictToRec(theDictionary: [String: Any])
    {
        procedureData = theDictionary
        theArea = procedureData["theArea"] as? String ?? ""
        theModality = procedureData["theModality"] as? String ?? ""
        units = procedureData["units"] as? Int ?? 0
        cervical = procedureData["area_cervical"] as? Bool ?? false
        thoracic = procedureData["area_thoracic"] as? Bool ?? false
        lumbar = procedureData["area_lumbar"] as? Bool ?? false
        sacral = procedureData["area_sacral"] as? Bool ?? false
        pelvis = procedureData["area_pelvis"] as? Bool ?? false
        other =  procedureData["area_other"] as? String ?? ""
        dx1 = procedureData["dx1"] as? Bool ?? false
        dx2 = procedureData["dx2"] as? Bool ?? false
        dx3 = procedureData["dx3"] as? Bool ?? false
        dx4 = procedureData["dx4"] as? Bool ?? false

    }
}

struct exerciseRec : Identifiable{
    var id = UUID()
    var exercise: String = ""
    var frequency: String = ""
    var purpose: String = ""
    var dx1: Bool = false
    var dx2: Bool = false
    var dx3: Bool = false
    var dx4: Bool = false
    var exerciseData: [String: Any] = [:]
    mutating  func dictToRec(theDictionary: [String: Any])
    {
        exerciseData = theDictionary
        exercise = theDictionary["exercise"] as? String ?? ""
        frequency = theDictionary["frequency"] as? String ?? ""
        purpose = theDictionary["purpose"] as? String ?? ""
        dx1 = theDictionary["dx1"] as? Bool ?? false
        dx2 = theDictionary["dx2"] as? Bool ?? false
        dx3 = theDictionary["dx3"] as? Bool ?? false
        dx4 = theDictionary["dx4"] as? Bool ?? false
    }
}

struct supplementRec : Identifiable{
    var id = UUID()
    var supplement: String = ""
    var frequency: String = ""
    var purpose: String = ""
    var dx1: Bool = false
    var dx2: Bool = false
    var dx3: Bool = false
    var dx4: Bool = false
    var supplementData: [String: Any] = [:]
    mutating  func dictToRec(theDictionary: [String: Any])
    {
        supplementData = theDictionary
        supplement = theDictionary["supplement"] as? String ?? ""
        frequency = theDictionary["frequency"] as? String ?? ""
        purpose = theDictionary["purpose"] as? String ?? ""
        dx1 = theDictionary["dx1"] as? Bool ?? false
        dx2 = theDictionary["dx2"] as? Bool ?? false
        dx3 = theDictionary["dx3"] as? Bool ?? false
        dx4 = theDictionary["dx4"] as? Bool ?? false
    }
}
