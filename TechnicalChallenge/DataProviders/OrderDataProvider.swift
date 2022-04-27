//
//  OrderDataProvider.swift
//  TechnicalChallenge
//
//  Created by waseemhassan on 23/04/2022.
//

import Foundation

protocol OrderDataProviderProtocol {
    func fetchOrders(completion: @escaping (Result<[Order], Error>) -> Void)
    func fetchSavedOrders() -> [Order]
}

struct OrderDataProvider: OrderDataProviderProtocol {
    private let network: NetworkProtocol
    private let orderPersistenceStore: OrderPersistenceStoreProtocol
    
    init(network: NetworkProtocol = Network(),
         orderPersistenceStore: OrderPersistenceStoreProtocol = OrderPersistenceStore()) {
        self.network = network
        self.orderPersistenceStore = orderPersistenceStore
    }
    
    func fetchOrders(completion: @escaping (Result<[Order], Error>) -> Void) {
        
        let request = OrdersRequest()
        network.request(request) { result in
            switch result {
            case .success(let orders):
                orderPersistenceStore.saveOrders(orders: orders)
                completion(.success(orders))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchSavedOrders() -> [Order] {
        return orderPersistenceStore.fetchOrders()
    }
}
