//
//  LoadingImageView.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import UIKit

final class LoadingImageView: UIImageView {
    
    let loadingView = LoadingView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addSubviews()
        setupConstraints()
        loadingView.start()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension LoadingImageView {
    func setupView() {
        clipsToBounds = true
        layer.cornerRadius = 8
        backgroundColor = .lightGray
        contentMode = .scaleAspectFill
    }
    
    func addSubviews() {
        addSubview(loadingView)
    }
    
    func setupConstraints() {
        loadingView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
