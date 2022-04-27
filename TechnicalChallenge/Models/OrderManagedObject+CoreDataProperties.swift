//
//  OrderManagedObject+CoreDataProperties.swift
//  TechnicalChallenge
//
//  Created by waseemhassan on 26/04/2022.
//
//

import Foundation
import CoreData


extension OrderManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OrderManagedObject> {
        return NSFetchRequest<OrderManagedObject>(entityName: "OrderManagedObject")
    }

    @NSManaged public var id: String?
    @NSManaged public var currency: String?
    @NSManaged public var type: String?
    @NSManaged public var status: String?
    @NSManaged public var amount: String?
    @NSManaged public var createdAt: String?

}

extension OrderManagedObject : Identifiable {

}
