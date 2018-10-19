//
//  ViewController.swift
//  RandomQuizApp
//
//  Created by Shun-Ching, Chou on 2018/10/19.
//  Copyright © 2018 Shun-Ching, Chou. All rights reserved.
//

import UIKit

struct Country {
    var flag : String!
    var name : String!
}

class ViewController: UIViewController {
    var question = [Country]()
    var questionNum = 10
    var currentQuestion: Country?
    
    @IBOutlet weak var questionNumLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    @IBAction func showAnswerButton(_ sender: UIButton) {
        answerLabel.isHidden = false
        answerLabel.text = currentQuestion?.name
    }
    
    @IBAction func nextQuestionButton(_ sender: UIButton) {
        getQuestion()
    }
    
    //隨機選取一個題目
    func getQuestion(){
        
        //更新題號，若出到第10題則重來一次
        if questionNum == 10 {
            questionNum = 1
            //還原題庫
            setQuestion()
        } else {
            questionNum += 1
        }
        questionNumLabel.text = "\(questionNum)"
        
        //取得題目總數，並從中隨機選一個數字
        let count = question.count - 1
        var num = 0
        if count != 0 {
            num = Int.random(in: 1...count)
        }
        
        //根據隨機選取的數字從問題集中找出題目
        currentQuestion = question[num]
        flagImage.image = UIImage(named: currentQuestion!.flag)
        
        //將出過的題目從題庫中刪除
        question.remove(at: num)
        
        
        //隱藏解答
        answerLabel.isHidden = true
    }
    
    func setQuestion() {
        //將問答集存進array
        question = [Country(flag: "200px-Flag_of_Cambodia.svg.png", name: "柬埔寨"),
                    Country(flag: "200px-Flag_of_Japan.svg.png", name: "日本"),
                    Country(flag: "200px-Flag_of_Singapore.svg.png", name: "新加坡"),
                    Country(flag: "200px-Flag_of_South_Korea.svg.png", name: "韓國"),
                    Country(flag: "200px-Flag_of_Thailand.svg.png", name: "泰國"),
                    Country(flag: "200px-Flag_of_China.svg.png", name: "中國"),
                    Country(flag: "200px-Flag_of_Taiwan.svg.png", name: "臺灣"),
                    Country(flag: "200px-Flag_of_Vietnam.svg.png", name: "越南"),
                    Country(flag: "224px-Flag_of_the_United_States.svg.png", name: "美國"),
                    Country(flag: "230px-Flag_of_the_United_Kingdom.svg.png", name: "英國"),
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //建立題庫
        setQuestion()
        
        //將題目顯示在畫面上
        getQuestion()
        
    }


}

