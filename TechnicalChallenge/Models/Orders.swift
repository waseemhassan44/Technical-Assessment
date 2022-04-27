//
//  Orders.swift
//  TechnicalChallenge
//
//  Created by waseemhassan on 24/04/2022.
//

struct Orders: Decodable {
    private(set) var orderList = [Order]()
    private enum CodingKeys: String, CodingKey {
        case orders
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        var ordersContainer = try container.nestedUnkeyedContainer(forKey: .orders)
        
        while !ordersContainer.isAtEnd {
            if let order = try? ordersContainer.decode(Order.self) {
                orderList.append(order)
            }
        }
    }
}
