//
//  ViewController.swift
//  Silly Song
//
//  Created by Juan Carlos Acosta on 5/9/17.
//  Copyright © 2017 Juan Carlos Acosta. All rights reserved.
//

import UIKit

let bananaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fanana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>"
    ].joined(separator: "\n")

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    @IBAction func displayLyrics(_ sender: Any) {
        lyricsView.text = lyricsForName(lyricsTemplate: bananaTemplate, name: nameField.text!)
    }


}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

func shortNameForName(name: String) -> String{
    let lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    
    if let firstVowelSet = lowercaseName.rangeOfCharacter(from: vowelSet){
        return lowercaseName.substring(from: firstVowelSet.lowerBound)
    }
    
    return lowercaseName
}

func lyricsForName(lyricsTemplate: String, name: String) -> String {
    let shortName = shortNameForName(name: name)
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: name)
        .replacingOccurrences(of: "<SHORT_NAME>",with: shortName)
    return lyrics
}

