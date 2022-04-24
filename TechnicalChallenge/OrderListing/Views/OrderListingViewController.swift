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
    }
    
    private func setupOrderLoadViewData() {
        titleLabel.text = viewModel.title
        subTitleLabel.text = viewModel.subTitle
        downloadButton.setTitle(viewModel.buttonTitle, for: .normal)
    }
    
    @IBAction func downloadButtonDidTap(_ sender: Any) {
        
    }

}

extension OrderListingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
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
