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
    
    private let errorLabel: UILabel = {
        let errorLabel = UILabel()
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        return errorLabel
    }()
    
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
                self?.tableView.isHidden = false
                self?.errorLabel.isHidden = true
            } else {
                self?.errorLabel.isHidden = false
                self?.tableView.isHidden = true
                self?.errorLabel.text = self?.viewModel.errorMessage
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
            navigationBar.tintColor = UIColor.white
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
        
        // Configure errorLabel
        errorLabel.textAlignment = .center
        errorLabel.textColor = .red
        errorLabel.numberOfLines = 0
        errorLabel.isHidden = true // Initially hidden
        view.addSubview(errorLabel)
        
        // Add tableView to the view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AdTableViewCell.self, forCellReuseIdentifier: "cell")
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        // Remove separator lines
        tableView.separatorStyle = .none
        
        // Set up constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            errorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
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





