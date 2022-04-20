//
//  SearchWordInteractor.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import Foundation

final class SearchWordInteractor: SearchWordInteractorInput {
    
    weak var presenter: SearchWordInteractorOutput?
    var networkService: NetworkServiceProtocol?
    private let debouncer = Debouncer(timeInterval: 0.75)
    
    func search(word: String, page: Int, pageSize: Int) {
        debouncer.perform { [weak self] in
            self?.networkService?.request(.searchWord(word: word, page: page, pageSize: pageSize)) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    do {
                        let object = try JSONDecoder().decode([Word].self, from: data)
                        self.presenter?.interactor(self, didFetchWord: object)
                    } catch let error {
                        self.presenter?.interactor(self, didFailWithError: error)
                    }
                case .failure(let error):
                    self.presenter?.interactor(self, didFailWithError: error)
                }
            }
        }
    }
}
