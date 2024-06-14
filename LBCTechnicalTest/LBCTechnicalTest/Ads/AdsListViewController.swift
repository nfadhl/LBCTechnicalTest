//
//  AdsListViewController.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 14/06/2024.
//

import Foundation
import UIKit
import Combine

final class AdsListViewController: UIViewController {
    
    private var viewModel = AdsListViewModel()
    private var subscriptions = Set<AnyCancellable>()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setViews()
        setUpdateBinding()
    }
    
    // Sets up a binding to observe changes in the updateResult
    @MainActor private func setUpdateBinding() {
        viewModel.updateResult.sink { [weak self] value in
            if value {
                self?.tableView.reloadData()
            }
        }.store(in: &subscriptions)
    }
}

// MARK: - Fonctions pour la gestion des vues
extension AdsListViewController {
    
    private func setupNavigationBar() {
        // Set the title
        title = "Ads"
        
        // Customize the navigation bar appearance
        if let navigationBar = navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .orange
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
        }
        
        // Center the title
        navigationItem.titleView = {
            let titleLabel = UILabel()
            titleLabel.text = "Ads"
            titleLabel.textColor = .white
            titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
            return titleLabel
        }()
    }
    
    private func setViews() {
        // Add tableView to the view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AdTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
}

// MARK: - Fonctions de la source de données pour le TableView
extension AdsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in your table
        return viewModel.adsViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a reusable cell
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AdTableViewCell {
            
            let adViewModel: AdViewModel = viewModel.adsViewModel[indexPath.row]
            
            // Configure the cell with your data
            cell.configureCell(adViewModel: adViewModel)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension AdsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let adViewModel: AdViewModel = viewModel.adsViewModel[indexPath.row]
        let detailVC = AdDetailsViewController(adDetailsViewModel: AdDetailsViewModel(adViewModel: adViewModel))
        navigationController?.pushViewController(detailVC, animated: true)
    }
}





