//
//  DetailWordContract.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import Foundation

protocol DetailWordViewInput: AnyObject {
    var presenter: DetailWordViewOutput? { get }
    
    func setTranslationLabel(_ text: String)
    func setTextLabel(_ text: String)
    func setImage(_ url: String)
}

protocol DetailWordViewOutput: AnyObject {
    var view: DetailWordViewInput? { get }
    var word: Word? { get }
    
    func viewWillAppear()
}
