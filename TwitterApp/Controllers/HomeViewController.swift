//
//  HomeViewController.swift
//  TwitterApp
//
//  Created by Tatiana Carvajal on 5/12/23.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var spinnerView: SpinnerView!
    
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        // viewModel.LoadTweest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}



extension HomeViewController: HomeDelegate {
    func load() {
        spinnerView.showAnimation()
    }
    
    func stopLoad() {
        DispatchQueue.main.async {
            self.spinnerView.stopAnimation()
        }
    }
    
    func onFailure(message: String) {
        DispatchQueue.main.async {
            let alert: UIAlertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let cancel: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func onSuccess() {
        DispatchQueue.main.async {
            self.dismiss(animated: true)
        }
    }
}
