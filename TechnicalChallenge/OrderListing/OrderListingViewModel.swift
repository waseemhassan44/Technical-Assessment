//
//  HomeViewModel.swift
//  TechnicalChallenge
//
//  Created by waseemhassan on 23/04/2022.
//

protocol OrderListingViewModelProtocol {
    var title: String { get }
    var subTitle: String { get }
    var buttonTitle: String { get }
    func cellViewModel(for index: Int) -> OrderListingTableViewCellViewModel
}

final class OrderListingViewModel: OrderListingViewModelProtocol {
    var title: String {
        LocalizationWrapper.orderListingViewControllerTitleLabel
    }
    
    var subTitle: String {
        LocalizationWrapper.orderListingViewControllerSubTitleLabel
    }
    
    var buttonTitle: String {
        LocalizationWrapper.orderListingViewControllerDownloadButtonTitle
    }
    
    func cellViewModel(for index: Int) -> OrderListingTableViewCellViewModel {
        let orderCurrency = LocalizationWrapper.orderListingViewControllerCurrencyBuySell(sourceCurrency: "BTC", destinationCurrency: "ETH")
        return OrderListingTableViewCellViewModel(orderCurrency: orderCurrency, orderAmount: "+3.0019 BTC", orderDate: "1590660706228".convertToDate(), orderStatus: "Executed")
    }
}
