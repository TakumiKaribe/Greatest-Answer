//
//  AllQuestionsViewController.swift
//  Greatest Answer
//
//  Created by Takumi Karibe on 2019/01/21.
//  Copyright © 2019 刈部拓未. All rights reserved.
//

import UIKit

final class AllQuestionsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var questions: [Question] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = Question.fetchAll()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

extension AllQuestionsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = questions[indexPath.row].statement
        return cell
    }
}
