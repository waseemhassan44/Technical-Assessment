//
//  HomeViewModel.swift
//  TechnicalChallenge
//
//  Created by waseemhassan on 23/04/2022.
//

protocol OrderListingViewModelProtocol {
    var dataDidUpdate: ((Result<Void, Error>) -> Void)? { get set }
    func loadData()
    var title: String { get }
    var subTitle: String { get }
    var buttonTitle: String { get }
    var numberOfItems: Int { get }
    func cellViewModel(for index: Int) -> OrderListingTableViewCellViewModel
    var loadingState: LoadingState { get }
}

enum LoadingState {
    case loading
    case loaded
    case error
}

final class OrderListingViewModel: OrderListingViewModelProtocol {
    let dataProvider: OrderDataProviderProtocol
    var dataDidUpdate: ((Result<Void, Error>) -> Void)?
    private var state: LoadingState = .loading
    
    private var orders: [Order] = [] {
        didSet {
            dataDidUpdate?(.success(()))
        }
    }
    
    var loadingState: LoadingState {
        state
    }
    
    init(dataProvider: OrderDataProviderProtocol = OrderDataProvider()) {
        self.dataProvider = dataProvider
        loadSavedData()
    }
    
    var title: String {
        LocalizationWrapper.orderListingViewControllerTitleLabel
    }
    
    var subTitle: String {
        LocalizationWrapper.orderListingViewControllerSubTitleLabel
    }
    
    var buttonTitle: String {
        LocalizationWrapper.orderListingViewControllerDownloadButtonTitle
    }
    
    var numberOfItems: Int {
        orders.count
    }
    
    func cellViewModel(for index: Int) -> OrderListingTableViewCellViewModel {
        let order = orders[index]
        return OrderListingTableViewCellViewModel(orderCurrency: order.transactionTitle, orderAmount: order.transactionAmount, orderDate: order.transactionDateTime, orderStatus: order.status.rawValue.capitalized)
    }
    
    func loadData() {
        dataProvider.fetchOrders { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let orders):
                self.state = .loaded
                self.orders = orders
            case .failure(let error):
                self.state = .error
                self.dataDidUpdate?(.failure(error))
            }
        }
    }
    
    private func loadSavedData() {
        let savedOrders = dataProvider.fetchSavedOrders()
        if !savedOrders.isEmpty {
            state = .loaded
            orders = savedOrders
        }
    }
}
