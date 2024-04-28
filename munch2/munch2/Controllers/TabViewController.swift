//
//  TabViewController.swift
//  munch2
//
//  Created by Angelina Chen on 4/27/24.
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
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        profileVC.tabBarItem = UITabBarItem(title: "profile", image: UIImage(systemName: "person"), tag: 1)
        
        self.setViewControllers([homeVC, profileVC], animated: true)
    }
}
