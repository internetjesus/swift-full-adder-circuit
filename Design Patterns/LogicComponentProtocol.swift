//
//  LogicComponentProtocol.swift
//  Design Patterns
//
//  Created by Jens Hoevenaars on 12-05-15.
//

import Cocoa

protocol LogicComponentProtocol {
    var internalValue : Int {get set}
	var outputs : [NodeProtocol] {get set}
}
