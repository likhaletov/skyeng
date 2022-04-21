//
//  UIImageView+Extension.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import UIKit

extension LoadingImageView {
    func loadImage(with url: String) {
        guard let url = URL.makeUrl(url) else { return }
        DispatchQueue.global(qos: .userInteractive).async {
            guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = image
                self.loadingView.stop()
            }
        }
    }
}
