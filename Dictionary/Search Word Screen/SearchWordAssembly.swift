//
//  SearchWordAssembly.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import UIKit

protocol SearchWordAssemblyProtocol {
    func makeSearchWordScreen() -> UIViewController
}

struct SearchWordAssembly: SearchWordAssemblyProtocol {
    func makeSearchWordScreen() -> UIViewController {
        let networkService = NetworkService()
        let view = SearchWordViewController()
        let presenter = SearchWordPresenter()
        let interactor = SearchWordInteractor()
        let dataManager = SearchWordDataManager()
        presenter.view = view
        view.presenter = presenter
        dataManager.delegate = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.dataManager = dataManager
        interactor.networkService = networkService
        return view
    }
}
