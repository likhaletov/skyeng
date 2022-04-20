//
//  Models.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import Foundation

struct Word: Codable {
    let id: Int
    let text: String
    let meanings: [Meaning]
}

struct Meaning: Codable {
    let id: Int
    let translation: MeaningTranslation
    let transcription: String
    let imageUrl: String
}

struct MeaningTranslation: Codable {
    let text: String
}
