//
//  PatientData.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 4/22/26.
//

import Foundation
import PostgresNIO

struct  PatientData  : Identifiable, Equatable, Hashable {
    var id:   Int = 0// ptseqnum
    var lastname: String = ""
    var firstname: String = ""
    var fullname: String {
        get {
            return "\(firstname) \(lastname)"
        }
    }
    var street: String = ""
    var city: String = ""
    var state: String = ""
    var zip: String = ""
    var gender: String = ""
    var homephone: String = ""
    var claim_num: String = ""
    var inj_date: Date?
    var employer: String = ""
    var insco: String = ""
    var dob: Date?
    var age: Int = 0
    var doprint: Bool = false
    var workphone: String = ""
    var hipaa: Bool = false
    var dont_bill: Bool = false
    var firstvisit: Date?
    var referredby: String = ""
    var pt_ss_num: String = ""
    var def_dr: String = ""
    var commentdate: Date?
    var def_trans: String = ""
    var pttype: String = ""
    var pt_note: String = ""
    var email: String = ""
    var informed_consent: Bool = false
    var alpha_2: Bool = false
    var alpha_date: Date?
    var recent_visit: Date?
    var dataDict: DictListType = [:]
    
    init(){
        // Load from cache if available
        if let info = ColumnMetadataCache.shared.getInfo(for: "patient_data") {
            self.initDictionary(colNames: info.colNames, colTypes: info.colTypes)
        }
    }
    
