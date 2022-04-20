//
//  SearchWordContract.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import Foundation

protocol SearchWordViewInput: AnyObject {
    var presenter: SearchWordViewOutput? { get }
    func reloadSearchResults()
}

protocol SearchWordViewOutput: AnyObject {
    var view: SearchWordViewInput? { get }
    var dataManager: SearchWordDataManager? { get }
    var interactor: SearchWordInteractorInput? { get }
    
    func viewDidLoad()
    func search(_ word: String)
}

protocol SearchWordInteractorInput: AnyObject {
    var presenter: SearchWordInteractorOutput? { get }
    var networkService: NetworkServiceProtocol? { get }
    
    func search(word: String, page: Int, pageSize: Int)
}

protocol SearchWordInteractorOutput: AnyObject {
    func interactor(_ interactor: SearchWordInteractorInput, didFetchWord word: [Word])
    func interactor(_ interactor: SearchWordInteractorInput, didFailWithError error: Error)
}
