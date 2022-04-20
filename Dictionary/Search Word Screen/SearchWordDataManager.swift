//
//  SearchWordDataManager.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import UIKit

protocol SearchWordDataManagerDelegate: AnyObject {
    func dataManager(_ dataManager: SearchWordDataManager, updateSearchResults searchText: String)
}

final class SearchWordDataManager: NSObject {
    weak var delegate: SearchWordDataManagerDelegate?
    var words: [Word] = []
}

extension SearchWordDataManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: SearchWordResultCell.self),
                for: indexPath) as? SearchWordResultCell
        else { return .init() }
        cell.configure(with: words[indexPath.row])
        return cell
    }
}

extension SearchWordDataManager: UITableViewDelegate {
    
}

extension SearchWordDataManager: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else { return }
        delegate?.dataManager(self, updateSearchResults: searchText)
    }
}
