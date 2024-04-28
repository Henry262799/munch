//
//  UserCollectionViewCell.swift
//  munch2
//
//  Created by Angelina Chen on 4/27/24.
//

import Foundation
import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    private var post: Post?
    private let profileImage = UIImageView()
    private let nameLabel = UILabel()
    private let date = UILabel()
    private let foodImage = UIImageView()
//    private let heartButton = UIButton()
//    private let heartCount = UILabel()
//    private var liked = false
    private let saved = false
    private let savedButton = UIButton()
    
    static let reuse = "UserCollectionViewCellReuse"
    
    // MARK: - init
    
    // NOTE: Compare init with a `UITableViewCell`
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        layer.cornerRadius = 16
        
        setupProfileImage()
        setupName()
        setupDate()
        setupFoodImage()
        // setupSaved()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func configure(with post: Post!) {
//        self.post = post
//        
//        // date.text = post.time.convertToAgo()
//        nameLabel.text = post.name
//        // heartCount.text = String(post.likes.count)
//        // heartButton.setTitle(post.heart, for: .normal)
//        // heartCount.text = post.heartCount
//        
////        if post.likes.contains("asc337") {
////            liked = true
////            let liked_heart = UIImage(named: "liked_heart3")
////            heartButton.setImage(liked_heart, for: .normal)
////        }
//    }
    
    // FOR THE PROFILE (APP DEV LOGO) IMAGE.
    private func setupProfileImage() {
        profileImage.contentMode = .scaleAspectFit
        profileImage.image = UIImage(named: "anonymous_image")
        
        // let radius = 128 / 2
        
        // profileImage.layer.cornerRadius = CGFloat(radius)
        profileImage.layer.masksToBounds = true
        
        contentView.addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            profileImage.widthAnchor.constraint(equalToConstant: 32),
            profileImage.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    // FOR THE NAME LABEL (ANONYMOUS)
    private func setupName() {
        nameLabel.text = "Anonymous"
        nameLabel.textColor = UIColor.black
        nameLabel.font = .systemFont(ofSize:14, weight: .medium)
        
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 0.5)
        ])
    }
    
    // FOR THE DATE
    private func setupDate() {
        // date.text = "77"
        date.textColor = UIColor.black
        date.font = .systemFont(ofSize: 14, weight: .medium)
        
        contentView.addSubview(date)
        date.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            date.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8),
            date.topAnchor.constraint(equalTo: nameLabel.bottomAnchor)
        ])
        
    }
    
    // FOR FOOD IMAGE
    private func setupFoodImage() {
        
        foodImage.contentMode = .scaleAspectFit
        foodImage.image = UIImage(named: "food_image")
        
        profileImage.layer.masksToBounds = true

        NSLayoutConstraint.activate([
            foodImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            foodImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            foodImage.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
            // text.bottomAnchor.constraint(equalTo: text.topAnchor, constant: 48)
        ])
    }
    
    
    
}
