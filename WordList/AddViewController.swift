//
//  AddViewController.swift
//  WordList
//
//  Created by Paul McCartney on 2016/06/09.
//  Copyright © 2016年 shiba. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.arrayForKey("WORD") != nil {
            wordArray = saveData.arrayForKey("WORD")!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveWord() {
        let wordDictionary = ["english":englishTextField.text!,"japanese":japaneseTextField.text!]
        
        wordArray.append(wordDictionary)
        saveData.setObject(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(title: "保存完了", message: "単語の登録が完了しました", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japaneseTextField.text = ""
        
    }

}
