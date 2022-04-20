//
//  DetailWordMeaningViewController.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import UIKit

final class DetailWordMeaningViewController: UIViewController {
    
    private enum Constants {
        static let bigPadding: CGFloat = 32
        static let defaultPadding: CGFloat = 16
    }
    
    var presenter: DetailWordViewOutput?
    
    private lazy var scrollView = UIScrollView()
    private let container = UIView()
    
    private lazy var translationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 26)
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var meaningImageView = LoadingImageView(frame: .zero)

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        setupConstraints()
    }
    
}

extension DetailWordMeaningViewController: DetailWordViewInput {
    func setTextLabel(_ text: String) {
        textLabel.text = text
    }

    func setTranslationLabel(_ text: String) {
        translationLabel.text = text
    }
    
    func setImage(_ url: String) {
        meaningImageView.loadImage(with: url)
    }
}

private extension DetailWordMeaningViewController {
    func setupView() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(close))
    }
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(container)
        container.addSubview(translationLabel)
        container.addSubview(textLabel)
        container.addSubview(meaningImageView)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        translationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(Constants.defaultPadding)
        }
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(translationLabel.snp.bottom).offset(Constants.defaultPadding)
            make.leading.trailing.equalToSuperview().inset(Constants.bigPadding)
        }
        meaningImageView.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(Constants.bigPadding)
            make.width.equalTo(container.snp.width).multipliedBy(0.8)
            make.height.equalTo(container.snp.width)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc func close() {
        self.dismiss(animated: true)
    }
}
