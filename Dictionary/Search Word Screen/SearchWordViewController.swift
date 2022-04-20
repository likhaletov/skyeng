//
//  SearchWordViewController.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import UIKit
import SnapKit

final class SearchWordViewController: UIViewController {
    
    var presenter: SearchWordViewOutput?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            SearchWordResultCell.self,
            forCellReuseIdentifier: String(describing: SearchWordResultCell.self))
        tableView.dataSource = presenter?.dataManager
        tableView.delegate = presenter?.dataManager
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        setupConstraints()
        setupSearchController()
    }

}

extension SearchWordViewController: SearchWordViewInput {
    func reloadSearchResults() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

private extension SearchWordViewController {
    func setupView() {
        view.backgroundColor = .white
        title = "Dictionary"
    }
    
    func addSubviews() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Enter a word"
        searchController.searchResultsUpdater = presenter?.dataManager
        navigationItem.searchController = searchController
    }
}
