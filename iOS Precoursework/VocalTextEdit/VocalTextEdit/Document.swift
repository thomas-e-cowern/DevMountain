//
//  Document.swift
//  VocalTextEdit
//
//  Created by Thomas Cowern New on 10/6/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    
    var contents: String = ""
    
    enum Error: Swift.Error, LocalizedError {
        case UTF8Encoding
        case UTF8Decoding
        
        var failureReason: String? {
            switch self {
            case .UTF8Encoding: return "File cannot be encoded in UTF-8."
            case .UTF8Decoding: return "File is not a valid UTF-8"
            }
        }
    }
    
    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        let viewController = windowController.contentViewController as! ViewController
        viewController.textView.string = contents

        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
        // Insert code here to write your document to data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override fileWrapper(ofType:), write(to:ofType:), or write(to:ofType:for:originalContentsURL:) instead.
        let windowController = windowControllers[0]
        let viewController = windowController.contentViewController as! ViewController
        let contents = viewController.textView.string
        
        guard let data = contents.data(using: .utf8) else {
            throw Document.Error.UTF8Encoding
        }
        
        return data
        
//        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }

    override func read(from data: Data, ofType typeName: String) throws {
        // Insert code here to read your document from the given data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override read(from:ofType:) instead.
        // If you do, you should also override isEntireFileLoaded to return false if the contents are lazily loaded.
//        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        guard let contents = String(data: data, encoding: .utf8) else {
            throw Document.Error.UTF8Decoding
        }
        
        // WARNING: BIG PROBLEM HERE
//        let windowController = windowControllers[0]
//        let viewController = windowController.contentViewController
//            as! ViewController
//        viewController.textView.string = contents
        self.contents = contents

    }
}

