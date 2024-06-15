//
//  AdDetailsViewController.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 14/06/2024.
//

import Foundation
import UIKit

class AdDetailsViewController: UIViewController {
    
    private let adDetailsViewModel: AdDetailsViewModel
    private let stackView = UIStackView()
    private var adTitleLabel = UILabel()
    private var adPriceLabel = UILabel()
    private var adIsUrgent = UILabel()
    private var adCategoryLabel = UILabel()
    private var adImageView = UIImageView()
    private var adDescriptionLabel = UILabel()
    private var adSiretLabel = UILabel()
    private var adCreationDateLabel = UILabel()
    
    init(adDetailsViewModel: AdDetailsViewModel) {
        self.adDetailsViewModel = adDetailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = adDetailsViewModel.title
        view.backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        // Setup stack view
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        // Add subviews to stack view
        setupImageView()
        if adDetailsViewModel.isUrgent {
            setupUrgentLabel()
        }
        setupTitleLabel()
        setupPriceLabel()
        setupCategoryLabel()
        setupCreationDateLabel()
        setupDescriptionLabel()
        setupSiretLabel()
        
        // Add constraints for stack view
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
    
    private func setupImageView() {
        adImageView.contentMode = .scaleAspectFill
        adImageView.clipsToBounds = true
        adImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(adImageView)
        
        if let url = URL(string: adDetailsViewModel.image) {
            ImageCache.shared.loadImage(with: url) { image in
                if let image = image {
                    self.adImageView.image = image
                } else {
                    self.adImageView.image = UIImage(systemName: "xmark")
                }
            }
        }
        
        NSLayoutConstraint.activate([
            adImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            adImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            adImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            adImageView.heightAnchor.constraint(equalToConstant: 300),
        ])
        
        
    }
    
    private func setupUrgentLabel() {
        adIsUrgent.text = "Urgent"
        adIsUrgent.font = UIFont.systemFont(ofSize: 12)
        adIsUrgent.textColor = .white
        adIsUrgent.backgroundColor = .purple
        adIsUrgent.layer.cornerRadius = 5
        adIsUrgent.layer.masksToBounds = true
        adIsUrgent.textAlignment = .center
        adIsUrgent.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(adIsUrgent)
        
        // Add constraints for the adIsUrgent
        NSLayoutConstraint.activate([
            adIsUrgent.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 10),
            adIsUrgent.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10),
            adIsUrgent.widthAnchor.constraint(equalToConstant: 50),
            adIsUrgent.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    private func setupTitleLabel() {
        adTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        adTitleLabel.textColor = .darkGray
        adTitleLabel.numberOfLines = 0 // Allow multiline description
        adTitleLabel.text = adDetailsViewModel.title
        adTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(adTitleLabel)
        NSLayoutConstraint.activate([
            adTitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            adTitleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
        ])
    }
    
    private func setupPriceLabel() {
        stackView.addArrangedSubview(adPriceLabel)
        adPriceLabel.font = UIFont.boldSystemFont(ofSize: 13)
        adPriceLabel.textColor = .darkGray
        adPriceLabel.text = adDetailsViewModel.price
        adPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(adPriceLabel)
        NSLayoutConstraint.activate([
            adPriceLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            adPriceLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
        ])
    }
    
    private func setupCategoryLabel() {
        adCategoryLabel.font = UIFont.systemFont(ofSize: 13)
        adCategoryLabel.textColor = .darkGray
        adCategoryLabel.text = adDetailsViewModel.categoryName
        adCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(adCategoryLabel)
        NSLayoutConstraint.activate([
            adCategoryLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            adCategoryLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
        ])
    }
    
    private func setupCreationDateLabel() {
        adCreationDateLabel.font = UIFont.systemFont(ofSize: 13)
        adCreationDateLabel.textColor = .darkGray
        adCreationDateLabel.text = "Created on: \(adDetailsViewModel.creationDate)"
        adCreationDateLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(adCreationDateLabel)
        NSLayoutConstraint.activate([
            adCreationDateLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            adCreationDateLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
        ])
    }
    
    private func setupDescriptionLabel() {
        adDescriptionLabel.font = UIFont.systemFont(ofSize: 13)
        adDescriptionLabel.textColor = .darkGray
        adDescriptionLabel.numberOfLines = 0
        adDescriptionLabel.text = "Description:\n\(adDetailsViewModel.description)"
        adDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(adDescriptionLabel)
        NSLayoutConstraint.activate([
            adDescriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            adDescriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
        ])
    }
    
    private func setupSiretLabel() {
        if let siret = adDetailsViewModel.siret {
            adSiretLabel.font = UIFont.systemFont(ofSize: 13)
            adSiretLabel.textColor = .darkGray
            adSiretLabel.text = "SIRET: \(siret)"
            adSiretLabel.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(adSiretLabel)
            NSLayoutConstraint.activate([
                adSiretLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                adSiretLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            ])
        }
    }
}
