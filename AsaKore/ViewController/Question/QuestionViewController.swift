//
//  QuestionViewController.swift
//  ThisIsTheCorrectAnswerUntilMorning
//
//  Created by 刈部拓未 on 2017/11/04.
//  Copyright © 2017年 刈部拓未. All rights reserved.
//

import UIKit

/// QuestionViewController
class QuestionViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var initialLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    private let viewModel = QuestionViewControllerViewModel()
    
    private var time = 60
    private var timer: Timer? = nil
    
    private var onTimerFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyLabel(index: 0)
        apply(time: time)
    }
    
    @IBAction func didTapAddTimeButton(_ sender: Any) {
        time += 60
    }
    
    @IBAction func didTapSubtractTimeButton(_ sender: Any) {
        time = time - 60 < 0 ? 0 : time - 60
    }
    
    @IBAction func didTapStartButton(_ sender: Any) {
        if !onTimerFlag {
            onTimerFlag = true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCount), userInfo: nil, repeats: true)
        } else {
            onTimerFlag = false
            timer?.invalidate()
            timer = nil
        }
    }
    
    @IBAction func didTapEndButton(_ sender: Any) {
    }
}

/// MARK: - Private Extension
private extension QuestionsViewController {
    func applyLabel(index: Int) {
        guard let questions = viewModel?.questions else { return }
        
        let question = questions[index]
        initialLabel.text = "「\(question.initial)」で始まる"
        questionLabel.text = "\(question.question)は？"
    }
    
    func apply(time: Int) {
        timeLabel.text = "残り\(time)秒"
    }
    
    @objc func timeCount() {
        if time <= 1 {
            timer?.invalidate()
        }
        
        time -= 1
        apply(time: time)
    }
}
