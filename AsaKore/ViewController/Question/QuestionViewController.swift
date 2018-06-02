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
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var initialLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var startButton: UIButton!
    
    private let viewModel = QuestionViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }
    
    @IBAction func didTapStartButton(_ sender: Any) {
        viewModel.didTapStartButton()
        startButton.isEnabled = false
    }
    
    @IBAction func didTapAddTimeButton(_ sender: Any) {
        viewModel.didTapAddTimeButton()
    }
    
    @IBAction func didTapSubtractTimeButton(_ sender: Any) {
        viewModel.didTapSubtractTimeButton()
    }
    
    @IBAction func didTapEndButton(_ sender: Any) {
        // pop
    }
    
    func apply(question: Question) {
        initialLabel.text = "「\(question.initial)」で始まる"
        questionLabel.text = "\(question.question)は？"
    }
}

extension QuestionViewController: QuestionViewControllerViewModelDelegate {
    func questionViewControllerViewModel(_ questionViewControllerViewModel: QuestionViewControllerViewModel, didChange time: Double) {
        timeLabel.text = "残り\(time)秒"
    }
}
