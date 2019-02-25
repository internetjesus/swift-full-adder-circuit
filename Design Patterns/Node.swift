//
//  Node.swift
//  Design Patterns
//
//  Created by Jens Hoevenaars on 12-05-15.
//

import Cocoa

protocol NodeProtocol {
	var identifier : String? {get set}
	var inputs : [LogicComponentProtocol] {get set}
	
	var flag : Int {get set}
	
	func process(value : Int)
	func calculateInternvalValue()
	func processNextNodes()
}

class Node: NodeProtocol, LogicComponentProtocol {
	var identifier : String?
	var outputs : [NodeProtocol] = []
	var inputs : [LogicComponentProtocol] = []
    var internalValue : Int = 0
    var flag : Int = 0
	
	func calculateInternvalValue() {}
	
	func process(value : Int) {
		if mayCallNextNode() {
			calculateInternvalValue()
			processNextNodes()
		} else {
			return
		}
	}
	
	func mayCallNextNode() -> Bool {
		
		if ++flag == inputs.count {
			return true
		}
		
		return false
	}
	
	func processNextNodes() {
		for node in outputs {
			node.process(internalValue)
		}
		
		if outputs.count == 0 {
			println("Finished with value: \(internalValue)")
		}
	}
}
