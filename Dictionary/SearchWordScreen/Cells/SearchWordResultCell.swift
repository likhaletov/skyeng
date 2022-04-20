//
//  SearchWordResultCell.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import UIKit

final class SearchWordResultCell: UITableViewCell {
    func configure(with model: Word) {
        self.textLabel?.text = model.text
    }
}
