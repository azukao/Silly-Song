//
//  ViewController.swift
//  Silly Song
//
//  Created by Azuka Omesiete on 6/15/16.
//  Copyright © 2016 Azuka Omesiete. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var nameFIeld: UITextField!
    
    
    @IBOutlet weak var lyricsView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameFIeld.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func reset(sender: AnyObject) {
        nameFIeld.text = " "
        lyricsView.text = " "
        
    }
    
    @IBAction func DisplayLyrics(sender: AnyObject) {
        let bananaFanaTemplate = [
            "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
            "Banana Fana Fo F<SHORT_NAME>",
            "Me My Mo M<SHORT_NAME>",
            "<FULL_NAME>"].joinWithSeparator("\n")
        if nameFIeld.text != " " {
            if let newName = nameFIeld.text {
                ShortNameFromName(newName)
             lyricsView.text =   LyricsForName(bananaFanaTemplate, fullName: newName)
            }
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

func ShortNameFromName(fullName: String) -> String {
    
    let shortName = fullName.lowercaseString
    let vowels = NSCharacterSet(charactersInString: "aeiou")
    
    if let firstVowel = fullName.rangeOfCharacterFromSet(vowels, options: .CaseInsensitiveSearch) {
        return shortName.substringFromIndex(firstVowel.startIndex)
    }
    
    return shortName
    
}


func LyricsForName(lyricsTemplate: String, fullName: String) -> String {
    var returnedString: String = ""
    let shortname = ShortNameFromName(fullName)
    
    returnedString = lyricsTemplate
        .stringByReplacingOccurrencesOfString("<FULL_NAME>", withString: fullName)
        .stringByReplacingOccurrencesOfString("<SHORT_NAME>", withString: shortname)
    
    
    return returnedString
}
