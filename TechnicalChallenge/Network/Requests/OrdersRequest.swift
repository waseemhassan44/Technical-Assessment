//
//  OrdersRequest.swift
//  TechnicalChallenge
//
//  Created by waseemhassan on 24/04/2022.
//

import Foundation

struct OrdersRequest: DataRequest {

    var url: String {
        //TODO: This can be separated into different files for base URL and endpoints
        return "https://assessments.stage.copper.co/ios/orders"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    func decode(_ data: Data) throws -> [Order] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let response = try decoder.decode(Orders.self, from: data)
        return response.orderList
    }
}
