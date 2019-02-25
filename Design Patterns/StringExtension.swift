//
//  StringExtension.swift
//  Design Patterns
//
//  Created by Jens Hoevenaars on 12-05-15.
//

import Foundation

extension String {
	
	subscript (i: Int) -> Character {
		return self[advance(self.startIndex, i)]
	}
	
	subscript (i: Int) -> String {
		return String(self[i] as Character)
	}
	
	subscript (r: Range<Int>) -> String {
		return substringWithRange(Range(start: advance(startIndex, r.startIndex), end: advance(startIndex, r.endIndex)))
	}
	
	func condenseWhitespace() -> String {
		let components = self.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).filter({!Swift.isEmpty($0)})
		return "".join(components)
	}
}
