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
    var router: SearchWordRouterProtocol?
    
}

extension SearchWordPresenter: SearchWordViewOutput {
    func search(_ word: String) {
        view?.startLoading()
        interactor?.search(word: word, page: 0, pageSize: 15)
    }
}

extension SearchWordPresenter: SearchWordInteractorOutput {
    func interactor(_ interactor: SearchWordInteractorInput, didFetchWord word: [Word]) {
        dataManager?.words = word
        view?.reloadSearchResults()
        view?.showResults()
    }
    
    func interactor(_ interactor: SearchWordInteractorInput, didFailWithError error: Error) {
        debugPrint(error.localizedDescription)
    }
}

extension SearchWordPresenter: SearchWordDataManagerDelegate {
    func dataManager(_ dataManager: SearchWordDataManager, updateSearchResults searchText: String) {
        search(searchText)
    }
    
    func dataManager(_ dataManager: SearchWordDataManager, showDetailScreenWith item: Word) {
        guard let view = view else { return }
        router?.showDetailScreen(view, item: item)
    }
    
    func dataManagerNeedsClear(_ dataManager: SearchWordDataManager) {
        view?.reloadSearchResults()
    }
}
