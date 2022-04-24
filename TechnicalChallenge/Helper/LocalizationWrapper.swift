//
//  LocalizationWrapper.swift
//  TechnicalChallenge
//
//  Created by waseemhassan on 24/04/2022.
//

import Foundation

enum LocalizationWrapper {
    static let orderListingViewControllerTitleLabel = NSLocalizedString("OrderListingViewController.TitleLabel.Text", comment: "Localized string for title label on OrderListingScreen")
    static let orderListingViewControllerSubTitleLabel = NSLocalizedString("OrderListingViewController.SubTitleLabel.Text", comment: "Localized string for subtitle label on OrderListingScreen")
    static let orderListingViewControllerDownloadButtonTitle = NSLocalizedString("OrderListingViewController.DownloadButton.Title", comment: "Localized string for download button on OrderListingScreen")
    static func orderListingViewControllerCurrencyDeposit(text: String) -> String {
        return String(format: NSLocalizedString("OrderListingViewController.OrderCell.CurrencyDepost.Text", comment: "Localized string for currency deposit in order cell"), arguments: [text])
    }
    
    static func orderListingViewControllerCurrencyWithdrawl(text: String) -> String {
        return String(format: NSLocalizedString("OrderListingViewController.OrderCell.CurrencyWithdrawl.Text", comment: "Localized string for currency withdrawl in order cell"), arguments: [text])
    }
    
    static func orderListingViewControllerCurrencyBuySell(sourceCurrency: String, destinationCurrency: String) -> String {
        return String(format: NSLocalizedString("OrderListingViewController.OrderCell.CurrencyBuySell.Text", comment: "Localized string for currency buy/sell in order cell"), arguments: [sourceCurrency, destinationCurrency])
    }
    
}
