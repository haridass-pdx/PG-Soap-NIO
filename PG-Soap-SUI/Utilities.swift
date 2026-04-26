//
//  Utilities.swift
//  PG_Client_Test
//
//  Created by Hari Dass Khalsa on 11/11/24.
//

import SwiftUI
import AppIntents
//import PostgresClientKit
import Foundation


public func removeTimeStamp(fromDate: Date) -> Date {
    guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: fromDate)) else {
        fatalError("Failed to strip time from Date object")
    }
    return date
}

func pgDateFormatter()->DateFormatter{
    
    let formatter1 = DateFormatter()
    formatter1.dateFormat = "MM-dd-yyyy"
    
    formatter1.dateStyle = .short
    formatter1.timeStyle = .none
    
    return formatter1
}

/*
func convertPGDate(dateStr: String)->Date?{
    // var theDate = Date()
    
    let dateParts = dateStr.split(separator: "-")
    let newDateStr = dateParts[1]+"-"+dateParts[2]+"-"+dateParts[0]
    let formatter = pgDateFormatter()
    let theDate = formatter.date(from: newDateStr)
    
    return theDate
}
*/
