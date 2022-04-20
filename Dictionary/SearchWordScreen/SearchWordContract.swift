//
//  SearchWordContract.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import UIKit

protocol SearchWordViewInput: AnyObject {
    var presenter: SearchWordViewOutput? { get }
    var navigationController: UINavigationController? { get }
    func reloadSearchResults()
    func showResults()
    func startLoading()
}

protocol SearchWordViewOutput: AnyObject {
    var view: SearchWordViewInput? { get }
    var dataManager: SearchWordDataManager? { get }
    var interactor: SearchWordInteractorInput? { get }
    var router: SearchWordRouterProtocol? { get }
    
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

protocol SearchWordRouterProtocol: AnyObject {
    func showDetailScreen(_ view: SearchWordViewInput, item: Word)
}
