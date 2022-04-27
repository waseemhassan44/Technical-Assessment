//
//  OrderPersistenceStorage.swift
//  TechnicalChallenge
//
//  Created by waseemhassan on 26/04/2022.
//

import CoreData

protocol OrderPersistenceStoreProtocol {
    func saveOrders(orders: [Order])
    func fetchOrders() -> [Order]
}

struct OrderPersistenceStore: OrderPersistenceStoreProtocol {
    private let persistenceStore: PersistenceStoreProtcol
    init(persistenceStore: PersistenceStoreProtcol = PersistenceStore.shared) {
        self.persistenceStore = persistenceStore
    }
    
    func saveOrders(orders: [Order]) {
        let backgroundContext = persistenceStore.persistentContainer.newBackgroundContext()
        backgroundContext.name = "saveContext"
        backgroundContext.transactionAuthor = "saveOrders"
        
        backgroundContext.perform {
            let batchInsertRequest = self.createBatchInsertRequest(with: orders)
            if let fetchResult = try? backgroundContext.execute(batchInsertRequest),
               let batchInsertResult = fetchResult as? NSBatchInsertResult,
               let success = batchInsertResult.result as? Bool, success {
                return
            }
        }
    }
    
    func fetchOrders() -> [Order] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:
                                                                    "OrderManagedObject")
        let backgroundContext = persistenceStore.persistentContainer.newBackgroundContext()
        backgroundContext.name = "fetchContext"
        backgroundContext.transactionAuthor = "fetchOrders"
        var orders = [Order]()
        do {
            let records = try backgroundContext.fetch(fetchRequest)
            if let records = records as? [OrderManagedObject] {
                records.forEach { orderObject in
                    if let orderId = orderObject.id,
                       let currency = orderObject.currency,
                       let amount = orderObject.amount,
                       let orderType = orderObject.type,
                       let orderStatus = orderObject.status,
                       let createdAt = orderObject.createdAt {
                        
                        let order = Order(orderId: orderId, currency: currency, amount: amount, orderType: orderType, orderStatus: orderStatus, createdAt: createdAt)
                        orders.append(order)
                    }
                }
            }
            
        } catch {
            print("Failed to fetch Orders")
        }

        return orders
    }
    
    private func createBatchInsertRequest(with orders: [Order]) -> NSBatchInsertRequest {
        var index = 0
        let total = orders.count

        // Provide one dictionary at a time when the closure is called.
        let batchInsertRequest = NSBatchInsertRequest(entity: OrderManagedObject.entity(), dictionaryHandler: { dictionary in
            guard index < total else { return true }
            dictionary.addEntries(from: orders[index].dictionaryValue)
            index += 1
            return false
        })
        return batchInsertRequest
    }
}
