//
//      .swift
//  PG_Client_Test
//
//  Created by Hari Dass Khalsa on 11/9/24.
//

import Foundation
import PostgresClientKit

func getNewConnection()->Connection?{
    var theConnection: Connection?
    do{
        var configuration = PostgresClientKit.ConnectionConfiguration()
        configuration.host = "127.0.0.1"
        configuration.database = "soap_new"
        configuration.user = "haridass"
        configuration.ssl = false
        configuration.credential =  .scramSHA256(password: "3108")
        
        theConnection = try PostgresClientKit.Connection(configuration: configuration)
        // defer { theConnection!.close() }
    } catch {
        print(error) // better error handling goes here
    }
    return theConnection
    
}

class globalRecords: ObservableObject{
    
    @Published var theConnection: Connection?
    @Published var cPool: ConnectionPool?
   
    
    init(){
        do {
            var configuration = PostgresClientKit.ConnectionConfiguration()
            configuration.host = "127.0.0.1"
            configuration.database = "soap_new"
            configuration.user = "haridass"
            configuration.ssl = false
            configuration.credential =  .scramSHA256(password: "3108")
            
            theConnection = try PostgresClientKit.Connection(configuration: configuration)
            // defer { theConnection!.close() }
            
         var cPoolConfig = ConnectionPoolConfiguration()
            
            cPool = ConnectionPool(connectionPoolConfiguration: cPoolConfig, connectionConfiguration: configuration)
        } catch {
            print(error) // better error handling goes here
        }
    }
    
    func getConnection()->Connection
    {
      return theConnection!
    }
    
    func getcPool()->ConnectionPool{
        return cPool!
    }
}
