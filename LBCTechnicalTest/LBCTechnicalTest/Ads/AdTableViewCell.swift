//
//  AdTableViewCell.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 14/06/2024.
//

import Foundation
import UIKit

final class AdTableViewCell: UITableViewCell {
    
    private let stackView = UIStackView()
    private var adTitleLabel = UILabel()
    private var adPriceLabel = UILabel()
    private var adIsUrgent = UILabel()
    private var adCategoryLabel = UILabel()
    private var adImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStackView() {
        // Create a vertical stack view
        self.backgroundColor = .white
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(adImageView)
        adImageView.contentMode = .scaleAspectFill
        adImageView.clipsToBounds = true
        adImageView.layer.cornerRadius = 10
        
        stackView.addArrangedSubview(adTitleLabel)
        adTitleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        adTitleLabel.textColor = .darkGray
        adTitleLabel.numberOfLines = 0 // Allow multiline description
        
        stackView.addArrangedSubview(adPriceLabel)
        adPriceLabel.font = UIFont.boldSystemFont(ofSize: 12)
        adPriceLabel.textColor = .darkGray

        stackView.addArrangedSubview(adCategoryLabel)
        adCategoryLabel.font = UIFont.systemFont(ofSize: 12)
        adCategoryLabel.textColor = .darkGray
        
        adIsUrgent.text = "Urgent"
        adIsUrgent.font = UIFont.systemFont(ofSize: 12)
        adIsUrgent.textColor = .white
        adIsUrgent.backgroundColor = .purple
        adIsUrgent.layer.cornerRadius = 5
        adIsUrgent.layer.masksToBounds = true
        adIsUrgent.textAlignment = .center
        adIsUrgent.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(adIsUrgent)

        
        // Add constraints for the stack view
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        // Add constraints for the imageView
        NSLayoutConstraint.activate([
            adImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            adImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            adImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // Add constraints for the adIsUrgent
        NSLayoutConstraint.activate([
            adIsUrgent.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 10),
            adIsUrgent.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10),
            adIsUrgent.widthAnchor.constraint(equalToConstant: 50),
            adIsUrgent.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    // Configures the UITableViewCell with data from an AdViewModel.
    func configureCell(adViewModel: AdViewModel) {
        self.adTitleLabel.text = adViewModel.title
        self.adCategoryLabel.text = adViewModel.categoryName
        adIsUrgent.isHidden = !adViewModel.isUrgent
        self.adPriceLabel.text = adViewModel.price
       
        if let url = URL(string: adViewModel.image) {
            ImageCache.shared.loadImage(with: url) { image in
                if let image = image {
                    self.adImageView.image = image
                } else {
                    self.adImageView.image = UIImage(systemName: "xmark")
                }
            }
        }
    }
}

