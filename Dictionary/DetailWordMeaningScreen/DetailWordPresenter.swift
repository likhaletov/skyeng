//
//  DetailWordPresenter.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import Foundation

final class DetailWordPresenter: DetailWordViewOutput {
    
    weak var view: DetailWordViewInput?
    var word: Word?
    
    func viewWillAppear() {
        setContent()
    }
    
    private func setContent() {
        guard let text = word?.text, let meaning = word?.meanings.first else { return }
        let description = text + " / " + meaning.transcription
        view?.setTranslationLabel(meaning.translation.text)
        view?.setTextLabel(description)
        view?.setImage(meaning.imageUrl)
    }
    
}
