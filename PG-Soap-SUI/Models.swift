//
//  Models.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 11/11/24.
//

import Foundation
import SwiftUI
import PostgresClientKit

struct pd_rec : Identifiable {
    let id = UUID()
    var  ptseqnum: String
    var  lastname: String
    var  firstname: String
    var  gender: String
    var  dob: String
}

struct patient_data : Identifiable {
    var id: Int  // ptseqnum
    var  lastname: String
    var  firstname: String
    var  street: String
    var  city: String
    var  state: String
    var  zip: String
    var  gender: String
    var  homephone: String
    var claim_num: String
    var  inj_date: String
    var  employer: String
    var  insco: String
    var  dob: String
    var  age: Int
    var doprint: Bool
    var workphone: String
    var hipaa: Bool
    var dont_bill: String
    var firstvisit: String
    var referredby: String
    var  pt_ss_num: String
    var  def_dr: String
    var commentdate: String
    var  def_trans: String
    var pttype: String
    var pt_note: String
    var email: String
    var  informed_consent: Bool
    var alpha_2: Bool
    var alpha_date: String
    var recent_visit: String
}

/*
 let    ptseqnum = try columns[0].int()
 let    lastname = try columns[1].string()
 let    firstname = try columns[2].string()
 let    street = try columns[3].string()
 let    city = try columns[4].string()
 let    state = try columns[5].string()
 let    zip = try columns[6].string()
 let    gender = try columns[7].string()
 let    homephone = try columns[8].string()
 let    claim_num = try columns[9].string()
 let    inj_date = try columns[10].string()
 let    employer = try columns[11].string()
 let    insco = try columns[12].string()
 let    dob = try columns[13].string()
 let    age = try columns[14].string()
 let    doprint = try columns[15].string()
 let    workphone = try columns[16].string()
 let    hipaa = try columns[17].string()
 let    dont_bill = try columns[18].string()
 let    firstvisit = try columns[19].string()
 let    referredby = try columns[20].string()
 let    pt_ss_num = try columns[21].string()
 let    def_dr = try columns[22].string()
 let    commentdate = try columns[23].string()
 let    def_trans = try columns[24].string()
 let    pttype = try columns[25].string()
 let    pt_note = try columns[26].string()
 let    email = try columns[27].string()
 let    informed_consent = try columns[28].string()
 let    alpha_2 = try columns[29].string()
 let    alpha_date = try columns[30].string()
 let    recent_visit = try columns[31].string()*/
 
struct soap_rec : Identifiable {
    let id = UUID()
    var spDate : String
}


struct  soap_tbl  : Identifiable {
    var   id: ObjectIdentifier // soapID
    var    nameid :  Int
    var    name :  String
    var    soap_date:  Date
    var    sev_1 :  String
    var    sev_2 :  String
    var    sev_3 :  String
    var    sev_4 :  String
    var    sev_5 :  String
    var    s1_freq :  String
    var    s2_freq :  String
    var    s3_freq :  String
    var    s4_freq :  String
    var    s5_freq :  String
    var    sympt1 :  String
    var    sympt2 :  String
    var    sympt3 :  String
    var    sympt4 :  String
    var    sympt5 :  String
    var    sp_tend_1 :  String
    var    sp_tend_2 :  String
    var    sp_tend_3 :  String
    var    sp1_grade :  String
    var    sp2_grade :  String
    var    sp3_grade :  String
    var    spd_1 :  String
    var    spd_2 :  String
    var    spd_3 :  String
    var    sppos_1 :  String
    var    sppos_2 :  String
    var    sppos_3 :  String
    var    mt1 :  String
    var    mt2 :  String
    var    mt3 :  String
    var    mt1_grade :  String
    var    mt2_grade :  String
    var    mt3_grade :  String
    var    tp_1 :  String
    var    tp_2 :  String
    var    tp1_grade :  String
    var    tp2_grade :  String
    var    inc_rom :  String
    var    dec_rom :  String
    var    cur_prog :  String
    var    pt_prog :  String
    var    tx_stage :  String
    var    dx1 :  String
    var    dx2 :  String
    var    dx3 :  String
    var    dx4 :  String
    var    dx5 :  String
    var    adj_type :  String
    var    adj_loc :  String
    var    adj_mvt :  String
    var    pt1 :  String
    var    pt2 :  String
    var    pt3 :  String
    var    pt1_loc :  String
    var    pt2_loc :  String
    var    pt3_loc :  String
    var    pt1_goal :  String
    var    pt2_goal :  String
    var    pt3_goal :  String
    var    supports :  String
    var    exercs :  String
    var    instructs :  String
    var    vis_per_wk :  String
    var    vis_duraddl :  String
    var    pad1 :  String
    var    pad2 :  String
    var    pad3 :  String
    var    anotes :  String
    var    hx :  String
    var    sid :  Int
    var    oid :  Int
    var    aid :  Int
    var    pid :  Int
    var    snotes :  String
    var    onotes :  String
    var    pnotes :  String
    var    claim_num :  String
    var    dr_code :  String
    var    claim_id :  Int
    var    newSoapRec: Bool
    var    jointData: Data
    var    mslData: Data
    var    procedures: Data
    var    exercises: Data
    var    supplements: Data
}
