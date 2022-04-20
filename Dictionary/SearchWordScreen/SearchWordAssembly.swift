//
//  SearchWordAssembly.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import UIKit

protocol SearchWordAssemblyProtocol {
    var searchWordScreen: UIViewController { get }
}

struct SearchWordAssembly: SearchWordAssemblyProtocol {
    var searchWordScreen: UIViewController {
        let networkService = NetworkService()
        let view = SearchWordViewController()
        let presenter = SearchWordPresenter()
        let interactor = SearchWordInteractor()
        let dataManager = SearchWordDataManager()
        let router = SearchWordRouter()
        presenter.view = view
        presenter.router = router
        view.presenter = presenter
        dataManager.delegate = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.dataManager = dataManager
        interactor.networkService = networkService
        return view
    }
}
