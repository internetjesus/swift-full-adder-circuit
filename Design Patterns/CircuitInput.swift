//
//  CircuitInput.swift
//  Design Patterns
//
//  Created by Jens Hoevenaars on 13-05-15.
//

import Cocoa

class CircuitInput: LogicComponentProtocol {
    var outputs : [NodeProtocol] = []
    var internalValue = 0 {
        didSet {
            for node in outputs {
                node.process(internalValue)
            }
        }
    }
}
