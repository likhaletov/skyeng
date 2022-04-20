//
//  DetailWordScreenAssembly.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import UIKit

struct DetailWordScreenAssembly {
    func getDetailWordScreen(item: Word) -> UIViewController {
        let view = DetailWordMeaningViewController()
        let presenter = DetailWordPresenter()
        view.presenter = presenter
        presenter.view = view
        presenter.word = item
        return view
    }
}
