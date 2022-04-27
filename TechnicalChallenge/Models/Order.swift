//
//  Order.swift
//  TechnicalChallenge
//
//  Created by waseemhassan on 24/04/2022.
//

struct Order: Decodable {
    let orderId: String
    let currency: String
    let amount: String
    let orderType: String
    let orderStatus: String
    let createdAt: String
    
    var dictionaryValue: [String: Any] {
        [
            "id": orderId,
            "currency": currency,
            "amount": amount,
            "type": orderType,
            "status": orderStatus,
            "createdAt": createdAt
        ]
    }
    
    var type: OrderType {
        OrderType(rawValue: orderType) ?? .invalid
    }
    
    var status: OrderStatus {
        OrderStatus(rawValue: orderStatus) ?? .invalid
    }
    
    var transactionTitle: String {
        switch type {
        case .deposit:
            return LocalizationWrapper.orderListingViewControllerCurrencyDeposit(text: currency)
        case .withdraw:
            return LocalizationWrapper.orderListingViewControllerCurrencyWithdrawl(text: currency)
        case .buy, .sell:
            // TODO: Requirement is not clear here so passing BTC as source
            return LocalizationWrapper.orderListingViewControllerCurrencyBuySell(sourceCurrency: "BTC", destinationCurrency: currency)
        default:
            return "--"
        }
    }
    
    var transactionDateTime: String {
        createdAt.convertToDate()
    }
    
    var transactionAmount: String {
        var credit = "-"
        if type == .buy || type == .deposit {
            credit = "+"
        }
        
        return "\(credit)\(amount.format()) \(currency)"
    }
    
    
}

enum OrderType: String {
    case deposit
    case withdraw
    case buy
    case sell
    case invalid
}

enum OrderStatus: String {
    case executed
    case canceled
    case approved
    case processing
    case invalid
}
