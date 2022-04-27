//
//  PersistenceStore.swift
//  TechnicalChallenge
//
//  Created by waseemhassan on 23/04/2022.
//

import Foundation
import CoreData

protocol PersistenceStoreProtcol {
    var persistentContainer: NSPersistentContainer { get }
}

final class PersistenceStore: PersistenceStoreProtcol {
    static let shared = PersistenceStore()
    private init() {}
    
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
