//
//  SoapData.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 4/18/26.
//

import Foundation
import PostgresNIO

struct  SoapData  : Identifiable, Equatable, Hashable {
    var   id  = 0  // soapID
    var    nameid :  Int = 0
    var    name :  String = ""
    var    soap_date:  Date?
    var    sev_1 :  String = ""
    var    sev_2 :  String = ""
    var    sev_3 :  String = ""
    var    sev_4 :  String = ""
    var    sev_5 :  String = ""
    var    s1_freq :  String = ""
    var    s2_freq :  String = ""
    var    s3_freq :  String = ""
    var    s4_freq :  String = ""
    var    s5_freq :  String = ""
    var    sympt1 :  String = ""
    var    sympt2 :  String = ""
    var    sympt3 :  String = ""
    var    sympt4 :  String = ""
    var    sympt5 :  String = ""
    var    sp_tend_1 :  String = ""
    var    sp_tend_2 :  String = ""
    var    sp_tend_3 :  String = ""
    var    sp1_grade :  String = ""
    var    sp2_grade :  String = ""
    var    sp3_grade :  String = ""
    var    spd_1 :  String = ""
    var    spd_2 :  String = ""
    var    spd_3 :  String = ""
    var    sppos_1 :  String = ""
    var    sppos_2 :  String = ""
    var    sppos_3 :  String = ""
    var    mt1 :  String = ""
    var    mt2 :  String = ""
    var    mt3 :  String = ""
    var    mt1_grade :  String = ""
    var    mt2_grade :  String = ""
    var    mt3_grade :  String = ""
    var    tp_1 :  String = ""
    var    tp_2 :  String = ""
    var    tp1_grade :  String = ""
    var    tp2_grade :  String = ""
    var    inc_rom :  String = ""
    var    dec_rom :  String = ""
    var    cur_prog :  String = ""
    var    pt_prog :  String = ""
    var    tx_stage :  String = ""
    var    dx1 :  String = ""
    var    dx2 :  String = ""
    var    dx3 :  String = ""
    var    dx4 :  String = ""
    var    dx5 :  String = ""
    var    adj_type :  String = ""
    var    adj_loc :  String = ""
    var    adj_mvt :  String = ""
    var    pt1 :  String = ""
    var    pt2 :  String = ""
    var    pt3 :  String = ""
    var    pt1_loc :  String = ""
    var    pt2_loc :  String = ""
    var    pt3_loc :  String = ""
    var    pt1_goal :  String = ""
    var    pt2_goal :  String = ""
    var    pt3_goal :  String = ""
    var    supports :  String = ""
    var    exercs :  String = ""
    var    instructs :  String = ""
    var    vis_per_wk :  String = ""
    var    vis_duraddl :  String = ""
    var    pad1 :  String = ""
    var    pad2 :  String = ""
    var    pad3 :  String = ""
    var    anotes :  String = ""
    var    hx :  String = ""
    var    sid :  Int = 0
    var    oid :  Int = 0
    var    aid :  Int = 0
    var    pid :  Int = 0
    var    snotes :  String = ""
    var    onotes :  String = ""
    var    pnotes :  String = ""
    var    claim_num :  String = ""
    var    dr_code :  String = ""
    var    claim_id :  String = ""
    var    newSoapRec: Bool = false

    var  jointData: Data? = nil
    var  mslData:  Data? = nil
    var  procedures: Data? = nil
    var  exercises: Data? = nil
    var  supplements: Data? = nil
    var dataDict: DictListType = [:]
    
