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
    @IBOutlet private weak var initialLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    
    private var viewModel: QuestionsViewModel?
    
    private var time = 60
    private var timer: Timer? = nil
    
    private var onTimerFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = QuestionsViewModel()
        applyLabel(index: 0)
        apply(time: time)
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
    
    @IBAction func didTapResetButton(_ sender: Any) {
        if onTimerFlag {
            onTimerFlag = false
            timer?.invalidate()
            timer = nil
        }
        
        time = 60
        apply(time: time)
    }
    
    @IBAction func didTapGenerateNextQuestionButton(_ sender: Any) {
        guard let num = viewModel?.randNum() else { return }
        applyLabel(index: num)
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
