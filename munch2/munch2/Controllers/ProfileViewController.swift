//
//  ProfileViewController.swift
//  munch2
//
//  Created by Angelina Chen on 4/27/24.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties (view)
        
    private let nameLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNameLabel()
        view.backgroundColor = UIColor.white
        
    }
    
    private func setupNameLabel() {
        // 3. Configure the view's properties
        nameLabel.text = "Bobby"
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
    
}



