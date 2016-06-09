//
//  QuestionViewController.swift
//  WordList
//
//  Created by Paul McCartney on 2016/06/09.
//  Copyright © 2016年 shiba. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    var isAnswerd: Bool = false
    var wordArray: [AnyObject] = []
    var shuffledWordArray: [AnyObject] = []
    var nowNumber: Int = 0
    
    let saveData = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        wordArray = saveData.arrayForKey("WORD")!
        self.shuffle()
        questionLabel.text = shuffledWordArray[nowNumber]["english"] as? String
    }
    
    func shuffle() {
        while wordArray.count > 0 {
            let index = Int(rand()) % wordArray.count
            shuffledWordArray.append(wordArray[index])
            wordArray.removeAtIndex(index)
        }
    }
    
    @IBAction func nextButtonPushed() {
        if isAnswerd {
            nowNumber += 1
            answerLabel.text = ""
            
            if nowNumber < shuffledWordArray.count {
                questionLabel.text = shuffledWordArray[nowNumber]["english"] as? String
                isAnswerd = false
                nextButton.setTitle("答えを表示", forState: UIControlState.Normal)
            } else {
                self.performSegueWithIdentifier("toFinishView", sender: nil)
            }
        } else {
            answerLabel.text = shuffledWordArray[nowNumber]["japanese"] as? String
            isAnswerd = true
            nextButton.setTitle("次へ", forState: UIControlState.Normal)
        }
    }
}
