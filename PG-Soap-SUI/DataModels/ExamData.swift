//
//  ExamData.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 4/28/26.
//

import Foundation
import PostgresNIO


struct  ExamData  : Identifiable, Equatable, Hashable {
    var id: Int = 0
    var nameid: Int = 0
    var exname: String = ""
    var exdate: Date?
    var exdoi: Date?
    var exemp: String = ""
    var exinsco: String = ""
    var exmechons: String = ""
    var exprevinj: String = ""
    var exbuild: String = ""
    var exgait: String = ""
    var exmvt: String = ""
    var exantalg: String = ""
    var exht: String = ""
    var exwt: String = ""
    var expulse: String = ""
    var extemp: String = ""
    var exbpsr: String = ""
    var exbpdr: String = ""
    var exbpsl: String = ""
    var exbpdl: String = ""
    var exbppos: String = ""
    var exhdtlt: String = ""
    var exhghshld: String = ""
    var exhghhip: String = ""
    var exscol: String = ""
    var exkyph: String = ""
    var exlord: String = ""
    var exrthand: String = ""
    var exlthand: String = ""
    var exrtknee: String = ""
    var exltknee: String = ""
    var exrtfoot: String = ""
    var exltfoot: String = ""
    var exrtdyno1: String = ""
    var exrtdyno2: String = ""
    var exrtdyno3: String = ""
    var exltdyno1: String = ""
    var exltdyno2: String = ""
    var exltdyno3: String = ""
    var exmeasbicrt: String = ""
    var exmeasbiclt: String = ""
    var exrtforearm: String = ""
    var exlfforearm: String = ""
    var exrtthigh: String = ""
    var exltthigh: String = ""
    var exrtcalf: String = ""
    var exltcalf: String = ""
    var exreflrtbic: String = ""
    var exreflltbic: String = ""
    var exreflrttric: String = ""
    var exrefllttric: String = ""
    var exreflrtbrach: String = ""
    var exreflltbrach: String = ""
    var exreflrtpat: String = ""
    var exreflltpat: String = ""
    var exdtrnorm: String = ""
    var exrtachil: String = ""
    var exltachil: String = ""
    var exuehoffman: String = ""
    var exlebabinski: String = ""
    var exchadd: String = ""
    var exrtanes: String = ""
    var exltanes: String = ""
    var exrthypo: String = ""
    var exlthypo: String = ""
    var exrthyper: String = ""
    var exlthyper: String = ""
    var exrtanal: String = ""
    var exltanal: String = ""
    var exrthypoalg: String = ""
    var exlthypoalg: String = ""
    var exrthyperalg: String = ""
    var exlthyperalg: String = ""
    var excran1: String = ""
    var excran2: String = ""
    var excran346: String = ""
    var excran5: String = ""
    var excran7: String = ""
    var excran8: String = ""
    var excran9: String = ""
    var excran10: String = ""
    var excranwnl: String = ""
    var excran11: String = ""
    var excran12: String = ""
    var exrhom: String = ""
    var exfingnose: String = ""
    var exfingfing: String = ""
    var exheelwk: String = ""
    var extoewk: String = ""
    var exorth1: String = ""
    var exorth2: String = ""
    var exorth3: String = ""
    var exorth4: String = ""
    var exorth5: String = ""
    var exorth6: String = ""
    var exorth7: String = ""
    var exorth8: String = ""
    var exorth9: String = ""
    var exorth10: String = ""
    var exorth11: String = ""
    var exorth12: String = ""
    var exorth13: String = ""
    var exorth14: String = ""
    var exorth15: String = ""
    var exnotes: String = ""
    var exam_rpt_id: Int = 0
    var exsex: String = ""
    var exhanded: String = ""
    var claim_num: String = ""
    var rom_data: Data?
    var xray_data: Data?
    var fri_score: Int = 0
    
    var dataDict: DictListType = [:]
    