    mutating func initDictionary(colNames: [String], colTypes: [colTypes]){
        var row: [String: DictValue] = [:]
        for (key, itemType) in Swift.zip(colNames, colTypes) {
            let dictItem: DictValue = (strVal: "", type: itemType)
            row[key] = dictItem
        }
        dataDict = row
    }

    
    static func == (lhs: PatientData, rhs: PatientData) -> Bool {
        return
        lhs.lastname == rhs.lastname &&
        lhs.firstname == rhs.firstname &&
        lhs.street == rhs.street &&
        lhs.city == rhs.city &&
        lhs.state == rhs.state &&
        lhs.zip == rhs.zip &&
        lhs.gender == rhs.gender &&
        lhs.homephone == rhs.homephone &&
        lhs.claim_num == rhs.claim_num &&
        lhs.inj_date == rhs.inj_date &&
        lhs.employer == rhs.employer &&
        lhs.insco == rhs.insco &&
        lhs.dob == rhs.dob &&
        lhs.age == rhs.age &&
        lhs.doprint == rhs.doprint &&
        lhs.workphone == rhs.workphone &&
        lhs.hipaa == rhs.hipaa &&
        lhs.dont_bill == rhs.dont_bill &&
        lhs.firstvisit == rhs.firstvisit &&
        lhs.referredby == rhs.referredby &&
        lhs.pt_ss_num == rhs.pt_ss_num &&
        lhs.def_dr == rhs.def_dr &&
        lhs.commentdate == rhs.commentdate &&
        lhs.def_trans == rhs.def_trans &&
        lhs.pttype == rhs.pttype &&
        lhs.pt_note == rhs.pt_note &&
        lhs.email == rhs.email &&
        lhs.informed_consent == rhs.informed_consent &&
        lhs.alpha_2 == rhs.alpha_2 &&
        lhs.alpha_date == rhs.alpha_date &&
        lhs.recent_visit == rhs.recent_visit
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    mutating func saveRec() async {
        self.recToDict()
        let ptc = patientClass()
        _ = await ptc.saveDictionary(dict: self.dataDict)
    }
    
    mutating func recToDict(){
        //self.dataDict = self.dob.toolbar.dictFromStruct(self)
        var localDict:DictListType = self.dataDict
        localDict["ptseqnum"]?.strVal = String(self.id)
        localDict["lastname"]?.strVal = String(self.lastname)
        localDict["firstname"]?.strVal = String(self.firstname)
        localDict["street"]?.strVal = String(self.street)
        localDict["city"]?.strVal = String(self.city)
        localDict["state"]?.strVal = String(self.state)
        localDict["zip"]?.strVal = String(self.zip)
        localDict["gender"]?.strVal = String(self.gender)
        localDict["homephone"]?.strVal = String(self.homephone)
        localDict["claim_num"]?.strVal = String(self.claim_num)
        
        localDict["inj_date"]?.strVal = getDateOptString(from: self.inj_date,
                                                        formatStr: "yyyy-mm-dd")
        localDict["employer"]?.strVal = String(self.employer)
        localDict["insco"]?.strVal = String(self.insco)
        localDict["dob"]?.strVal = getDateOptString(from: self.dob,
                                                    formatStr: "yyyy-mm-dd")
        
        localDict["age"]?.strVal = String(self.age)
        localDict["doprint"]?.strVal = String(self.doprint)
        localDict["workphone"]?.strVal = String(self.workphone)
        localDict["hipaa"]?.strVal = String(self.hipaa)
        localDict["dont_bill"]?.strVal = String(self.dont_bill)
        localDict["firstvisit"]?.strVal = getDateOptString(from: self.firstvisit,
                                                           formatStr: "yyyy-mm-dd")

    
        localDict["referredby"]?.strVal = String(self.referredby)
        localDict["pt_ss_num"]?.strVal = String(self.pt_ss_num)
        localDict["def_dr"]?.strVal = String(self.def_dr)
        localDict["commentdate"]?.strVal = getDateOptString(from: self.commentdate,
                                                            formatStr: "yyyy-mm-dd")

        localDict["def_trans"]?.strVal = String(self.def_trans)
        localDict["pttype"]?.strVal = String(self.pttype)
        localDict["pt_note"]?.strVal = String(self.pt_note)
        localDict["email"]?.strVal = String(self.email)
        localDict["informed_consent"]?.strVal = String(self.informed_consent)
        localDict["alpha_2"]?.strVal = String(self.alpha_2)
        localDict["alpha_date"]?.strVal = getDateOptString(from: self.alpha_date,
                                                           formatStr: "yyyy-mm-dd")

        localDict["recent_visit"]?.strVal = getDateOptString(from: self.recent_visit,
                                                             formatStr: "yyyy-mm-dd")

        self.dataDict = localDict
    }
    
    mutating func dictToRec(dict: DictListType)
    {
        dataDict = dict
        readDictValues()
    }
    
    mutating func readDictValues(){
     //   self.dataDict = dict
        self.id = getInt(key: "ptseqnum")
        self.lastname = getString(key: "lastname")
        self.firstname = getString(key: "firstname")
        self.street = getString(key: "street")
        self.city = getString(key: "city")
        self.state = getString(key: "state")
        self.zip = getString(key: "zip")
        self.gender = getString(key: "gender")
        self.homephone = getString(key: "homephone")
        self.claim_num = getString(key: "claim_num")
        self.inj_date = getDate(key: "inj_date")
        self.employer = getString(key: "employer")
        self.insco = getString(key: "insco")
        self.dob = getDate(key: "dob")
        self.age = getInt(key: "age")
        self.doprint = getBool(key: "doprint")
        self.workphone = getString(key: "workphone")
        self.hipaa = getBool(key: "hipaa")
        self.dont_bill = getBool(key: "dont_bill")
        self.firstvisit = getDate(key: "firstvisit")
        self.referredby = getString(key: "referredby")
        self.pt_ss_num = getString(key: "pt_ss_num")
        self.def_dr = getString(key: "def_dr")
        self.commentdate = getDate(key: "commentdate")
        self.def_trans = getString(key: "def_trans")
        self.pttype = getString(key: "pttype")
        self.pt_note = getString(key: "pt_note")
        self.email = getString(key: "email")
        self.informed_consent = getBool(key: "informed_consent")
        self.alpha_2 = getBool(key: "alpha_2")
        self.alpha_date = getDate(key: "alpha_date")
        self.recent_visit = getDate(key: "recent_visit")
    }
    
    func getInt(key:    String)->Int{
        var result: Int = 0
        let str = dataDict[key]?.strVal ?? ""
        
        result = Int(str) ?? 0
        return result
        
    }
    
    func getBool(key:   String)-> Bool{
        let str = dataDict[key]?.strVal ?? ""
        return str == "t" || str == "true" || str == "1"
    }

    func getData(key:   String)-> Data?{
        var Result : Data? = nil
        let str = dataDict[key]?.strVal ?? ""
        
        Result = Data(str.utf8)
        return Result
    }
    
    
    func getString(key:    String)->String{
        var result: String = ""
        let str = dataDict[key]?.strVal ?? ""
        
        result = str
        return result
        
    }
    func getDate(key:    String)->Date?{
        var result: Date? = nil
        let str = dataDict[key]?.strVal ?? ""
        
        result = StringToDate(dateString: str)
        return result
    }
    

    
    

}

public class patientClass: pgClientClass{
    
    init(doAlert: AlertManager? = nil){
        super.init(doAlert: doAlert,
                   tName: "patient_data",
                   pkField: "ptseqnum")
    }
    

    func buildPatientList(showAll: Bool) async -> [PatientData]{
        var text: String = ""
        var result: [PatientData] = []
        
        
            text = "SELECT * FROM public.patient_data  ORDER BY firstname ASC ;"
        
        await executeQuery(text: text)
        var thePatient = PatientData()

        for person in dictList{
            thePatient.dictToRec(dict: person)
            result.append(thePatient)
        }
        
        return result
    }

}

