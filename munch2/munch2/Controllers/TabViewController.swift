//
//  TabViewController.swift
//  lec-tabviews
//
//  Created by Angelina Chen on 4/24/24.
//

import Foundation
import UIKit

class TabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        let homeVC = ViewController()
        let profileVC = ProfileViewController()
        let savedVC = SavedViewController()
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        profileVC.tabBarItem = UITabBarItem(title: "profile", image: UIImage(systemName: "person"), tag: 1)
        savedVC.tabBarItem = UITabBarItem(title: "Saved", image: UIImage(systemName: "bookmark"), tag: 2)
        
        self.setViewControllers([homeVC, profileVC, savedVC], animated: true)
    }
}

