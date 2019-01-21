//
//  QuestionViewController.swift
//  ThisIsTheCorrectAnswerUntilMorning
//
//  Created by Takumi Karibe on 2017/11/04.
//  Copyright © 2017年 Takumi Karibe. All rights reserved.
//

import UIKit

/// QuestionViewController
class QuestionViewController: UIViewController {
    @IBOutlet private weak var timeUpView: UIView!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var initialLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var startButton: UIButton!
    
    private var viewModel: QuestionViewControllerViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        timeUpView.isHidden = true
        timeUpView.alpha = 0
        guard let viewModel = viewModel else { return }
        initialLabel.text = "「\(viewModel.initial.value)」で始まる"
        questionLabel.text = "\(viewModel.question.statement)は？"
    }
    
    @IBAction func didTapStartButton(_ sender: Any) {
        viewModel?.didTapStartButton()
        startButton.isEnabled = false
    }
    
    @IBAction func didTapAddTimeButton(_ sender: Any) {
        viewModel?.didTapAddTimeButton()
    }
    
    @IBAction func didTapSubtractTimeButton(_ sender: Any) {
        viewModel?.didTapSubtractTimeButton()
    }
    
    @IBAction func didTapEndButton(_ sender: Any) {
        // pop
    }
    
    func apply(with initial: Initial, _ question: Question) {
        viewModel = QuestionViewControllerViewModel(with: initial, question)
    }
}

extension QuestionViewController: QuestionViewControllerViewModelDelegate {
    func questionViewControllerViewModel(_ questionViewControllerViewModel: QuestionViewControllerViewModel, didChange time: Double) {
        timeLabel.text = String(format: "%.2f", time)
    }
    
    func questionViewControllerViewModelDidFinishTime(_ questionViewControllerViewModel: QuestionViewControllerViewModel) {
        timeUpView.isHidden = false
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.timeUpView.alpha = 1
        })
    }
}
