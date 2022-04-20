//
//  SearchWordRouter.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import UIKit

final class SearchWordRouter: SearchWordRouterProtocol {
    func showDetailScreen(_ view: SearchWordViewInput, item: Word) {
        let detailVc = DetailWordScreenAssembly().getDetailWordScreen(item: item)
        let detailScreen = UINavigationController(rootViewController: detailVc)
        view.navigationController?.present(detailScreen, animated: true)
    }
}
