//
//  SearchWordPresenter.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import Foundation

final class SearchWordPresenter {
    
    weak var view: SearchWordViewInput?
    var dataManager: SearchWordDataManager?
    var interactor: SearchWordInteractorInput?
    
}

extension SearchWordPresenter: SearchWordViewOutput {
    func viewDidLoad() {

    }
    
    func search(_ word: String) {
        interactor?.search(word: word, page: 0, pageSize: 15)
    }
}

extension SearchWordPresenter: SearchWordInteractorOutput {
    func interactor(_ interactor: SearchWordInteractorInput, didFetchWord word: [Word]) {
        dataManager?.words = word
        view?.reloadSearchResults()
    }
    
    func interactor(_ interactor: SearchWordInteractorInput, didFailWithError error: Error) {
        
    }
}

extension SearchWordPresenter: SearchWordDataManagerDelegate {
    func dataManager(_ dataManager: SearchWordDataManager, updateSearchResults searchText: String) {
        search(searchText)
    }
}
