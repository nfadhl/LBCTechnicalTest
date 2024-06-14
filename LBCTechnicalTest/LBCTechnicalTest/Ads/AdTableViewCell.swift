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
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        stackView.addArrangedSubview(adImageView)
        
        stackView.addArrangedSubview(adPriceLabel)
        adPriceLabel.font = UIFont.boldSystemFont(ofSize: CGFloat(16))
        adPriceLabel.textColor = .black
        
        stackView.addArrangedSubview(adTitleLabel)
        adTitleLabel.font = UIFont.systemFont(ofSize: CGFloat(16))
        adTitleLabel.textColor = .lightGray
        adTitleLabel.numberOfLines = 0 // Allow multiline description

        stackView.addArrangedSubview(adCategoryLabel)
        adCategoryLabel.font = UIFont.systemFont(ofSize: CGFloat(16))
        adCategoryLabel.textColor = .lightGray
        
        adIsUrgent.text = "Urgent"
        adIsUrgent.textAlignment = .center
        adIsUrgent.backgroundColor = .purple
        adIsUrgent.font = UIFont.systemFont(ofSize: CGFloat(12))
        adIsUrgent.textColor = .white
        adIsUrgent.layer.cornerRadius = 5
        adIsUrgent.layer.masksToBounds = true // Clip to bounds to apply the corner radius
        adIsUrgent.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(adIsUrgent)

        
        // Add constraints for the stack view
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        // Add constraints for the imageView
        NSLayoutConstraint.activate([
            adImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            adImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            adImageView.heightAnchor.constraint(equalToConstant: 150)
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

