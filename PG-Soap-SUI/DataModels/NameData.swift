//
//  PatientData.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 4/22/26.
//

import Foundation
import PostgresNIO

struct  NameData  : Identifiable, Equatable, Hashable {
    var id:   Int = 0// nameid
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
    var email: String = ""
    var hipaa: Bool = false
    var recentEval: Date?
    var firstvisit: Date?
    var pt_ss_num: String = ""
    var referredby: String = ""
    var informed_consent: Bool = false

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

    
    static func == (lhs: NameData, rhs: NameData) -> Bool {
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
        lhs.firstvisit == rhs.firstvisit &&
        lhs.referredby == rhs.referredby &&
        lhs.pt_ss_num == rhs.pt_ss_num &&
        lhs.email == rhs.email &&
        lhs.informed_consent == rhs.informed_consent
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
        localDict["nameid"]?.strVal = String(self.id)
        localDict["lastname"]?.strVal = String(self.lastname)
        localDict["firstname"]?.strVal = String(self.firstname)
        localDict["street"]?.strVal = String(self.street)
        localDict["city"]?.strVal = String(self.city)
        localDict["state"]?.strVal = String(self.state)
        localDict["zip"]?.strVal = String(self.zip)
        localDict["gender"]?.strVal = String(self.gender)
        localDict["home_phone"]?.strVal = String(self.homephone)
        localDict["def_claim_num"]?.strVal = String(self.claim_num)
        
        localDict["inj_date"]?.strVal = getDateOptString(from: self.inj_date,
                                                        formatStr: "yyyy-mm-dd")
        localDict["employer"]?.strVal = String(self.employer)
        localDict["insco"]?.strVal = String(self.insco)
        localDict["dob"]?.strVal = getDateOptString(from: self.dob,
                                                    formatStr: "yyyy-mm-dd")
        
        localDict["age"]?.strVal = String(self.age)
        localDict["doprint"]?.strVal = String(self.doprint)
        localDict["work_phone"]?.strVal = String(self.workphone)
        localDict["HIPPA"]?.strVal = String(self.hipaa)
         localDict["first_visit"]?.strVal = getDateOptString(from: self.firstvisit,
                                                           formatStr: "yyyy-mm-dd")

    
        localDict["referredby"]?.strVal = String(self.referredby)
        localDict["SS_Num"]?.strVal = String(self.pt_ss_num)


         localDict["email"]?.strVal = String(self.email)
        localDict["informed_consent"]?.strVal = String(self.informed_consent)
 
  
        self.dataDict = localDict
    }
    
    mutating func dictToRec(dict: DictListType)
    {
        dataDict = dict
        readDictValues()
    }
    
    mutating func readDictValues(){
     //   self.dataDict = dict
        self.id = getInt(key: "nameid")
        self.lastname = getString(key: "lastname")
        self.firstname = getString(key: "firstname")
        self.street = getString(key: "street")
        self.city = getString(key: "city")
        self.state = getString(key: "state")
        self.zip = getString(key: "zip")
        self.gender = getString(key: "gender")
        self.homephone = getString(key: "home_phone")
        self.claim_num = getString(key: "def_claim_num")
        self.inj_date = getDate(key: "inj_date")
        self.employer = getString(key: "employer")
        self.insco = getString(key: "insco")
        self.dob = getDate(key: "dob")
        self.age = getInt(key: "age")
        self.doprint = getBool(key: "doprint")
        self.workphone = getString(key: "work_phone")
        self.email = getString(key: "email")
        self.hipaa = getBool(key: "HIPPA")
        self.recentEval = getDate(key: "recent_eval")
        self.firstvisit = getDate(key: "first_visit")
        self.pt_ss_num = getString(key: "SS_Num")
        self.informed_consent = getBool(key: "informed_consent")
    }
    
    func getInt(key:    String)->Int{
        var result: Int = 0
        let str = dataDict[key]?.strVal ?? ""
        
        result = Int(str) ?? 0
        return result
        
    }
    
    func getBool(key:   String)-> Bool{
        var Result : Bool = false
        let str = dataDict[key]?.strVal ?? ""
        
        Result = Bool(str) ?? false
        return Result
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

public class nameClass: pgClientClass{
    
    init(doAlert: AlertManager? = nil){
        super.init(doAlert: doAlert,
                   tName: "name_tbl",
                   pkField: "nameid")
    }
    

    func buildNameList(showAll: Bool) async -> [NameData]{
        var text: String = ""
        var result: [NameData] = []
        
        
            text = "SELECT * FROM public.name_tbl  ORDER BY firstname ASC ;"
        
        await executeQuery(text: text)
        var thePerson = NameData()

        for person in dictList{
            thePerson.dictToRec(dict: person)
            result.append(thePerson)
        }
        
        return result
    }

}

