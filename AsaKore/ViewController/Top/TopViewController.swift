//
//  TopViewController.swift
//  AsaKore
//
//  Created by 刈部拓未 on 2018/06/02.
//  Copyright © 2018年 刈部拓未. All rights reserved.
//

import Foundation
import UIKit

final class TopViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private let viewModel = TopViewControllerViewModel()
    private var questions: [Question] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = viewModel.fetchTripleQuestion()
        tableView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: "QuestionCell")
    }
    
    @IBAction func didTapChangeQuestionButton(_ sender: Any) {
        questions = viewModel.fetchTripleQuestion()
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension TopViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return QuestionCell.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        cell.apply(question: questions[indexPath.row])
        return cell
    }
}
