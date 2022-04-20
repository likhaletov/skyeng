//
//  Debouncer.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import Foundation

class Debouncer {
    var cancelAction: (() -> Void)?
    var timeInterval: TimeInterval
    var workItem: DispatchWorkItem?
    
    init(timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
    }
    
    func perform(action: @escaping (() -> Void)) {
        cancel()
        let item = DispatchWorkItem(block: action)
        self.workItem = item
        DispatchQueue.main.asyncAfter(deadline: .now() + self.timeInterval, execute: item)
    }
    
    func cancel() {
        self.workItem?.cancel()
        self.cancelAction?()
    }
}
