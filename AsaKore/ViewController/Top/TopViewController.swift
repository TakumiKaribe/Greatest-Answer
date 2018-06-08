//
//  TopViewController.swift
//  AsaKore
//
//  Created by 刈部拓未 on 2018/06/02.
//  Copyright © 2018年 刈部拓未. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds
import TinyConstraints

final class TopViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var bannerView: GADBannerView!
    private let viewModel = TopViewControllerViewModel()
    private var questions: [(initial: Initial, question: Question)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView.delegate = self
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.adUnitID = AdMobSettings.bannerTestId
        bannerView.rootViewController = self
        bannerView.load(GADRequest())

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

extension TopViewController: GADBannerViewDelegate {
    /// Tells the delegate an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("adViewDidReceiveAd")
    }
    
    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
                didFailToReceiveAdWithError error: GADRequestError) {
        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adViewWillPresentScreen")
    }
    
    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("adViewDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adViewWillLeaveApplication")
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
