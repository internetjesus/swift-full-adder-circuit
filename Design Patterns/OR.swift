//
//  OR.swift
//  Design Patterns
//
//  Created by Jens Hoevenaars on 12-05-15.
//

import Cocoa

class OR: Node {
	
	override func calculateInternvalValue() {
		for node in inputs {
			if node.internalValue == 1 {
				internalValue = 1
				break;
			}
		}
	}
}
