//
//  ContentView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 11/3/24.
//

import SwiftUI
import AppIntents
import PostgresClientKit
import Foundation


func OpenPGArr()->[pd_rec]{
    var  ptArr : [pd_rec] = []
    let connectiion = getNewConnection()
    
    guard (connectiion == nil) else {
        do {
            /*  var configuration = PostgresClientKit.ConnectionConfiguration()
             configuration.host = "127.0.0.1"
             configuration.database = "soap_new"
             configuration.user = "haridass"
             configuration.ssl = false
             configuration.credential =  .scramSHA256(password: "3108")
             
             let connection = try PostgresClientKit.Connection(configuration: configuration)
             defer { connection.close() }*/
            /* ptseqnum: String
             var  lastname: String
             var  firstname: String
             var  gender: String
             var  dob */
            //let connection = theConnection.getConnection()
            let text = "SELECT nameid, lastname, firstname, gender, dob  FROM name_tbl ;"
            let statement = try connectiion!.prepareStatement(text: text)
            defer { statement.close() }
            
            let cursor = try statement.execute() //(parameterValues: [ "San Francisco" ])
            defer { cursor.close() }
            
            for row in cursor {
                let columns = try row.get().columns
                
                let    ptseqnum = try columns[0].string()
                let    lastname = try columns[1].string()
                let    firstname = try columns[2].string()
               // let    gender = try columns[3].string()
               // let    dob = try columns[4].string()
                
                let pdItem = pd_rec(ptseqnum: ptseqnum, lastname: lastname, firstname: firstname , gender: "", dob: "")
                ptArr.append(pdItem)
                print(" \(ptseqnum) for \(lastname) , \(firstname)")
            }
        } catch {
            print(error) // better error handling goes here
        }
        return ptArr

    }
    return ptArr
}

func getRelSoap(NameID: String)->[soap_rec]{
    let connection = getNewConnection()
    var soapArr: [soap_rec] = []
    //let seqNum = Int(NameID)
    if((NameID != "") && (connection != nil)){
        do {
            
            let text = "SELECT soap_date, soapid  FROM soap_tbl WHERE nameid = \(NameID) order by soap_date;"
            
            let statement = try connection!.prepareStatement(text: text)
            
            let cursor = try statement.execute() //(parameterValues: [ "San Francisco" ])
            defer { cursor.close() }
            for row in cursor {
                let columns = try row.get().columns
                let spRec = soap_rec(spDate: try columns[0].string(), spID : try columns[1].string())
                soapArr.append(spRec)
            }
            
        } catch {
            print(error) // better error handling goes here
            
        }
        
    }
    
    //    let statement = try con.prepareStatement(text: text)
    
    return soapArr
}



/*
 struct soap_rec : Identifiable {
 let id = UUID()
 var spDate : String
 }
 */


struct ContentView: View {
   
    
    @EnvironmentObject var theConnection: globalRecords
    @State var ptArr: [pd_rec]  =  OpenPGArr()
        
    @State var spArr: [soap_rec] = []
    
    @State private var selection: pd_rec.ID?
    @State private var sortOrder = [KeyPathComparator(\pd_rec.lastname)]
    @State private var spselection: soap_rec.ID?
    @State private var spsortOrder = [KeyPathComparator(\soap_rec.spDate)]
    var theRecIDS: RecIDS
    
    var body: some View {
                VStack {
                Spacer()
            //  Button("Perform Intent", intent: PatientIntent())
            HStack{
                Table(ptArr, selection: $selection,  sortOrder: $sortOrder) {
                    TableColumn("ptSeq", value: \.ptseqnum )
                    
                    TableColumn("Last Name", value: \.lastname)
                    TableColumn("First Name", value: \.firstname)
                    TableColumn("Gender", value: \.gender)
                    TableColumn("DOB", value: \.dob)
                    
                }
                .frame(width: 500, height: 500)
                .onChange(of: sortOrder) { newOrder in
                    ptArr.sort(using: newOrder)
                }
                .onChange(of: selection) { selected in
                    // called each time on table selection changes
                    
                    let item = ptArr.first(where: { $0.id == selected })
                    spArr = getRelSoap(NameID: item?.ptseqnum ?? "")
                    print("Selected id : ", selected!)
                    print("Selected item : ", item as Any)
                }
                
                Spacer()
                Text("Soap ->")
                Spacer()
                Table(spArr, selection: $spselection,  sortOrder: $spsortOrder) {
                    TableColumn("Date"){ soap in
                        Text(soap.spDate)
                            .gesture(TapGesture(count: 2).onEnded{
                                print("double click")
                            })
                    }
                }
                .onChange(of: spselection) { selected in
                    let spitem = spArr.first(where: { $0.id == selected })
                    let ItemTemp = spitem?.spID
                    theRecIDS.SoapID = spitem?.spID ?? ""
                }
                Spacer()
                
                
            }
            
        }
        .padding()
    }
}

/*#Preview {
    ContentView( soapID: <#Binding<String?>#>)
}*/
