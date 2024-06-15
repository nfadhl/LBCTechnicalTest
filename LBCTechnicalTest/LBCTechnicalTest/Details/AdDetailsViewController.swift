//
//  AdDetailsViewController.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 14/06/2024.
//

import UIKit

class AdDetailsViewController: UIViewController {
    
    private let adDetailsViewModel: AdDetailsViewModel
    private let stackView = UIStackView()
    private let scrollView = UIScrollView()
    
    private let adTitleLabel = UILabel()
    private let adPriceLabel = UILabel()
    private let adIsUrgentLabel = UILabel()
    private let adCategoryLabel = UILabel()
    private let adImageView = UIImageView()
    private let adDescriptionLabel = UILabel()
    private let adSiretLabel = UILabel()
    private let adCreationDateLabel = UILabel()
    
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
        setupScrollView()
        setupStackView()
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
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
        ])
    }
    
    private func setupImageView() {
        adImageView.contentMode = .scaleAspectFill
        adImageView.clipsToBounds = true
        adImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(adImageView)
        
        if let url = URL(string: adDetailsViewModel.image) {
            ImageCache.shared.loadImage(with: url) { image in
                self.adImageView.image = image ?? UIImage(systemName: "xmark")
            }
        }
        
        // Set height constraint directly on the image view
        NSLayoutConstraint.activate([
            adImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupUrgentLabel() {
        adIsUrgentLabel.text = "Urgent"
        adIsUrgentLabel.font = UIFont.systemFont(ofSize: 12)
        adIsUrgentLabel.textColor = .white
        adIsUrgentLabel.backgroundColor = .purple
        adIsUrgentLabel.layer.cornerRadius = 5
        adIsUrgentLabel.layer.masksToBounds = true
        adIsUrgentLabel.textAlignment = .center
        adIsUrgentLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(adIsUrgentLabel)
        
        // Add constraints for the adIsUrgentLabel
        NSLayoutConstraint.activate([
            adIsUrgentLabel.topAnchor.constraint(equalTo: adImageView.topAnchor, constant: 10),
            adIsUrgentLabel.trailingAnchor.constraint(equalTo: adImageView.trailingAnchor, constant: -10),
            adIsUrgentLabel.widthAnchor.constraint(equalToConstant: 50),
            adIsUrgentLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    private func setupTitleLabel() {
        adTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        adTitleLabel.textColor = .darkGray
        adTitleLabel.numberOfLines = 0
        adTitleLabel.text = adDetailsViewModel.title
        adTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(adTitleLabel)
       
    }
    
    private func setupPriceLabel() {
        adPriceLabel.font = UIFont.boldSystemFont(ofSize: 13)
        adPriceLabel.textColor = .darkGray
        adPriceLabel.text = adDetailsViewModel.price
        adPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(adPriceLabel)
        
        
    }
    
    private func setupCategoryLabel() {
        adCategoryLabel.font = UIFont.systemFont(ofSize: 13)
        adCategoryLabel.textColor = .darkGray
        adCategoryLabel.text = adDetailsViewModel.categoryName
        adCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(adCategoryLabel)
        
        
    }
    
    private func setupCreationDateLabel() {
        adCreationDateLabel.font = UIFont.systemFont(ofSize: 13)
        adCreationDateLabel.textColor = .darkGray
        adCreationDateLabel.text = "Created on: \(adDetailsViewModel.creationDate)"
        adCreationDateLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(adCreationDateLabel)
        
      
    }
    
    private func setupDescriptionLabel() {
        adDescriptionLabel.font = UIFont.systemFont(ofSize: 13)
        adDescriptionLabel.textColor = .darkGray
        adDescriptionLabel.numberOfLines = 0
        adDescriptionLabel.text = "Description:\n\(adDetailsViewModel.description)"
        adDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(adDescriptionLabel)
        
      
    }
    
    private func setupSiretLabel() {
        if let siret = adDetailsViewModel.siret {
            adSiretLabel.font = UIFont.systemFont(ofSize: 13)
            adSiretLabel.textColor = .darkGray
            adSiretLabel.text = "SIRET: \(siret)"
            adSiretLabel.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(adSiretLabel)
            
           
        }
    }
}
