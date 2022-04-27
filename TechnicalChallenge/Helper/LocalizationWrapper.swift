//
//  LocalizationWrapper.swift
//  TechnicalChallenge
//
//  Created by waseemhassan on 24/04/2022.
//

import Foundation

enum LocalizationWrapper {
    static let orderListingViewControllerTitleLabel = NSLocalizedString("OrderListingViewController.TitleLabel.Text", comment: "")
    static let orderListingViewControllerSubTitleLabel = NSLocalizedString("OrderListingViewController.SubTitleLabel.Text", comment: "")
    static let orderListingViewControllerDownloadButtonTitle = NSLocalizedString("OrderListingViewController.DownloadButton.Title", comment: "")
    static func orderListingViewControllerCurrencyDeposit(text: String) -> String {
        return String(format: NSLocalizedString("OrderListingViewController.OrderCell.CurrencyDepost.Text", comment: ""), arguments: [text])
    }
    
    static func orderListingViewControllerCurrencyWithdrawl(text: String) -> String {
        return String(format: NSLocalizedString("OrderListingViewController.OrderCell.CurrencyWithdrawl.Text", comment: ""), arguments: [text])
    }
    
    static func orderListingViewControllerCurrencyBuySell(sourceCurrency: String, destinationCurrency: String) -> String {
        return String(format: NSLocalizedString("OrderListingViewController.OrderCell.CurrencyBuySell.Text", comment: ""), arguments: [sourceCurrency, destinationCurrency])
    }
    
    static let generalErrorTitle = NSLocalizedString("ErrorAlert.GeneralError.Title", comment: "")
    static let generalErrorMessage = NSLocalizedString("ErrorAlert.GeneralError.Message", comment: "")
    static let generalErrorAlertButtonText = NSLocalizedString("ErrorAlert.GeneralError.Button.Text", comment: "")
    
    static let NoDataFoundAlertTitle = NSLocalizedString("ErrorAlert.DataNotFound.Title", comment: "")
    static let NoDataFoundAlertMessage = NSLocalizedString("ErrorAlert.DataNotFound.Message", comment: "")
    
}
