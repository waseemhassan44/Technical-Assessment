//
//  HomeViewController.swift
//  TechnicalChallenge
//
//  Created by waseemhassan on 23/04/2022.
//

import UIKit

class OrderListingViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    //TODO: Loading view can be separated as custom view as well.
    @IBOutlet weak var orderLoadView: UIView!
    @IBOutlet weak var tableView: UITableView!
    private var viewModel: OrderListingViewModelProtocol
    lazy var loadingView: LoadingViewController = {
        let loadingVC = LoadingViewController()
        loadingVC.modalPresentationStyle = .overCurrentContext
        loadingVC.modalTransitionStyle = .crossDissolve
        return loadingVC
    }()
    
    init(viewModel: OrderListingViewModelProtocol = OrderListingViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "OrderListingViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: OrderListingTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: OrderListingTableViewCell.identifier)
        setupOrderLoadViewData()
        
        viewModel.dataDidUpdate = { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                self.refresh()
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else {return}
                    self.handleError(error: error)
                }
            }
        }
        
        if viewModel.loadingState == .loaded {
            refresh()
        }
    }
    
    private func refresh() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.loadingView.dismiss(animated: true, completion: nil)
            if self.viewModel.numberOfItems > 0 {
                self.orderLoadView.isHidden = true
                self.tableView.isHidden = false
                self.tableView.reloadData()
            } else {
                self.loadingView.dismiss(animated: true) {
                    self.displayAlert(title: LocalizationWrapper.NoDataFoundAlertTitle, message: LocalizationWrapper.NoDataFoundAlertMessage)
                }
            }
        }
    }
    
    private func handleError(error: Error) {
        
        //TODO: This error should be handled under error management component/class.
        self.loadingView.dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.displayAlert(title: LocalizationWrapper.generalErrorTitle, message: LocalizationWrapper.generalErrorMessage)
        }
    }
    
    private func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: LocalizationWrapper.generalErrorAlertButtonText, style: .default) { action in
            alertController.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func setupOrderLoadViewData() {
        titleLabel.text = viewModel.title
        subTitleLabel.text = viewModel.subTitle
        downloadButton.setTitle(viewModel.buttonTitle, for: .normal)
    }
    
    @IBAction func downloadButtonDidTap(_ sender: Any) {
        self.present(loadingView, animated: true, completion: nil)
        viewModel.loadData()
    }

}

extension OrderListingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderListingTableViewCell.identifier, for: indexPath) as? OrderListingTableViewCell else {
            return UITableViewCell()
        }
        
        let orderListingCellViewModel = viewModel.cellViewModel(for: indexPath.row)
        cell.configure(viewModel: orderListingCellViewModel)
        return cell
    }
}
