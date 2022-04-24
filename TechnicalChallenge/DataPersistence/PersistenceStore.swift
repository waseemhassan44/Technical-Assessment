//
//  PersistenceStore.swift
//  TechnicalChallenge
//
//  Created by waseemhassan on 23/04/2022.
//

import Foundation
import CoreData

protocol PersistenceStoreProtocol {
    
}

struct PersistenceStore: PersistenceStoreProtocol {
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "TechnicalChallenge")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
