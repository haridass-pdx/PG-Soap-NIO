//
//  SoapView.swift
//  PG-Soap-SUI
//
//  Created by Hari Dass Khalsa on 11/14/24.
//

import SwiftUI
//import PostgresClientKit
import Foundation
// import libpq

//#include <libpq-fe.h>
/*
func getColData(columns: [PostgresValue], item: inout Int)->Data{
    var retString = ""
    var retData: Data
    var val: String
    var to_length : size_t
    let theCol = columns[item]
    item+=1
    if(theCol.rawValue != nil)
    {
      //  let pgVal = getPGData(theCol:theCol )
         val = theCol.rawValue!
        
        let cval = val.cString(using: String.Encoding.ascii)
     //   theDataBuffer = PQunescapeBytea(cval , &to_length)
        if( val.hasPrefix("\\x"))  {
            
            
            val = String(
                val[val.index(val.startIndex, offsetBy: "\\x".count)...])
        }
        let theSize = val.count
     //   let cval = val.cString(using: String.Encoding.ascii) //// (rawValue: ascii) ?? ascii)
        retData = val.data(using : String.Encoding.ascii)  ?? Data()   ////////////////, allowLossyConversion: Bool = false)   //Data(bytes:  val, count: theSize)
    }
    else{
        retData = Data(bytes:  retString, count: retString.count)
    }

   return retData
}

func getPGData(theCol: PostgresValue)->PostgresByteA?
{
    var retVal: PostgresByteA?
    do{
        let retVal = try theCol.byteA()
        
    }
    catch{
        print(error)
    }
    
    return retVal
}

func unArchiveData(theData : Data, theKey: String) // ->[]
{
    var savedArray = [String]()
    var i = 0
    
    do {
        //NSError theError
     /*  for dp in theData{
            print("\(i) - \(dp)")
            i+=1
        }*/
        //     theDataBuffer = PQunescapeBytea([theData cStringUsingEncoding: NSASCIIStringEncoding] , &to_length);
        
        let unArchive = try NSKeyedUnarchiver(forReadingFrom: theData)
       /* if let loadedStrings =  unArchive.decodeObject(forKey: theKey) as? [String] {
            savedArray = loadedStrings
        }*/
    } catch {
        print(error)
    }

   // return result;
}
 */
 
/*
 -(NSMutableArray *)unArchieveData:(NSData *)theData
                            forKey:(NSString *)theKey{
     NSKeyedArchiver *unarchiver;
     id                result = nil;
     size_t to_length;
     char *theDataBuffer = nil;
     
     if([theData isKindOfClass: [NSString class]]){
         theDataBuffer = PQunescapeBytea([theData cStringUsingEncoding: NSASCIIStringEncoding] , &to_length);
         theData = [NSData dataWithBytes: theDataBuffer
                                  length: to_length];
         PQfreemem(theDataBuffer);
     }
     
     if([theData length]){
         unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData: theData];
         // Customize unarchiver here
         result = [unarchiver decodeObjectForKey: theKey];
         [unarchiver finishDecoding];
         [unarchiver release];
         
         
         
     }
     return result;
 }
 */