    init(){
        // Load from cache if available
        if let info = ColumnMetadataCache.shared.getInfo(for: "soap_tbl") {
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
    
    static func == (lhs: SoapData, rhs: SoapData) -> Bool {
        return
        lhs.id  == rhs.id  &&
        lhs.nameid == rhs.nameid &&
        lhs.name == rhs.name &&
        lhs.soap_date == rhs.soap_date &&
        lhs.sev_1 == rhs.sev_1 &&
        lhs.sev_2 == rhs.sev_2 &&
        lhs.sev_3 == rhs.sev_3 &&
        lhs.sev_4 == rhs.sev_4 &&
        lhs.sev_5 == rhs.sev_5 &&
        lhs.s1_freq == rhs.s1_freq &&
        lhs.s2_freq == rhs.s2_freq &&
        lhs.s3_freq == rhs.s3_freq &&
        lhs.s4_freq == rhs.s4_freq &&
        lhs.s5_freq == rhs.s5_freq &&
        lhs.sympt1 == rhs.sympt1 &&
        lhs.sympt2 == rhs.sympt2 &&
        lhs.sympt3 == rhs.sympt3 &&
        lhs.sympt4 == rhs.sympt4 &&
        lhs.sympt5 == rhs.sympt5 &&
        lhs.sp_tend_1 == rhs.sp_tend_1 &&
        lhs.sp_tend_2 == rhs.sp_tend_2 &&
        lhs.sp_tend_3 == rhs.sp_tend_3 &&
        lhs.sp1_grade == rhs.sp1_grade &&
        lhs.sp2_grade == rhs.sp2_grade &&
        lhs.sp3_grade == rhs.sp3_grade &&
        lhs.spd_1 == rhs.spd_1 &&
        lhs.spd_2 == rhs.spd_2 &&
        lhs.spd_3 == rhs.spd_3 &&
        lhs.sppos_1 == rhs.sppos_1 &&
        lhs.sppos_2 == rhs.sppos_2 &&
        lhs.sppos_3 == rhs.sppos_3 &&
        lhs.mt1 == rhs.mt1 &&
        lhs.mt2 == rhs.mt2 &&
        lhs.mt3 == rhs.mt3 &&
        lhs.mt1_grade == rhs.mt1_grade &&
        lhs.mt2_grade == rhs.mt2_grade &&
        lhs.mt3_grade == rhs.mt3_grade &&
        lhs.tp_1 == rhs.tp_1 &&
        lhs.tp_2 == rhs.tp_2 &&
        lhs.tp1_grade == rhs.tp1_grade &&
        lhs.tp2_grade == rhs.tp2_grade &&
        lhs.inc_rom == rhs.inc_rom &&
        lhs.dec_rom == rhs.dec_rom &&
        lhs.cur_prog == rhs.cur_prog &&
        lhs.pt_prog == rhs.pt_prog &&
        lhs.tx_stage == rhs.tx_stage &&
        lhs.dx1 == rhs.dx1 &&
        lhs.dx2 == rhs.dx2 &&
        lhs.dx3 == rhs.dx3 &&
        lhs.dx4 == rhs.dx4 &&
        lhs.dx5 == rhs.dx5 &&
        lhs.adj_type == rhs.adj_type &&
        lhs.adj_loc == rhs.adj_loc &&
        lhs.adj_mvt == rhs.adj_mvt &&
        lhs.pt1 == rhs.pt1 &&
        lhs.pt2 == rhs.pt2 &&
        lhs.pt3 == rhs.pt3 &&
        lhs.pt1_loc == rhs.pt1_loc &&
        lhs.pt2_loc == rhs.pt2_loc &&
        lhs.pt3_loc == rhs.pt3_loc &&
        lhs.pt1_goal == rhs.pt1_goal &&
        lhs.pt2_goal == rhs.pt2_goal &&
        lhs.pt3_goal == rhs.pt3_goal &&
        lhs.supports == rhs.supports &&
        lhs.exercs == rhs.exercs &&
        lhs.instructs == rhs.instructs &&
        lhs.vis_per_wk == rhs.vis_per_wk &&
        lhs.vis_duraddl == rhs.vis_duraddl &&
        lhs.pad1 == rhs.pad1 &&
        lhs.pad2 == rhs.pad2 &&
        lhs.pad3 == rhs.pad3 &&
        lhs.anotes == rhs.anotes &&
        lhs.hx == rhs.hx &&
        lhs.sid == rhs.sid &&
        lhs.oid == rhs.oid &&
        lhs.aid == rhs.aid &&
        lhs.pid == rhs.pid &&
        lhs.snotes == rhs.snotes &&
        lhs.onotes == rhs.onotes &&
        lhs.pnotes == rhs.pnotes &&
        lhs.claim_num == rhs.claim_num &&
        lhs.dr_code == rhs.dr_code &&
        lhs.claim_id == rhs.claim_id &&
        lhs.newSoapRec == rhs.newSoapRec
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    mutating func saveRec() async {
        self.recToDict()
        let sopc = soapClass()
        _ = await sopc.saveDictionary(dict: self.dataDict)
    }

    mutating    func recToDict(){
        var localDict:DictListType = self.dataDict
        localDict["soapid"]?.strVal = String(self.id)
        localDict["nameid"]?.strVal = String(self.nameid)
        localDict["name"]?.strVal = String(self.name)
        localDict["soap_date"]?.strVal = getDateOptString(from: self.soap_date,
                                                          formatStr: "yyyy-MM-dd")
        localDict["sev_1"]?.strVal = String(self.sev_1)
        localDict["sev_2"]?.strVal = String(self.sev_2)
        localDict["sev_3"]?.strVal = String(self.sev_3)
        localDict["sev_4"]?.strVal = String(self.sev_4)
        localDict["sev_5"]?.strVal = String(self.sev_5)
        localDict["s1_freq"]?.strVal = String(self.s1_freq)
        localDict["s2_freq"]?.strVal = String(self.s2_freq)
        localDict["s3_freq"]?.strVal = String(self.s3_freq)
        localDict["s4_freq"]?.strVal = String(self.s4_freq)
        localDict["s5_freq"]?.strVal = String(self.s5_freq)
        localDict["sympt1"]?.strVal = String(self.sympt1)
        localDict["sympt2"]?.strVal = String(self.sympt2)
        localDict["sympt3"]?.strVal = String(self.sympt3)
        localDict["sympt4"]?.strVal = String(self.sympt4)
        localDict["sympt5"]?.strVal = String(self.sympt5)
        localDict["sp_tend_1"]?.strVal = String(self.sp_tend_1)
        localDict["sp_tend_2"]?.strVal = String(self.sp_tend_2)
        localDict["sp_tend_3"]?.strVal = String(self.sp_tend_3)
        localDict["sp1_grade"]?.strVal = String(self.sp1_grade)
        localDict["sp2_grade"]?.strVal = String(self.sp2_grade)
        localDict["sp3_grade"]?.strVal = String(self.sp3_grade)
        localDict["spd_1"]?.strVal = String(self.spd_1)
        localDict["spd_2"]?.strVal = String(self.spd_2)
        localDict["spd_3"]?.strVal = String(self.spd_3)
        localDict["sppos_1"]?.strVal = String(self.sppos_1)
        localDict["sppos_2"]?.strVal = String(self.sppos_2)
        localDict["sppos_3"]?.strVal = String(self.sppos_3)
        localDict["mt1"]?.strVal = String(self.mt1)
        localDict["mt2"]?.strVal = String(self.mt2)
        localDict["mt3"]?.strVal = String(self.mt3)
        localDict["mt1_grade"]?.strVal = String(self.mt1_grade)
        localDict["mt2_grade"]?.strVal = String(self.mt2_grade)
        localDict["mt3_grade"]?.strVal = String(self.mt3_grade)
        localDict["tp_1"]?.strVal = String(self.tp_1)
        localDict["tp_2"]?.strVal = String(self.tp_2)
        localDict["tp1_grade"]?.strVal = String(self.tp1_grade)
        localDict["tp2_grade"]?.strVal = String(self.tp2_grade)
        localDict["inc_rom"]?.strVal = String(self.inc_rom)
        localDict["dec_rom"]?.strVal = String(self.dec_rom)
        localDict["cur_prog"]?.strVal = String(self.cur_prog)
        localDict["pt_prog"]?.strVal = String(self.pt_prog)
        localDict["tx_stage"]?.strVal = String(self.tx_stage)
        localDict["dx1"]?.strVal = String(self.dx1)
        localDict["dx2"]?.strVal = String(self.dx2)
        localDict["dx3"]?.strVal = String(self.dx3)
        localDict["dx4"]?.strVal = String(self.dx4)
        localDict["dx5"]?.strVal = String(self.dx5)
        localDict["adj_type"]?.strVal = String(self.adj_type)
        localDict["adj_loc"]?.strVal = String(self.adj_loc)
        localDict["adj_mvt"]?.strVal = String(self.adj_mvt)
        localDict["pt1"]?.strVal = String(self.pt1)
        localDict["pt2"]?.strVal = String(self.pt2)
        localDict["pt3"]?.strVal = String(self.pt3)
        localDict["pt1_loc"]?.strVal = String(self.pt1_loc)
        localDict["pt2_loc"]?.strVal = String(self.pt2_loc)
        localDict["pt3_loc"]?.strVal = String(self.pt3_loc)
        localDict["pt1_goal"]?.strVal = String(self.pt1_goal)
        localDict["pt2_goal"]?.strVal = String(self.pt2_goal)
        localDict["pt3_goal"]?.strVal = String(self.pt3_goal)
        localDict["supports"]?.strVal = String(self.supports)
        localDict["exercs"]?.strVal = String(self.exercs)
        localDict["instructs"]?.strVal = String(self.instructs)
        localDict["vis_per_wk"]?.strVal = String(self.vis_per_wk)
        localDict["vis_duraddl"]?.strVal = String(self.vis_duraddl)
        localDict["pad1"]?.strVal = String(self.pad1)
        localDict["pad2"]?.strVal = String(self.pad2)
        localDict["pad3"]?.strVal = String(self.pad3)
        localDict["anotes"]?.strVal = String(self.anotes)
        localDict["hx"]?.strVal = String(self.hx)
        localDict["sid"]?.strVal = String(self.sid)
        localDict["oid"]?.strVal = String(self.oid)
        localDict["aid"]?.strVal = String(self.aid)
        localDict["pid"]?.strVal = String(self.pid)
        localDict["snotes"]?.strVal = String(self.snotes)
        localDict["onotes"]?.strVal = String(self.onotes)
        localDict["pnotes"]?.strVal = String(self.pnotes)
        localDict["claim_num"]?.strVal = String(self.claim_num)
        localDict["dr_code"]?.strVal = String(self.dr_code)
        localDict["claim_id"]?.strVal = String(self.claim_id)
        localDict["newsoaprec"]?.strVal = String(self.newSoapRec)
  /*      localDict["jointdata"]?.strVal = String(self.jointData)
        localDict["msldata"]?.strVal = String(self.mslData)
        localDict["procedures"]?.strVal = String(self.procedures)
        localDict["exercises"]?.strVal = String(self.exercises)
        localDict["supplements"]?.strVal = String(self.supplements)
        localDict["dataDict"]?.strVal = String(self.dataDict)*/
        
        
        self.dataDict = localDict

    }
    
    mutating func dictToRec(dict: DictListType)
    {
        dataDict = dict
        readDictValues()
    }
    
    mutating  func readDictValues(){
      //  let empID = getString(key: "employee_id"]?.strVal ?? "0"
      //
        self.id = getInt(key: "soapid")
        self.nameid = getInt(key:"nameid")
        
        self.name = getString(key: "name") 
        self.soap_date = getDate(key: "soap_date")
        self.sev_1 = getString(key: "sev_1")
        self.sev_2 = getString(key: "sev_2") 
        self.sev_3 = getString(key: "sev_3") 
        self.sev_4 = getString(key: "sev_4") 
        self.sev_5 = getString(key: "sev_5") 
        self.s1_freq = getString(key: "s1_freq") 
        self.s2_freq = getString(key: "s2_freq") 
        self.s3_freq = getString(key: "s3_freq") 
        self.s4_freq = getString(key: "s4_freq") 
        self.s5_freq = getString(key: "s5_freq") 
        self.sympt1 = getString(key: "sympt1") 
        self.sympt2 = getString(key: "sympt2") 
        self.sympt3 = getString(key: "sympt3") 
        self.sympt4 = getString(key: "sympt4") 
        self.sympt5 = getString(key: "sympt5") 
        self.sp_tend_1 = getString(key: "sp_tend_1") 
        self.sp_tend_2 = getString(key: "sp_tend_2") 
        self.sp_tend_3 = getString(key: "sp_tend_3") 
        self.sp1_grade = getString(key: "sp1_grade") 
        self.sp2_grade = getString(key: "sp2_grade") 
        self.sp3_grade = getString(key: "sp3_grade") 
        self.spd_1 = getString(key: "spd_1") 
        self.spd_2 = getString(key: "spd_2") 
        self.spd_3 = getString(key: "spd_3") 
        self.sppos_1 = getString(key: "sppos_1") 
        self.sppos_2 = getString(key: "sppos_2") 
        self.sppos_3 = getString(key: "sppos_3") 
        self.mt1 = getString(key: "mt1") 
        self.mt2 = getString(key: "mt2") 
        self.mt3 = getString(key: "mt3") 
        self.mt1_grade = getString(key: "mt1_grade") 
        self.mt2_grade = getString(key: "mt2_grade") 
        self.mt3_grade = getString(key: "mt3_grade") 
        self.tp_1 = getString(key: "tp_1") 
        self.tp_2 = getString(key: "tp_2") 
        self.tp1_grade = getString(key: "tp1_grade") 
        self.tp2_grade = getString(key: "tp2_grade") 
        self.inc_rom = getString(key: "inc_rom") 
        self.dec_rom = getString(key: "dec_rom") 
        self.cur_prog = getString(key: "cur_prog") 
        self.pt_prog = getString(key: "pt_prog") 
        self.tx_stage = getString(key: "tx_stage") 
        self.dx1 = getString(key: "dx1") 
        self.dx2 = getString(key: "dx2") 
        self.dx3 = getString(key: "dx3") 
        self.dx4 = getString(key: "dx4") 
        self.dx5 = getString(key: "dx5") 
        self.adj_type = getString(key: "adj_type") 
        self.adj_loc = getString(key: "adj_loc") 
        self.adj_mvt = getString(key: "adj_mvt") 
        self.pt1 = getString(key: "pt1") 
        self.pt2 = getString(key: "pt2") 
        self.pt3 = getString(key: "pt3") 
        self.pt1_loc = getString(key: "pt1_loc") 
        self.pt2_loc = getString(key: "pt2_loc") 
        self.pt3_loc = getString(key: "pt3_loc") 
        self.pt1_goal = getString(key: "pt1_goal") 
        self.pt2_goal = getString(key: "pt2_goal") 
        self.pt3_goal = getString(key: "pt3_goal") 
        self.supports = getString(key: "supports") 
        self.exercs = getString(key: "exercs") 
        self.instructs = getString(key: "instructs") 
        self.vis_per_wk = getString(key: "vis_per_wk") 
        self.vis_duraddl = getString(key: "vis_duraddl") 
        self.pad1 = getString(key: "pad1") 
        self.pad2 = getString(key: "pad2") 
        self.pad3 = getString(key: "pad3") 
        self.anotes = getString(key: "anotes") 
        self.hx = getString(key: "hx") 
        self.sid = getInt(key: "sid")
        self.oid = getInt(key: "oid")
        self.aid = getInt(key: "aid")
        self.pid = getInt(key: "pid")
        self.snotes = getString(key: "snotes") 
        self.onotes = getString(key: "onotes") 
        self.pnotes = getString(key: "pnotes") 
        self.claim_num = getString(key: "claim_num")
        self.dr_code = getString(key: "dr_code") 
        self.claim_id = getString(key: "claim_id") 
        self.newSoapRec = getBool(key:   "newsoaprec")
        self.jointData = getData(key: "jointdata")
        self.mslData =  getData(key: "msldata")
        self.procedures =  getData(key: "procedures")
        self.exercises = getData(key: "exercises")
        self.supplements = getData(key: "supplements")

       // self.dataDict = dataDict["dataDict:") 
    }
    
    
    func getInt(key:    String)->Int{
        var result: Int = 0
        let str = dataDict[key]?.strVal ?? ""
        
        result = Int(str) ?? 0
        return result
        
    }
    
    func getString(key:    String)->String{
        var result: String = ""
        let str = dataDict[key]?.strVal ?? ""
        
        result = str
        return result
        
    }
    

    
    func getBool(key:   String)-> Bool{
        var Result : Bool = false
        let str = dataDict[key]?.strVal ?? ""
        
        Result = Bool(str) ?? false
        return Result
    }
    
    func getData(key: String) -> Data? {
        guard let str = dataDict[key]?.strVal, !str.isEmpty else { return nil }
        return Data(base64Encoded: str)
    }
    
    func getDate(key:    String)->Date?{
        var result: Date? = nil
        let str = dataDict[key]?.strVal ?? ""
        
        result = StringToDate(dateString: str)
        return result
    }

}


public class soapClass: pgClientClass{
    
    init(doAlert: AlertManager? = nil){
        super.init(doAlert: doAlert,
                   tName: "soap_tbl",
                   pkField: "id")
    }
    
    func buildSoapist(nameID:  Int) async -> [SoapData]{
        var text: String = ""
        var result: [SoapData] = []
        
        
            text = "SELECT * FROM public.soap_tbl  WHERE nameid = \(nameID)   ORDER BY soap_date ASC ;"
        
        await executeQuery(text: text)
        var theSoapRec = SoapData()

        for soapRec in dictList{
            theSoapRec.dictToRec(dict: soapRec)
            result.append(theSoapRec)
        }
        
        return result
    }
    

}
