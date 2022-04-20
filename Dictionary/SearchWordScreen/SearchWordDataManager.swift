//
//  SearchWordDataManager.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import UIKit

protocol SearchWordDataManagerDelegate: AnyObject {
    func dataManager(_ dataManager: SearchWordDataManager, updateSearchResults searchText: String)
    func dataManager(_ dataManager: SearchWordDataManager, showDetailScreenWith item: Word)
    func dataManagerNeedsClear(_ dataManager: SearchWordDataManager)
}

final class SearchWordDataManager: NSObject {
    weak var delegate: SearchWordDataManagerDelegate?
    var words: [Word] = []
    
    private func clear() {
        words.removeAll()
        delegate?.dataManagerNeedsClear(self)
    }
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = words[indexPath.row]
        delegate?.dataManager(self, showDetailScreenWith: item)
    }
}

extension SearchWordDataManager: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else { return }
        delegate?.dataManager(self, updateSearchResults: searchText)
    }
}

extension SearchWordDataManager: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        clear()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText.isEmpty else { return }
        clear()
    }
}
