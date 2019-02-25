//
//  ViewController.swift
//  Design Patterns
//
//  Created by Jens Hoevenaars on 12-05-15.
//

import Cocoa

class ViewController: NSViewController {

	@IBOutlet weak var textfieldFilename: NSTextField!
	@IBOutlet var textviewConsole: NSTextView!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		var or1 = OR()
		var or2 = OR()
		var or3 = OR()
		
		or1.internalValue = 1
		or2.internalValue = 0
		

		//           OR2
		//            |
		//            |
		// -- OR1 -> OR3
		
        /*
		or1.outputs.append(or3)
		or3.inputs.append(or1)
		
		or2.outputs.append(or3)
		or3.inputs.append(or2)
		
		or1.processNextNodes()
		println("Eerste keer: \(or3.internalValue)")
		or2.processNextNodes()
		println("Tweede keer: \(or3.internalValue)")
        */
        
        var A = CircuitInput()
        var B = CircuitInput()
        
        var OR1 = OR()
        
        A.outputs.append(OR1)
        B.outputs.append(OR1)
        
        OR1.inputs.append(A)
        OR1.inputs.append(B)
        
        
        A.internalValue = 0
        B.internalValue = 0
        

		//let path = NSBundle.mainBundle().pathForResource("circuit1", ofType: "txt")
		//self.readFile(path!)
	}

	override var representedObject: AnyObject? {
		didSet {
		// Update the view, if already loaded.
		}
	}

	@IBAction func openFile(sender: AnyObject) {
		var openPanel = NSOpenPanel()
		openPanel.title = "Choose a circuit file to open"
		openPanel.showsResizeIndicator = true
		openPanel.showsHiddenFiles = false
		openPanel.canChooseDirectories = false
		openPanel.canCreateDirectories = false
		openPanel.allowsMultipleSelection = false
		openPanel.allowedFileTypes = ["txt"]
		
		openPanel.beginWithCompletionHandler { (result) -> Void in
			if result == NSModalResponseOK {
				// Get file path
				var fileUrl = openPanel.URLs[0] as! NSURL
				var filePath = fileUrl.path!.stringByResolvingSymlinksInPath
				var fileName = filePath.lastPathComponent
				
				// Set filename in label
				self.textfieldFilename.stringValue = fileName
				
				self.readFile(filePath)
			}
		}
	}
	
	func readFile(filePath : String) {
		
		// Create StreamReader for file
		if let streamReader = StreamReader(path: filePath) {
			
			// Loop file line by line
			for line in streamReader {
				var lineString = line.condenseWhitespace()

				// Only parse non-comment lines
				if lineString != "" && lineString[0] != "#" {
					var splitString = lineString.componentsSeparatedByString(":")
					self.textviewConsole.string! += splitString[0]
					self.textviewConsole.string! += " - "
					self.textviewConsole.string! += splitString[1] + "\n"
					self.textviewConsole.string! += "--------------------\n"
				}
			}
			
			// Close stream
			streamReader.close()
		}
	}
}

