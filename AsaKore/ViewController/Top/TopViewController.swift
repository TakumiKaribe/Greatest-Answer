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
    private var questions: [(initial: Initial, question: Question)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = viewModel.fetchTripleQuestion()
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.borderWidth = 1
        QuestionCell.registered(in: tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        tableView.deselectRow(at: indexPath, animated: true)
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = QuestionCell.dequeue(from: tableView, at: indexPath)
        cell.apply(questionSet: questions[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionViewController = QuestionViewController.instantiate()
        questionViewController.apply(with: questions[indexPath.row].initial, questions[indexPath.row].question)
        navigationController?.pushViewController(questionViewController, animated: true)
    }
}
