//
//  HomeTableViewCell.swift
//  TechnicalChallenge
//
//  Created by waseemhassan on 23/04/2022.
//

import UIKit

class OrderListingTableViewCell: UITableViewCell {
    
    static let identifier = "OrderListingTableViewCell"
    @IBOutlet weak var orderCurrencyLabel: UILabel!
    @IBOutlet weak var orderAmountLabel: UILabel!
    @IBOutlet weak var orderDateLabel: UILabel!
    @IBOutlet weak var orderStatusLabel: UILabel!

    func configure(viewModel: OrderListingTableViewCellViewModel) {
        orderCurrencyLabel.text = viewModel.orderCurrency
        orderAmountLabel.text = viewModel.orderAmount
        orderDateLabel.text = viewModel.orderDate
        orderStatusLabel.text = viewModel.orderStatus
    }
    
    override func prepareForReuse() {
        orderCurrencyLabel.text = nil
        orderAmountLabel.text = nil
        orderDateLabel.text = nil
        orderStatusLabel.text = nil
    }
    
}