/*
func getColItem(columns: [PostgresValue], item: inout Int)->String{
    
    var retString = ""
    let theCol = columns[item]
    item+=1
    
    if(theCol.rawValue != nil)
    {
        retString = theCol.rawValue!
        
    }
   return retString
}


func getSoapRec(SoapID: String)->soap_tbl{
    
    var soapRec: soap_tbl?
    
    if(SoapID == ""){
        return emptySoap()
    }
    
    let connection = getNewConnection()
    
    do{
        let text = "SELECT *  FROM soap_tbl where soapid = \(SoapID);"
        let statement = try connection!.prepareStatement(text: text)
        defer { statement.close() }
        
        let cursor = try statement.execute() //(parameterValues: [ "San Francisco" ])
        defer { cursor.close() }
        
        for row in cursor {
            let  columns = try row.get().columns
                               
            var i: Int = 0  // try columns[i+=1].string()
           // let nameid =  getColItem(columns: columns, item: &i)
           // let temp =     getColItem(columns: columns, item: &i)/// columns[0].string()
            soapRec = soap_tbl(nameid:  getColItem(columns: columns, item: &i),
                               name: getColItem(columns: columns, item: &i),
                               soap_date: getColItem(columns: columns, item: &i),
                               sev_1: getColItem(columns: columns, item: &i),
                               sev_2: getColItem(columns: columns, item: &i),
                               sev_3: getColItem(columns: columns, item: &i),
                               sev_4: getColItem(columns: columns, item: &i),
                               sev_5: getColItem(columns: columns, item: &i),
                               s1_freq: getColItem(columns: columns, item: &i),
                               s2_freq: getColItem(columns: columns, item: &i),
                               s3_freq: getColItem(columns: columns, item: &i),
                               s4_freq: getColItem(columns: columns, item: &i),
                               s5_freq: getColItem(columns: columns, item: &i),
                               sympt1: getColItem(columns: columns, item: &i),
                               sympt2: getColItem(columns: columns, item: &i),
                               sympt3: getColItem(columns: columns, item: &i),
                               sympt4: getColItem(columns: columns, item: &i),
                               sympt5: getColItem(columns: columns, item: &i),
                               sp_tend_1: getColItem(columns: columns, item: &i),
                               sp_tend_2: getColItem(columns: columns, item: &i),
                               sp_tend_3: getColItem(columns: columns, item: &i),
                               sp1_grade: getColItem(columns: columns, item: &i),
                               sp2_grade: getColItem(columns: columns, item: &i),
                               sp3_grade: getColItem(columns: columns, item: &i),
                               spd_1: getColItem(columns: columns, item: &i),
                               spd_2: getColItem(columns: columns, item: &i),
                               spd_3: getColItem(columns: columns, item: &i),
                               sppos_1: getColItem(columns: columns, item: &i),
                               sppos_2: getColItem(columns: columns, item: &i),
                               sppos_3: getColItem(columns: columns, item: &i),
                               mt1: getColItem(columns: columns, item: &i),
                               mt2: getColItem(columns: columns, item: &i),
                               mt3: getColItem(columns: columns, item: &i),
                               mt1_grade: getColItem(columns: columns, item: &i),
                               mt2_grade: getColItem(columns: columns, item: &i),
                               mt3_grade: getColItem(columns: columns, item: &i),
                               tp_1: getColItem(columns: columns, item: &i),
                               tp_2: getColItem(columns: columns, item: &i),
                               tp1_grade: getColItem(columns: columns, item: &i),
                               tp2_grade: getColItem(columns: columns, item: &i),
                               inc_rom: getColItem(columns: columns, item: &i),
                               dec_rom: getColItem(columns: columns, item: &i),
                               cur_prog: getColItem(columns: columns, item: &i),
                               pt_prog: getColItem(columns: columns, item: &i),
                               tx_stage: getColItem(columns: columns, item: &i),
                               dx1: getColItem(columns: columns, item: &i),
                               dx2: getColItem(columns: columns, item: &i),
                               dx3: getColItem(columns: columns, item: &i),
                               dx4: getColItem(columns: columns, item: &i),
                               dx5: getColItem(columns: columns, item: &i),
                               adj_type: getColItem(columns: columns, item: &i),
                               adj_loc: getColItem(columns: columns, item: &i),
                               adj_mvt: getColItem(columns: columns, item: &i),
                               pt1: getColItem(columns: columns, item: &i),
                               pt2: getColItem(columns: columns, item: &i),
                               pt3: getColItem(columns: columns, item: &i),
                               pt1_loc: getColItem(columns: columns, item: &i),
                               pt2_loc: getColItem(columns: columns, item: &i),
                               pt3_loc: getColItem(columns: columns, item: &i),
                               pt1_goal: getColItem(columns: columns, item: &i),
                               pt2_goal: getColItem(columns: columns, item: &i),
                               pt3_goal: getColItem(columns: columns, item: &i),
                               supports: getColItem(columns: columns, item: &i),
                               exercs: getColItem(columns: columns, item: &i),
                               instructs: getColItem(columns: columns, item: &i),
                               vis_per_wk: getColItem(columns: columns, item: &i),
                               vis_duraddl: getColItem(columns: columns, item: &i),
                               pad1: getColItem(columns: columns, item: &i),
                               pad2: getColItem(columns: columns, item: &i),
                               pad3: getColItem(columns: columns, item: &i),
                               anotes: getColItem(columns: columns, item: &i),
                               hx: getColItem(columns: columns, item: &i),
                               sid: getColItem(columns: columns, item: &i),
                               oid: getColItem(columns: columns, item: &i),
                               aid: getColItem(columns: columns, item: &i),
                               pid: getColItem(columns: columns, item: &i),
                               snotes: getColItem(columns: columns, item: &i),
                               onotes: getColItem(columns: columns, item: &i),
                               pnotes: getColItem(columns: columns, item: &i),
                               soapid: getColItem(columns: columns, item: &i),
                               claim_num: getColItem(columns: columns, item: &i),
                               dr_code: getColItem(columns: columns, item: &i),
                               claim_id: getColItem(columns: columns, item: &i),
                               newSoapRec: getColItem(columns: columns, item: &i),
                               jointData: getColData(columns: columns, item: &i),
                               mslData:  getColData(columns: columns, item: &i),
                               procedures: getColData(columns: columns, item: &i),
                               exercises:  getColData(columns: columns, item: &i),
                               supplements:  getColData(columns: columns, item: &i))
        }
        
    } catch {
        print(error) // better error handling goes here
    }
     
    let jtData = soapRec?.jointData
    if(jtData != nil){
        unArchiveData(theData : jtData!, theKey: keyItem.jointFldKey)
    }
    
    return soapRec!
}

struct SoapView: View {
    var SoapID: String
    var body: some View {
         // Text("Soap View \(SoapID)")
        let soapRec = getSoapRec(SoapID: SoapID)
        
              TabView {
            //Text("Subj")
        
          SubjView(SoapRec: soapRec)
                .tabItem {
                    Label("Subj",
                               systemImage: "star")
                }

          ObjView(SoapRec: soapRec)
                .tabItem {
                    Label("Obj",
                               systemImage: "circle")
                }
            
          AsessView(SoapRec: soapRec)
                .tabItem {
                    Label("Assess",
                               systemImage: "circle")
                }

          PlanView(SoapRec: soapRec)
                .tabItem {
                    Label("Plan",
                               systemImage: "circle")
                }

        }

            }
}
 */

/*#Preview {
    SoapView()
}*/
