//
//  CollectionViewCell.swift
//  munch_3
//
//  Created by Angelina Chen on 4/28/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    private var post: Post?
    private let profileImage = UIImageView()
    private let profileName = UILabel()
    private let date = UILabel()
    private let foodImage = UIImageView()
    private let heartButton = UIButton()
    private let savedButton = UIButton()

    static let reuse = "CollectionViewCellReuse"
    
    // MARK: ini
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        setupProfileImage()
        setupNameLabel()
        setupFoodImage()
        setupHeartButton()
        setupSaveButton()
        setupDate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - configure

    func configure(with post: Post!) {
        self.post = post
        profileName.text = post.name
    }
    
    private func setupProfileImage() {
        profileImage.image = UIImage(named: "anonymous_image")
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius =  16
        
        contentView.addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 32),
            profileImage.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    private func setupNameLabel() {
        profileName.text = "Anonymous"
        profileName.textColor = UIColor.black
        profileName.font = .systemFont(ofSize:14, weight: .medium)
        
        contentView.addSubview(profileName)
        profileName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8),
            profileName.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 0.5)
        ])
    }
    
    private func setupDate() {
        date.text = "7 hours ago"
        date.textColor = UIColor.lightGray
        date.font = .systemFont(ofSize: 12, weight: .medium)
        
        contentView.addSubview(date)
        date.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            date.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8),
            date.topAnchor.constraint(equalTo: profileName.bottomAnchor)
        ])
        
    }
    
    private func setupFoodImage() {
        foodImage.layer.masksToBounds = true
        foodImage.layer.cornerRadius = 16
        foodImage.image = UIImage(named: "food_image")
        // foodImage.contentMode = .scaleAspectFit

        
        
        contentView.addSubview(foodImage)
        foodImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            foodImage.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10),
            foodImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            foodImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            foodImage.widthAnchor.constraint(equalToConstant: 300),
            foodImage.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupHeartButton() {
        let unliked_heart = UIImage(named: "unliked_heart")
        heartButton.backgroundColor = UIColor.white
        heartButton.setImage(unliked_heart, for: .normal)
        heartButton.addTarget(self, action: #selector(heartUp), for: .touchUpInside)
        
        contentView.addSubview(heartButton)
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            heartButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            heartButton.widthAnchor.constraint(equalToConstant: 18),
            heartButton.heightAnchor.constraint(equalToConstant: 18)
        ])
        
    }
    
    private func setupSaveButton() {
        let unfilled_bookmark = UIImage(named: "bookmark_unfilled")
        savedButton.backgroundColor = UIColor.white
        savedButton.setImage(unfilled_bookmark, for: .normal)
        savedButton.addTarget(self, action: #selector(savedPost), for: .touchUpInside)
        
        contentView.addSubview(savedButton)
        savedButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            savedButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),
            savedButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            savedButton.widthAnchor.constraint(equalToConstant: 18),
            savedButton.heightAnchor.constraint(equalToConstant: 17)
        ])
        
    }
    
    @objc private func heartUp() {
        self.heartButton.setImage(UIImage(named: "liked_heart3"), for: .normal)
        }
    
    @objc private func savedPost() {
        self.savedButton.setImage(UIImage(named: "bookmark_filled"), for: .normal)
    }
    
}


