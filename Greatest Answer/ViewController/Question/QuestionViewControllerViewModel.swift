//
//  QuestionViewControllerViewModel.swift
//  ThisIsTheCorrectAnswerUntilMorning
//
//  Created by Takumi Karibe on 2018/04/29.
//  Copyright © 2018年 Takumi Karibe. All rights reserved.
//

import Foundation
import UIKit

protocol QuestionViewControllerViewModelDelegate: class {
    func questionViewControllerViewModel(_ questionViewControllerViewModel: QuestionViewControllerViewModel, didChange time: Double)
    func questionViewControllerViewModelDidFinishTime(_ questionViewControllerViewModel: QuestionViewControllerViewModel)
}

final class QuestionViewControllerViewModel {
    weak var delegate: QuestionViewControllerViewModelDelegate?
    let initial: Initial
    let question: Question
    private var time = 60.0 { didSet { delegate?.questionViewControllerViewModel(self, didChange: time) } }
    private var timer: Timer? = nil
    
    init(with initial: Initial , _ question: Question) {
        self.initial = initial
        self.question = question
    }
    
    func didTapStartButton() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timeCount), userInfo: nil, repeats: true)
    }
    
    func didTapAddTimeButton() {
        time += 60.0
    }
    
    func didTapSubtractTimeButton() {
        time = time - 60.0 <= 0.0 ? 0.0 : time - 60.0
    }
    
    @objc func timeCount() {
        if time < 0 {
            timer?.invalidate()
            delegate?.questionViewControllerViewModelDidFinishTime(self)
        }
        
        time -= 0.01
    }
}
