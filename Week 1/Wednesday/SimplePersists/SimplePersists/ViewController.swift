//
//  ViewController.swift
//  SimplePersists
//
//  Created by Thomas Cowern New on 11/28/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

struct Loves: Codable {
    var text: String
    var count: Int
}

class ViewController: UIViewController {

    var loves = Loves(text: "Love Yah", count: 2)
    
    @IBOutlet weak var loveField: UITextField!
    @IBOutlet weak var loveCountField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let l = loadLoves() {
            self.loves = l
            loveField.text = self.loves.text
            loveCountField.text = String(self.loves.count)
        }
    }
    
    @IBAction func endEditing(_ sender: Any) {
        if let loveText = loveField.text,
            let loveCountText = loveCountField.text,
            let loveCount = Int(loveCountText) {
            loves.text = loveText
            loves.count = loveCount
            saveLoves(loves: loves)
        }
    }
    
    func saveLoves(loves: Loves) {
        let je = JSONEncoder()
        do {
            let data = try je.encode(loves)
            try data.write(to: fileURL())
        }  catch let e {
            print("Error saving loves: \(e)")
        }
    }
    
    func loadLoves() -> Loves? {
        do {
            let data = try Data(contentsOf: fileURL())
            let je = JSONDecoder()
            let loves = try je.decode(Loves.self, from: data)
            return loves
        } catch let e {
            print("Error loading loves: \(e)")
        }
        return nil
    }
    
    func fileURL() -> URL {
        let paths =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let fileName = "loves.JSON"
        let fullURL = documentsDirectory.appendingPathComponent(fileName)
        return fullURL
    }

}