    init(){
        // Load from cache if available
        if let info = ColumnMetadataCache.shared.getInfo(for: "exam_tbl") {
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

    
    static func == (lhs: ExamData, rhs: ExamData) -> Bool {
        return
        lhs.id == rhs.id &&
        lhs.nameid == rhs.nameid &&
        lhs.exname == rhs.exname &&
        lhs.exdate == rhs.exdate &&
        lhs.exdoi == rhs.exdoi &&
        lhs.exemp == rhs.exemp &&
        lhs.exinsco == rhs.exinsco &&
        lhs.exmechons == rhs.exmechons &&
        lhs.exprevinj == rhs.exprevinj &&
        lhs.exbuild == rhs.exbuild &&
        lhs.exgait == rhs.exgait &&
        lhs.exmvt == rhs.exmvt &&
        lhs.exantalg == rhs.exantalg &&
        lhs.exht == rhs.exht &&
        lhs.exwt == rhs.exwt &&
        lhs.expulse == rhs.expulse &&
        lhs.extemp == rhs.extemp &&
        lhs.exbpsr == rhs.exbpsr &&
        lhs.exbpdr == rhs.exbpdr &&
        lhs.exbpsl == rhs.exbpsl &&
        lhs.exbpdl == rhs.exbpdl &&
        lhs.exbppos == rhs.exbppos &&
        lhs.exhdtlt == rhs.exhdtlt &&
        lhs.exhghshld == rhs.exhghshld &&
        lhs.exhghhip == rhs.exhghhip &&
        lhs.exscol == rhs.exscol &&
        lhs.exkyph == rhs.exkyph &&
        lhs.exlord == rhs.exlord &&
        lhs.exrthand == rhs.exrthand &&
        lhs.exlthand == rhs.exlthand &&
        lhs.exrtknee == rhs.exrtknee &&
        lhs.exltknee == rhs.exltknee &&
        lhs.exrtfoot == rhs.exrtfoot &&
        lhs.exltfoot == rhs.exltfoot &&
        lhs.exrtdyno1 == rhs.exrtdyno1 &&
        lhs.exrtdyno2 == rhs.exrtdyno2 &&
        lhs.exrtdyno3 == rhs.exrtdyno3 &&
        lhs.exltdyno1 == rhs.exltdyno1 &&
        lhs.exltdyno2 == rhs.exltdyno2 &&
        lhs.exltdyno3 == rhs.exltdyno3 &&
        lhs.exmeasbicrt == rhs.exmeasbicrt &&
        lhs.exmeasbiclt == rhs.exmeasbiclt &&
        lhs.exrtforearm == rhs.exrtforearm &&
        lhs.exlfforearm == rhs.exlfforearm &&
        lhs.exrtthigh == rhs.exrtthigh &&
        lhs.exltthigh == rhs.exltthigh &&
        lhs.exrtcalf == rhs.exrtcalf &&
        lhs.exltcalf == rhs.exltcalf &&
        lhs.exreflrtbic == rhs.exreflrtbic &&
        lhs.exreflltbic == rhs.exreflltbic &&
        lhs.exreflrttric == rhs.exreflrttric &&
        lhs.exrefllttric == rhs.exrefllttric &&
        lhs.exreflrtbrach == rhs.exreflrtbrach &&
        lhs.exreflltbrach == rhs.exreflltbrach &&
        lhs.exreflrtpat == rhs.exreflrtpat &&
        lhs.exreflltpat == rhs.exreflltpat &&
        lhs.exdtrnorm == rhs.exdtrnorm &&
        lhs.exrtachil == rhs.exrtachil &&
        lhs.exltachil == rhs.exltachil &&
        lhs.exuehoffman == rhs.exuehoffman &&
        lhs.exlebabinski == rhs.exlebabinski &&
        lhs.exchadd == rhs.exchadd &&
        lhs.exrtanes == rhs.exrtanes &&
        lhs.exltanes == rhs.exltanes &&
        lhs.exrthypo == rhs.exrthypo &&
        lhs.exlthypo == rhs.exlthypo &&
        lhs.exrthyper == rhs.exrthyper &&
        lhs.exlthyper == rhs.exlthyper &&
        lhs.exrtanal == rhs.exrtanal &&
        lhs.exltanal == rhs.exltanal &&
        lhs.exrthypoalg == rhs.exrthypoalg &&
        lhs.exlthypoalg == rhs.exlthypoalg &&
        lhs.exrthyperalg == rhs.exrthyperalg &&
        lhs.exlthyperalg == rhs.exlthyperalg &&
        lhs.excran1 == rhs.excran1 &&
        lhs.excran2 == rhs.excran2 &&
        lhs.excran346 == rhs.excran346 &&
        lhs.excran5 == rhs.excran5 &&
        lhs.excran7 == rhs.excran7 &&
        lhs.excran8 == rhs.excran8 &&
        lhs.excran9 == rhs.excran9 &&
        lhs.excran10 == rhs.excran10 &&
        lhs.excranwnl == rhs.excranwnl &&
        lhs.excran11 == rhs.excran11 &&
        lhs.excran12 == rhs.excran12 &&
        lhs.exrhom == rhs.exrhom &&
        lhs.exfingnose == rhs.exfingnose &&
        lhs.exfingfing == rhs.exfingfing &&
        lhs.exheelwk == rhs.exheelwk &&
        lhs.extoewk == rhs.extoewk &&
        lhs.exorth1 == rhs.exorth1 &&
        lhs.exorth2 == rhs.exorth2 &&
        lhs.exorth3 == rhs.exorth3 &&
        lhs.exorth4 == rhs.exorth4 &&
        lhs.exorth5 == rhs.exorth5 &&
        lhs.exorth6 == rhs.exorth6 &&
        lhs.exorth7 == rhs.exorth7 &&
        lhs.exorth8 == rhs.exorth8 &&
        lhs.exorth9 == rhs.exorth9 &&
        lhs.exorth10 == rhs.exorth10 &&
        lhs.exorth11 == rhs.exorth11 &&
        lhs.exorth12 == rhs.exorth12 &&
        lhs.exorth13 == rhs.exorth13 &&
        lhs.exorth14 == rhs.exorth14 &&
        lhs.exorth15 == rhs.exorth15 &&
        lhs.exnotes == rhs.exnotes &&
        lhs.exam_rpt_id == rhs.exam_rpt_id &&
        lhs.exsex == rhs.exsex &&
        lhs.exhanded == rhs.exhanded &&
        lhs.claim_num == rhs.claim_num &&
        lhs.rom_data == rhs.rom_data &&
        lhs.xray_data == rhs.xray_data &&
        lhs.fri_score == rhs.fri_score
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    mutating func saveRec() async {
        self.recToDict()
        let ptc = patientClass()
        _ = await ptc.saveDictionary(dict: self.dataDict)
    }
    
    
    mutating func dictToRec(dict: DictListType)
    {
        dataDict = dict
        readDictValues()
    }
    
    mutating func readDictValues(){
        self.id = getInt(key: "exam_id")
        self.exname = getString(key: "exname")
        self.exname = getString(key: "exname")
        self.exdate = getDate(key: "exdate")
        self.exdoi = getDate(key: "exdoi")
        self.exemp = getString(key: "exemp")
        self.exinsco = getString(key: "exinsco")
        self.exmechons = getString(key: "exmechons")
        self.exprevinj = getString(key: "exprevinj")
        self.exbuild = getString(key: "exbuild")
        self.exgait = getString(key: "exgait")
        self.exmvt = getString(key: "exmvt")
        self.exantalg = getString(key: "exantalg")
        self.exht = getString(key: "exht")
        self.exwt = getString(key: "exwt")
        self.expulse = getString(key: "expulse")
        self.extemp = getString(key: "extemp")
        self.exbpsr = getString(key: "exbpsr")
        self.exbpdr = getString(key: "exbpdr")
        self.exbpsl = getString(key: "exbpsl")
        self.exbpdl = getString(key: "exbpdl")
        self.exbppos = getString(key: "exbppos")
        self.exhdtlt = getString(key: "exhdtlt")
        self.exhghshld = getString(key: "exhghshld")
        self.exhghhip = getString(key: "exhghhip")
        self.exscol = getString(key: "exscol")
        self.exkyph = getString(key: "exkyph")
        self.exlord = getString(key: "exlord")
        self.exrthand = getString(key: "exrthand")
        self.exlthand = getString(key: "exlthand")
        self.exrtknee = getString(key: "exrtknee")
        self.exltknee = getString(key: "exltknee")
        self.exrtfoot = getString(key: "exrtfoot")
        self.exltfoot = getString(key: "exltfoot")
        self.exrtdyno1 = getString(key: "exrtdyno1")
        self.exrtdyno2 = getString(key: "exrtdyno2")
        self.exrtdyno3 = getString(key: "exrtdyno3")
        self.exltdyno1 = getString(key: "exltdyno1")
        self.exltdyno2 = getString(key: "exltdyno2")
        self.exltdyno3 = getString(key: "exltdyno3")
        self.exmeasbicrt = getString(key: "exmeasbicrt")
        self.exmeasbiclt = getString(key: "exmeasbiclt")
        self.exrtforearm = getString(key: "exrtforearm")
        self.exlfforearm = getString(key: "exlfforearm")
        self.exrtthigh = getString(key: "exrtthigh")
        self.exltthigh = getString(key: "exltthigh")
        self.exrtcalf = getString(key: "exrtcalf")
        self.exltcalf = getString(key: "exltcalf")
        self.exreflrtbic = getString(key: "exreflrtbic")
        self.exreflltbic = getString(key: "exreflltbic")
        self.exreflrttric = getString(key: "exreflrttric")
        self.exrefllttric = getString(key: "exrefllttric")
        self.exreflrtbrach = getString(key: "exreflrtbrach")
        self.exreflltbrach = getString(key: "exreflltbrach")
        self.exreflrtpat = getString(key: "exreflrtpat")
        self.exreflltpat = getString(key: "exreflltpat")
        self.exdtrnorm = getString(key: "exdtrnorm")
        self.exrtachil = getString(key: "exrtachil")
        self.exltachil = getString(key: "exltachil")
        self.exuehoffman = getString(key: "exuehoffman")
        self.exlebabinski = getString(key: "exlebabinski")
        self.exchadd = getString(key: "exchadd")
        self.exrtanes = getString(key: "exrtanes")
        self.exltanes = getString(key: "exltanes")
        self.exrthypo = getString(key: "exrthypo")
        self.exlthypo = getString(key: "exlthypo")
        self.exrthyper = getString(key: "exrthyper")
        self.exlthyper = getString(key: "exlthyper")
        self.exrtanal = getString(key: "exrtanal")
        self.exltanal = getString(key: "exltanal")
        self.exrthypoalg = getString(key: "exrthypoalg")
        self.exlthypoalg = getString(key: "exlthypoalg")
        self.exrthyperalg = getString(key: "exrthyperalg")
        self.exlthyperalg = getString(key: "exlthyperalg")
        self.excran1 = getString(key: "excran1")
        self.excran2 = getString(key: "excran2")
        self.excran346 = getString(key: "excran346")
        self.excran5 = getString(key: "excran5")
        self.excran7 = getString(key: "excran7")
        self.excran8 = getString(key: "excran8")
        self.excran9 = getString(key: "excran9")
        self.excran10 = getString(key: "excran10")
        self.excranwnl = getString(key: "excranwnl")
        self.excran11 = getString(key: "excran11")
        self.excran12 = getString(key: "excran12")
        self.exrhom = getString(key: "exrhom")
        self.exfingnose = getString(key: "exfingnose")
        self.exfingfing = getString(key: "exfingfing")
        self.exheelwk = getString(key: "exheelwk")
        self.extoewk = getString(key: "extoewk")
        self.exorth1 = getString(key: "exorth1")
        self.exorth2 = getString(key: "exorth2")
        self.exorth3 = getString(key: "exorth3")
        self.exorth4 = getString(key: "exorth4")
        self.exorth5 = getString(key: "exorth5")
        self.exorth6 = getString(key: "exorth6")
        self.exorth7 = getString(key: "exorth7")
        self.exorth8 = getString(key: "exorth8")
        self.exorth9 = getString(key: "exorth9")
        self.exorth10 = getString(key: "exorth10")
        self.exorth11 = getString(key: "exorth11")
        self.exorth12 = getString(key: "exorth12")
        self.exorth13 = getString(key: "exorth13")
        self.exorth14 = getString(key: "exorth14")
        self.exorth15 = getString(key: "exorth15")
        self.exnotes = getString(key: "exnotes")
        self.exam_rpt_id = getInt(key: "exam_rpt_id")
        self.exsex = getString(key: "exsex")
        self.exhanded = getString(key: "exhanded")
        self.claim_num = getString(key: "claim_num")
      //  self.rom_data = getString(key: "rom_data")
      //  self.xray_data = getString(key: "xray_data")
        self.fri_score = getInt(key: "fri_score")
    }
    
    mutating func recToDict(){
        var localDict:DictListType = self.dataDict
        localDict["exam_id"]?.strVal = String(self.id)
         localDict["nameid"]?.strVal = String(self.nameid)
        localDict["exname"]?.strVal = String(self.exname)
        localDict["exdate"]?.strVal =  getDateOptString(from: self.exdate,
                                            formatStr: "yyyy-mm-dd")

        localDict["exdoi"]?.strVal = getDateOptString(from: self.exdoi,
                                            formatStr: "yyyy-mm-dd")
        
        localDict["exemp"]?.strVal = String(self.exemp)
        localDict["exinsco"]?.strVal = String(self.exinsco)
        localDict["exmechons"]?.strVal = String(self.exmechons)
        localDict["exprevinj"]?.strVal = String(self.exprevinj)
        localDict["exbuild"]?.strVal = String(self.exbuild)
        localDict["exgait"]?.strVal = String(self.exgait)
        localDict["exmvt"]?.strVal = String(self.exmvt)
        localDict["exantalg"]?.strVal = String(self.exantalg)
        localDict["exht"]?.strVal = String(self.exht)
        localDict["exwt"]?.strVal = String(self.exwt)
        localDict["expulse"]?.strVal = String(self.expulse)
        localDict["extemp"]?.strVal = String(self.extemp)
        localDict["exbpsr"]?.strVal = String(self.exbpsr)
        localDict["exbpdr"]?.strVal = String(self.exbpdr)
        localDict["exbpsl"]?.strVal = String(self.exbpsl)
        localDict["exbpdl"]?.strVal = String(self.exbpdl)
        localDict["exbppos"]?.strVal = String(self.exbppos)
        localDict["exhdtlt"]?.strVal = String(self.exhdtlt)
        localDict["exhghshld"]?.strVal = String(self.exhghshld)
        localDict["exhghhip"]?.strVal = String(self.exhghhip)
        localDict["exscol"]?.strVal = String(self.exscol)
        localDict["exkyph"]?.strVal = String(self.exkyph)
        localDict["exlord"]?.strVal = String(self.exlord)
        localDict["exrthand"]?.strVal = String(self.exrthand)
        localDict["exlthand"]?.strVal = String(self.exlthand)
        localDict["exrtknee"]?.strVal = String(self.exrtknee)
        localDict["exltknee"]?.strVal = String(self.exltknee)
        localDict["exrtfoot"]?.strVal = String(self.exrtfoot)
        localDict["exltfoot"]?.strVal = String(self.exltfoot)
        localDict["exrtdyno1"]?.strVal = String(self.exrtdyno1)
        localDict["exrtdyno2"]?.strVal = String(self.exrtdyno2)
        localDict["exrtdyno3"]?.strVal = String(self.exrtdyno3)
        localDict["exltdyno1"]?.strVal = String(self.exltdyno1)
        localDict["exltdyno2"]?.strVal = String(self.exltdyno2)
        localDict["exltdyno3"]?.strVal = String(self.exltdyno3)
        localDict["exmeasbicrt"]?.strVal = String(self.exmeasbicrt)
        localDict["exmeasbiclt"]?.strVal = String(self.exmeasbiclt)
        localDict["exrtforearm"]?.strVal = String(self.exrtforearm)
        localDict["exlfforearm"]?.strVal = String(self.exlfforearm)
        localDict["exrtthigh"]?.strVal = String(self.exrtthigh)
        localDict["exltthigh"]?.strVal = String(self.exltthigh)
        localDict["exrtcalf"]?.strVal = String(self.exrtcalf)
        localDict["exltcalf"]?.strVal = String(self.exltcalf)
        localDict["exreflrtbic"]?.strVal = String(self.exreflrtbic)
        localDict["exreflltbic"]?.strVal = String(self.exreflltbic)
        localDict["exreflrttric"]?.strVal = String(self.exreflrttric)
        localDict["exrefllttric"]?.strVal = String(self.exrefllttric)
        localDict["exreflrtbrach"]?.strVal = String(self.exreflrtbrach)
        localDict["exreflltbrach"]?.strVal = String(self.exreflltbrach)
        localDict["exreflrtpat"]?.strVal = String(self.exreflrtpat)
        localDict["exreflltpat"]?.strVal = String(self.exreflltpat)
        localDict["exdtrnorm"]?.strVal = String(self.exdtrnorm)
        localDict["exrtachil"]?.strVal = String(self.exrtachil)
        localDict["exltachil"]?.strVal = String(self.exltachil)
        localDict["exuehoffman"]?.strVal = String(self.exuehoffman)
        localDict["exlebabinski"]?.strVal = String(self.exlebabinski)
        localDict["exchadd"]?.strVal = String(self.exchadd)
        localDict["exrtanes"]?.strVal = String(self.exrtanes)
        localDict["exltanes"]?.strVal = String(self.exltanes)
        localDict["exrthypo"]?.strVal = String(self.exrthypo)
        localDict["exlthypo"]?.strVal = String(self.exlthypo)
        localDict["exrthyper"]?.strVal = String(self.exrthyper)
        localDict["exlthyper"]?.strVal = String(self.exlthyper)
        localDict["exrtanal"]?.strVal = String(self.exrtanal)
        localDict["exltanal"]?.strVal = String(self.exltanal)
        localDict["exrthypoalg"]?.strVal = String(self.exrthypoalg)
        localDict["exlthypoalg"]?.strVal = String(self.exlthypoalg)
        localDict["exrthyperalg"]?.strVal = String(self.exrthyperalg)
        localDict["exlthyperalg"]?.strVal = String(self.exlthyperalg)
        localDict["excran1"]?.strVal = String(self.excran1)
        localDict["excran2"]?.strVal = String(self.excran2)
        localDict["excran346"]?.strVal = String(self.excran346)
        localDict["excran5"]?.strVal = String(self.excran5)
        localDict["excran7"]?.strVal = String(self.excran7)
        localDict["excran8"]?.strVal = String(self.excran8)
        localDict["excran9"]?.strVal = String(self.excran9)
        localDict["excran10"]?.strVal = String(self.excran10)
        localDict["excranwnl"]?.strVal = String(self.excranwnl)
        localDict["excran11"]?.strVal = String(self.excran11)
        localDict["excran12"]?.strVal = String(self.excran12)
        localDict["exrhom"]?.strVal = String(self.exrhom)
        localDict["exfingnose"]?.strVal = String(self.exfingnose)
        localDict["exfingfing"]?.strVal = String(self.exfingfing)
        localDict["exheelwk"]?.strVal = String(self.exheelwk)
        localDict["extoewk"]?.strVal = String(self.extoewk)
        localDict["exorth1"]?.strVal = String(self.exorth1)
        localDict["exorth2"]?.strVal = String(self.exorth2)
        localDict["exorth3"]?.strVal = String(self.exorth3)
        localDict["exorth4"]?.strVal = String(self.exorth4)
        localDict["exorth5"]?.strVal = String(self.exorth5)
        localDict["exorth6"]?.strVal = String(self.exorth6)
        localDict["exorth7"]?.strVal = String(self.exorth7)
        localDict["exorth8"]?.strVal = String(self.exorth8)
        localDict["exorth9"]?.strVal = String(self.exorth9)
        localDict["exorth10"]?.strVal = String(self.exorth10)
        localDict["exorth11"]?.strVal = String(self.exorth11)
        localDict["exorth12"]?.strVal = String(self.exorth12)
        localDict["exorth13"]?.strVal = String(self.exorth13)
        localDict["exorth14"]?.strVal = String(self.exorth14)
        localDict["exorth15"]?.strVal = String(self.exorth15)
        localDict["exnotes"]?.strVal = String(self.exnotes)
        localDict["exam_rpt_id"]?.strVal = String(self.exam_rpt_id)
        localDict["exsex"]?.strVal = String(self.exsex)
        localDict["exhanded"]?.strVal = String(self.exhanded)
        localDict["claim_num"]?.strVal = String(self.claim_num)
    //    localDict["rom_data"]?.strVal = String(self.rom_data)
   //     localDict["xray_data"]?.strVal = String(self.xray_data)
        localDict["fri_score"]?.strVal = String(self.fri_score)
       self.dataDict = localDict

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


public class examClass: pgClientClass{
    
    init(doAlert: AlertManager? = nil){
        super.init(doAlert: doAlert,
                   tName: "exam_tbl",
                   pkField: "exam_id")
    }
    

    func buildExamList(nameID: Int) async -> [ExamData]{
        var text: String = ""
        var result: [ExamData] = []
        
        
            text = "SELECT * FROM public.exam_tbl where nameid = \(nameID) ORDER BY exdate ASC ;"
        
        await executeQuery(text: text)
        var theExam = ExamData()

        for exam in dictList{
            theExam.dictToRec(dict: exam)
            result.append(theExam)
        }
        
        return result
    }

}

