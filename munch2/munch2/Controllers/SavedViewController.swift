//
//  HomeViewController.swift
//  lec-tabviews
//
//  Created by Tiffany Pan on 4/24/24.
//

import UIKit

class SavedViewController: UIViewController {
    
    // MARK: - Properties (view)
    
    // 1. Create the view property
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        // 6. Call setup function
        setupNameLabel()
        setupProfileImageView()
    }
    
    // MARK: - Set Up Views
    
    // 2. Setup the view
    private func setupNameLabel() {
        // 3. Configure the view's properties
        nameLabel.text = "Millie"
        nameLabel.font = .systemFont(ofSize: 24)
        nameLabel.textColor = UIColor.black
        
        // 4. Add view as a subview and enable auto-layout
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 5. Set Up Constraints
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupProfileImageView() {
        profileImageView.image = UIImage(named: "millie")
        profileImageView.contentMode = .scaleAspectFit
        
        view.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 24),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 256),
            profileImageView.widthAnchor.constraint(equalToConstant: 400)
        ])
    }

}


